# PS1 on my way
PS1='\[\e[1;32m\]\u@\h: \w$\[\e[0m\] '

# seek forward
stty -ixon

# aliases
alias o="xdg-open" # open
alias md="mkdir" 
# alias sdcc="sdcc-sdcc"
alias finished='notify-send FINISHED "your long process has finished" -u critical -i $MY_LOGO'

# opencv
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

# history for multiple terminal programs such as yakuake, tmux, terminator, etc
# avoid duplicates..
export HISTCONTROL=ignoredups:erasedups  
# append history entries..
shopt -s histappend

# After each command, save and reload history
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"


export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python3:/usr/local/lib/python3/dist-packages

alias tf='cd /var/tmp && rosrun tf view_frames && evince frames.pdf &'
