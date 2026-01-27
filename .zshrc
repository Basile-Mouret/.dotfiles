unsetopt beep
setopt interactive_comments
export TERM_PROGRAM="WezTerm"
# --- Environment ---
export STARSHIP_CONFIG=~/.dotfiles/starship.toml
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

# --- Editor Setup ---
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# --- Aliases ---
alias ls='lsd'
alias lg='lazygit'
alias ld='lazydocker'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias oldvim='\vim'

alias docker='sudo docker'
alias code='flatpak run com.visualstudio.code'
alias wezterm='flatpak run org.wezfurlong.wezterm'
alias qutebrowser='flatpak run org.qutebrowser.qutebrowser'

# --- Functions ---
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    IFS= read -r -d '' cwd < "$tmp"
    [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
    rm -f -- "$tmp"
}

# --- Completion ---
autoload -U compinit
compinit

# --- Juliaup ---
path=('/home/user/.juliaup/bin' $path)
export PATH

# --- Starship Prompt ---
eval "$(starship init zsh)"

# --- ZSH VI MODE SETTINGS ---
# Define custom bindings inside this function so the plugin doesn't wipe them
function zvm_after_init() {
  zmodload zsh/terminfo
  bindkey "${terminfo[kcuu1]}" history-beginning-search-backward
  bindkey "${terminfo[kcud1]}" history-beginning-search-forward
}

# Source the plugin (Must be near the end)
source $HOME/.zsh/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# Load local env last
. "$HOME/.local/bin/env"

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/home/user/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<
