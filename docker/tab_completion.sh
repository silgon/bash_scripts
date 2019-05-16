#!/usr/bin/env bash

# this file should set the COMPLETES variable

# find out ros base and install path
source ${BASH_PATH}/conda/conda.sh

# list directoris belwo install path
if [ $COMP_CWORD -eq 2 -a -d $CONDA_INSTALL_PATH ] ; then
    COMPLETES=$( echo default; for i in /opt/docker/*.socket; do echo `basename ${i%.socket}`; done )
    COMPREPLY=( $(compgen -W "$COMPLETES" -- ${COMP_WORDS[COMP_CWORD]}) )
else
    COMPLETES=""
fi
