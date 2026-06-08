#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='colorls'
alias grep='grep --color=auto'
alias so='clear && source ~/.bashrc && fastfetch'
alias cl='clear'
alias base='tmux new -As base'
alias workspace='tmux new -As workspace'

PS1='\e[31m\]➜  \e[33m\]\u@\h \e[35m\]\W \e[0m\]\$ '

export PATH="$PATH:~/.cargo/bin"
export PATH="$HOME/.local/bin:$PATH"
export EDITOR=nvim
export BAT_PAGER="less -R --incsearch"
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export PATH="$HOME/.config/emacs/bin:$PATH"
export VIMRUNTIME=~/workspace/neovim/runtime

# if [[ $- == *i* ]]; then
#   fastfetch
# fi

source /usr/share/nvm/init-nvm.sh

