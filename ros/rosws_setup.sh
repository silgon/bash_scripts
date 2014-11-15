#!/usr/bin/env bash

# function to get the full path on which current ws is overlayed
function get_overlay {
    # check if setup file exist undre current ws
    if [ -r $1/$2/_setup_util.py ]; then
        # get the full overlay path and echo it
        STRING=`grep -w "CMAKE_PREFIX_PATH = " $1/$2/_setup_util.py`
        NEWSTRING=${STRING:36:-11}
        echog "$2 -> ${NEWSTRING}"
    fi

    # cleaning up
    unset STRING
    unset NEWSTRING
}

# get full path where the ws are stored
DISTRO_DIR=${HOME}/ros/$1

if [ -r ${DISTRO_DIR} ] ; then

    # find workspace directories
    for WS_DIR in ${DISTRO_DIR}/*
    do
        if [[ -d $WS_DIR  ]]; then
            echob $WS_DIR
            get_overlay $WS_DIR install
            get_overlay $WS_DIR devel
            echo ""
        fi
    done

    # cleaning up
    unset DISTRO_DIR
    unset WS_DIR

else
    echor "given distro $1, not found under ${HOME}/ros"
fi
