#!/usr/bin/env bash

# find out morse install path
source ${BASH_PATH}/morse/morse.sh

# call this script with one argument of the morse version you want to use
if [ -d $MORSE_INSTALL_PATH ]
then
    if [ $# -eq 1 ]
    then
        echoy "please tell me which morse version to use, options are:"
        #echoy $(get_directories "$MORSE_INSTALL_PATH")
        for dir in $(get_directories "$MORSE_INSTALL_PATH") ; do echoy $dir ; done
    elif [ $# -eq 2 ]
    then
        export PATH=${PATH}:$MORSE_INSTALL_PATH/$2/bin
        export MORSE_BLENDER=~/tmp/blender/blender-2.66a/blender
        echog "setting morse to $MORSE_INSTALL_PATH/$2/bin/morse"
    else
        echor "cannot use >1 morse version simultaneously"
    fi
else
    echor "no morse installation found under $MORSE_INSTALL_PATH/$1"
fi
