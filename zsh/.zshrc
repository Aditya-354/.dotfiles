export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
ZSH=/usr/share/oh-my-zsh/

alias so='source ~/.zshrc && clear && fastfetch'
alias cl='clear'
alias dev='tmux new -As dev'
alias projects='tmux new -As projects'
alias gdc='git add . && git commit -m "." && git push'
alias cpp='~/scripts/./cpp.bash'
alias bin='~/scripts/./bin.bash'
alias pd='~/scripts/./pd.bash'
alias scd='cd $(fzf --walker=dir,hidden,follow --walker-root=/home/asrwx)'

ZSH_THEME="robbyrussell"
# ZSH_THEME="kafeitu"
# ZSH_THEME="kphoen"
# ZSH_THEME="gianu"
# ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git)

export LANG=en_US.UTF-8
export MANPAGER="nvim +Man!"

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

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

# eval "$(starship init zsh)"
