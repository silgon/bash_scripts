#!/usr/bin/env bash

# this file should set the COMPLETES variable

# find out morse install path
source ${BASH_PATH}/morse/morse.sh

# list directoris belwo install path
if [ -d $MORSE_INSTALL_PATH -a $# -le 2 ]
then
    COMPLETES=$(get_directories "$MORSE_INSTALL_PATH")
    for i in $COMPLETES
        do
            if [ "$i" == "$2" ] ; then
                COMPLETES=""
                break;
            fi
        done
else
    COMPLETES=""
fi
