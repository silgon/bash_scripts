# new PS1 with git and conda
__conda_ps1() {
    if [ -z "$CONDA_DEFAULT_ENV" ]; then
        return
    fi
    if [[ $# -eq 0 ]] ; then
        echo "$CONDA_DEFAULT_ENV"
    else
        printf "$1" "$CONDA_VERSION" "$CONDA_DEFAULT_ENV"
    fi
}
__ssh_ps1(){
    if [ -z "$SSH_CLIENT" ] && [ -z "$SSH_CONNECTION" ]; then
        return
    fi
    if [[ $# -eq 0 ]] ; then
        echo "ssh"
    else
        printf "$1" "ssh"
    fi
}

# PS1='\[\e[30;1m\]\[\033(0\]lr\[\033(B\](\u@\h$(__ssh_ps1 ":%s-mode"))\[\e[38;5;39m\] $(__git_ps1 "git:%s")\[\e[38;5;35m\] $(__conda_ps1 "conda%s:%s") \n\[\e[30;1m\]\[\033(0\]m\[\033(B\] \[\e[1;32m\]\w $\[\e[0m\] '
PS1='\[\e[0;37m\]\[\033(0\]lr\[\033(B\](\u@\h$(__ssh_ps1 ":%s-mode"))\[\e[38;5;39m\] $(__git_ps1 "git:%s")\[\e[38;5;35m\] $(__conda_ps1 "conda%s:%s") \n\[\e[0;37m\]\[\033(0\]m\[\033(B\] \[\e[1;32m\]\w $\[\e[0m\] '

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

# nice commands
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias copyimg='xclip -selection clipboard -t image/png -i'
# alias sdcc="sdcc-sdcc"
alias finished='notify-send FINISHED "your long process has finished" -u critical -i $MY_LOGO'
alias tmux="TERM=xterm-256color tmux" # tmux with colors
alias r="ranger"
# opencv
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

# # history for multiple terminal programs such as yakuake, tmux, terminator, etc
# # avoid duplicates..
# export HISTCONTROL=ignoredups:erasedups  
# # append history entries..
# shopt -s histappend
HISTSIZE=-1
HISTFILESIZE=-1
## Dictionaries
alias ded="dict -d fd-eng-deu"
alias dde="dict -d fd-deu-eng"
alias def="dict -d fd-eng-fra"
alias dfe="dict -d fd-fra-eng"
alias tsed="trans en:de"
alias tsde="trans de:en"
alias tsef="trans en:fr"
alias tsfe="trans fr:en"


# # After each command, save and reload history
# export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"
pdflatex(){ 
    docker run -u $UID -v $PWD:/ws -w /ws --rm mirisbowring/texlive_ctan_full:2019 pdflatex $@
}