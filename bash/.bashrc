#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias so='source ~/.bashrc'
# PS1='[\u@\h \W]\$ '
PS1='\n  \[\e[32m\][\u@\h]\[\e[0m\]:\[\e[38;2;100;150;255m\]$(minipro)\[\e[0m\] \n-> '
# eval "$(starship init bash)"ROMPT_COMMAND=set_bash_prompt
export PATH="$PATH:~/.cargo/bin"
export PATH="$HOME/.local/bin:$PATH"
export EDITOR=nvim
export BAT_PAGER="less -R --incsearch"
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export PATH="$HOME/.config/emacs/bin:$PATH"

if [[ $- == *i* ]]; then
  fastfetch
fi

source /usr/share/nvm/init-nvm.sh
# eval "$(oh-my-posh init bash --config ~/.cache/oh-my-posh/themes/kali.omp.json)"
