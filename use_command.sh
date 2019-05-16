#!/usr/bin/env bash

MODULES="morse ros conda docker"

# the use function
function use {
    #echo "The number of positional parameter : $#"
    #echo "All parameters or arguments passed to the function: '$@'"
    if [ $# -eq 0 ]
    then
        echo "use TAB to see what \"use\" function does ;)"
    elif [ $# -ge 1 ]
    then
        source $BASH_PATH/$1/use_$1.sh
    fi
}

# tab completion calculation function
_use_complete()
{
    # fill local variable with a list of completions (top-level plugins)
    local COMPLETES=$MODULES

    # put the completions into $COMPREPLY using compgen
    if [ $COMP_CWORD -eq 1 ]
    then
        COMPREPLY=( $(compgen -W "$COMPLETES" -- ${COMP_WORDS[COMP_CWORD]}) )
    else
        if [ -f $BASH_PATH/${COMP_WORDS[1]}/tab_completion.sh ]
        then
            source $BASH_PATH/${COMP_WORDS[1]}/tab_completion.sh ${COMP_WORDS[@]:1:${#COMP_WORDS[@]}}
        else
            COMPLETES=""
        fi
    fi

    COMPREPLY=( $(compgen -W "$COMPLETES" -- ${COMP_WORDS[COMP_CWORD]}) )
    return 0
}

# get completions for command 'use' from function '_use_complete()'
complete -F _use_complete use
