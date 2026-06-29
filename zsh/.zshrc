export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

alias so='source ~/.zshrc && clear && fastfetch'
alias cl='clear'
alias dev='tmux new -As dev'
alias base='tmux new -As base'

# ZSH_THEME="robbyrussell"
# ZSH_THEME="kafeitu"
# ZSH_THEME="kphoen"
# ZSH_THEME="gianu"
# ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git)

export LANG=en_US.UTF-8

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias ls='ls --color=auto'
bindkey '^H' backward-kill-word

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# [[ ! -f ~/.dotfiles/zsh/.p10k.zsh ]] || source ~/.dotfiles/zsh/.p10k.zsh

eval "$(starship init zsh)"
