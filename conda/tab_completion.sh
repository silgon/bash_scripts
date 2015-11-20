#!/usr/bin/env bash

# this file should set the COMPLETES variable

# find out ros base and install path
source ${BASH_PATH}/conda/conda.sh

# list directoris belwo install path
if [ $# -le 2 -a -d $CONDA_INSTALL_PATH ] ; then
    COMPLETES=$(get_directories "$CONDA_INSTALL_PATH")
    for i in $COMPLETES
        do
            if [ "$i" == "$2" ] ; then
                COMPLETES=$(get_directories "$CONDA_BASE_PATH/$2/envs")
                break;
            fi
        done
else
    COMPLETES=""
fi
