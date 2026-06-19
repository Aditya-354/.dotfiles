#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias cls='colorls'
alias ls='ls --color=auto'
alias ll='ls -hAl'
alias grep='grep --color=auto'
alias so='clear && source ~/.bashrc && fastfetch'
alias cl='clear'
alias cpp='~/scripts/./cpp'
alias bin='~/scripts/./bin'

# PS1='\[\e[33m\e[1m\]\u@\h: \[\e[34m\]\W \[\e[0m\]\$ '
# ➜
export PATH="$PATH:~/.cargo/bin"
export PATH="$HOME/.local/bin:$PATH"
export EDITOR=nvim
export BAT_PAGER="less -R --incsearch"
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export PATH="$HOME/.config/emacs/bin:$PATH"
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export MANPAGER="nvim +Man!"
# export VIMRUNTIME=~/workspace/neovim/runtime

# if [[ $- == *i* ]]; then
#   fastfetch
# fi

source /usr/share/nvm/init-nvm.sh
# eval "$(oh-my-posh init bash --config emodipt-extend)"
# eval "$(oh-my-posh init bash --config emodipt-extend)"

# source ~/.bash/themes/aphrodite/aphrodite.theme.sh
eval "$(starship init bash)"
