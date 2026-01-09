#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
eval "$(starship init bash)"ROMPT_COMMAND=set_bash_prompt
export PATH="$PATH:~/.cargo/bin"
export PATH="$HOME/.local/bin:$PATH"

alias dnic='bat ~/dotnotes/imp_commands.txt'
alias dnin='bat ~/dotnotes/imp_notes.txt'
alias wa-fix='ffmpeg -i "$1" -c:v libx264 -profile:v main -pix_fmt yuv420p -movflags +faststart -c:a aac -b:a 128k "${1%.mp4}-wa.mp4"'
