
# User configuration

export STARSHIP_CONFIG=~/.dotfiles/starship.toml

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# Completion
autoload -U compinit
compinit

alias lg='lazygit'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias oldvim='\vim'

alias code='flatpak run com.visualstudio.code'
# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/home/user/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<
eval "$(starship init zsh)"
