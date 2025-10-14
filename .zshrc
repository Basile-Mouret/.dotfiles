
# User configuration

export KEYTIMEOUT=1 # vi mode esc faster

export STARSHIP_CONFIG=~/.dotfiles/starship.toml

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# --------- history ----------
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
# Bind up and down arrows to history search
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[OA" history-beginning-search-backward-end
bindkey "^[OB" history-beginning-search-forward-end
bindkey "^[OA" history-beginning-search-backward-end
bindkey "^[OB" history-beginning-search-forward-end

# ------------------------------
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
