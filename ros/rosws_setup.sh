#!/bin/bash

DISTRO_DIR=${HOME}/ros/$1

if [ -r ${DISTRO_DIR} ] ; then

    # find workspace directories
    WS_DIRS=`ls -l $DISTRO_DIR | egrep '^d' | awk '{print $9}'`

    # and now loop through the directories to find install and devel spaces
    i=0
    echo "following workspace directoreis found:"
    for WS_DIR in ${WS_DIRS}
    do
	echo "    ${WS_DIR}"
	if [ -r ${HOME}/ros/$1/${WS_DIR}/install/_setup_util.py ]; then
	    STRING=`grep -w "CMAKE_PREFIX_PATH = '" ${HOME}/ros/$1/${WS_DIR}/install/_setup_util.py`
	    NEWSTRING=${STRING:36:-12}
	    let "i += 1"
	    WS_LIST[$i]="${WS_DIR}/install->${NEWSTRING}"
	fi
	if [ -r ${HOME}/ros/$1/${WS_DIR}/devel/_setup_util.py ]; then
	    STRING=`grep -w "CMAKE_PREFIX_PATH = '" ${HOME}/ros/$1/${WS_DIR}/devel/_setup_util.py`
	    NEWSTRING=${STRING:36:-12}
	    let "i += 1"
	    WS_LIST[$i]="${WS_DIR}/devel->${NEWSTRING}"
	fi  
    done

    for WS in ${WS_LIST[*]}
    do
	echo "${WS}"
    done
    unset WS
    unset WS_LIST
    unset WS_DIR
    unset WS_DIRS
    unset STRING
    unset NEWSTRING
else
    echo "given distro $1, not found under ${HOME}/ros"
fi
