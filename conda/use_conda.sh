#!/usr/bin/env bash

# find out ros base and install path
source ${BASH_PATH}/conda/conda.sh

# call this script with one, two or three arguments of type
#   first - ros distro, second - worksapce, third - install/devel
if [ -d $CONDA_INSTALL_PATH ]
then
    if [ $# -eq 1 ]
    then
        export PATH=$PATH:$CONDA_INSTALL_PATH/2/bin
        echog "using version default anaconda 2"
    elif [ $# -eq 2 ]
    then
        export PATH=$PATH:$CONDA_INSTALL_PATH/$2/bin
        echog "using anaconda $2"
    else
        export PATH=$PATH:$CONDA_BASE_PATH/$2/envs/$3/bin
        export CONDA_DEFAULT_ENV=$3
        echog "using anaconda $2, environment $3"
    fi
else
    echor "no anaconda versions found under $CONDA_INSTALL_PATH"
fi
