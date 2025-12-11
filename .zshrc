unsetopt beep

export KEYTIMEOUT=1 # vi mode esc faster
export STARSHIP_CONFIG=~/.dotfiles/starship.toml

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

bindkey -v
# --------- history ----------
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
zmodload zsh/terminfo
bindkey "${terminfo[kcuu1]}" history-beginning-search-backward
bindkey "${terminfo[kcud1]}" history-beginning-search-forward
# ------------------------------

# Completion
autoload -U compinit
compinit

alias ls='lsd'

alias lg='lazygit'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias oldvim='\vim'

alias docker='sudo docker'

alias code='flatpak run com.visualstudio.code'
alias wezterm='flatpak run org.wezfurlong.wezterm'


# ----- yazi -----
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/home/user/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<
eval "$(starship init zsh)"

