# --- 1. Environment & Options ---
unsetopt beep
setopt interactive_comments

# Hint: WezTerm usually sets this automatically, but keeping it is fine.
export TERM_PROGRAM="WezTerm"

export STARSHIP_CONFIG=~/.dotfiles/starship.toml
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

# --- 2. Path & Editor ---
# Prepending paths is faster than appending if you want them to take priority
path=('/home/user/.juliaup/bin' '/home/user/.opencode/bin' $path)
export PATH="$PATH:$HOME/.julia/bin"

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Load local env last
[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"

# --- 3. Completion (OPTIMIZED) ---
# This block replaces the standard 'compinit' call.
# It checks if the cache is fresh (less than 24h old).
# If fresh, it skips the slow security checks and disk reads.

autoload -Uz compinit
_comp_path="${ZDOTDIR:-$HOME}/.zcompdump"

# Check if .zcompdump exists and is younger than 24 hours (#qN.mh-24)
if [[ -n ${_comp_path}(#qN.mh-24) ]]; then
  # Load blindly from cache (FAST)
  compinit -C -d "$_comp_path"
else
  # Rebuild cache (SLOW - happens once a day)
  compinit -i -d "$_comp_path"
  touch "$_comp_path"
fi

# Compile the cache to bytecode for extra speed
if [[ -f "$_comp_path" ]] && [[ ! -f "$_comp_path.zwc" || "$_comp_path" -nt "$_comp_path.zwc" ]]; then
  zcompile "$_comp_path"
fi

# --- 4. Aliases ---
alias ls='lsd'
alias lg='lazygit'
alias ld='lazydocker'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias oldvim='\vim'

alias docker='sudo docker'
alias qutebrowser='flatpak run org.qutebrowser.qutebrowser'

# --- 5. Functions ---
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    IFS= read -r -d '' cwd < "$tmp"
    [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
    rm -f -- "$tmp"
}

# --- 6. Starship Prompt ---
# Optimization Tip: 'eval' spawns a subshell. This is usually fast enough (20ms),
# but if you want to shave more time, you can generate the script to a file once
# and source that file instead.
eval "$(starship init zsh)"

# --- 7. ZSH VI MODE (Must be last) ---
function zvm_after_init() {
  zmodload zsh/terminfo
  bindkey "${terminfo[kcuu1]}" history-beginning-search-backward
  bindkey "${terminfo[kcud1]}" history-beginning-search-forward
}

source $HOME/.zsh/zsh-vi-mode/zsh-vi-mode.plugin.zsh
