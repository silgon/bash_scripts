# new PS1 with git
PS1='\[\e[1;32m\]\u@\h: \w\[\e[38;5;39m\]$(__git_ps1 " -%s-")\[\e[1;32m\] $\[\e[0m\] '
# check if connected through ssh
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_CONNECTION" ]; then
	PS1='\[\e[38;5;75m\]\u@\h: \w\[\e[38;5;149m\]$(__git_ps1 " -%s-")\[\e[38;5;75m\] $\[\e[0m\] '
fi
# seek forward
#stty -ixon
[[ $- == *i* ]] && stty -ixon

# aliases
alias o="xdg-open" # open
alias md="mkdir" 
mdd(){ 
    mkdir -p $1
    cd $1
}

# alias sdcc="sdcc-sdcc"
alias finished='notify-send FINISHED "your long process has finished" -u critical -i $MY_LOGO'
alias tmux="TERM=xterm-256color tmux" # tmux with colors
# opencv
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

# # history for multiple terminal programs such as yakuake, tmux, terminator, etc
# # avoid duplicates..
# export HISTCONTROL=ignoredups:erasedups  
# # append history entries..
# shopt -s histappend

# # After each command, save and reload history
# export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"
