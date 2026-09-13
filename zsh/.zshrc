# ============================================================
#  ZSH configuration
# ============================================================

# --- 1. Options ---------------------------------------------
unsetopt beep
setopt interactive_comments

# --- 2. History ---------------------------------------------
export HISTFILE=~/.zsh_history
export HISTSIZE=50000
export SAVEHIST=50000

setopt EXTENDED_HISTORY        # record timestamps
setopt INC_APPEND_HISTORY      # write as you go, not only on exit
setopt SHARE_HISTORY           # share between running shells
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE       # leading space = not recorded
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY             # expand !! before running it

# --- 3. Path ------------------------------------------------
typeset -U path PATH           # auto-deduplicate (juliaup keeps prepending)
path=("$HOME/.local/bin" "$HOME/.opencode/bin" $path "$HOME/.julia/bin")

# --- 4. Editor & tooling ------------------------------------
export EDITOR='nvim'
export VISUAL='nvim'

export JULIA_PROJECT="@."

# uv / local tooling environment
[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"

# --- 5. Completion ------------------------------------------
# Skip the slow security check if the cache is less than 24h old.
autoload -Uz compinit
_comp_path="${ZDOTDIR:-$HOME}/.zcompdump"

if [[ -n ${_comp_path}(#qN.mh-24) ]]; then
  compinit -C -d "$_comp_path"          # load blindly from cache (fast)
else
  compinit -i -d "$_comp_path"          # rebuild (once a day)
  touch "$_comp_path"
fi

# Compile to bytecode for extra speed
if [[ -f "$_comp_path" ]] && [[ ! -f "$_comp_path.zwc" || "$_comp_path" -nt "$_comp_path.zwc" ]]; then
  zcompile "$_comp_path"
fi
unset _comp_path

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'   # case-insensitive
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ''

# --- 6. Aliases ---------------------------------------------
alias ls='lsd'
alias ll='lsd -l'
alias la='lsd -la'
alias lt='lsd --tree'

alias v='nvim'
alias vi='nvim'
alias vim='nvim'

alias lg='lazygit'
alias ld='lazydocker'

alias o='xdg-open'
alias open='xdg-open'

alias paraview='flatpak run org.paraview.ParaView'
compdef _files paraview

# Fixes terminfo on remote hosts that don't know xterm-kitty
[[ "$TERM" == xterm-kitty ]] && alias ssh='kitten ssh'

# --- 7. Functions -------------------------------------------
# yazi: quit with `q` to keep the directory, `Q` to discard it
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    IFS= read -r -d '' cwd < "$tmp"
    [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
    rm -f -- "$tmp"
}

# --- 8. Prompt ----------------------------------------------
# Config is read from ~/.config/starship.toml (stow puts it there)
eval "$(starship init zsh)"

# --- 9. Vi mode (keep near the end) -------------------------
# Install: git clone --depth 1 https://github.com/jeffreytse/zsh-vi-mode ~/.zsh/zsh-vi-mode
function zvm_after_init() {
  zmodload zsh/terminfo
  bindkey "${terminfo[kcuu1]}" history-beginning-search-backward
  bindkey "${terminfo[kcud1]}" history-beginning-search-forward
}

[ -f "$HOME/.zsh/zsh-vi-mode/zsh-vi-mode.plugin.zsh" ] \
  && source "$HOME/.zsh/zsh-vi-mode/zsh-vi-mode.plugin.zsh"

# --- 10. Secrets --------------------------------------------
# Keep this file OUT of the dotfiles repo
[ -f ~/.zsh_secrets ] && source ~/.zsh_secrets

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=("$HOME/.juliaup/bin" $path)
export PATH

# <<< juliaup initialize <<<
