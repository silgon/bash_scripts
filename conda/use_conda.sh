#!/usr/bin/env bash

# find out ros base and install path
source ${BASH_PATH}/conda/conda.sh

# this keeps the variable in path
# TODO(silgon): this if should be changed to a smarter way
# seeking for the anaconda path
if [[ -z $OLD_PATH ]]; then
    export OLD_PATH=$PATH
else
    export PATH=$OLD_PATH
fi

# call this script with one, two or three arguments of type
if [ -d $CONDA_INSTALL_PATH ]
then
    if [ $# -eq 1 ]
    then
        export PATH=$CONDA_INSTALL_PATH/2/bin:$PATH
        echog "using version default anaconda 2"
    elif [ $# -eq 2 ]
    then
        export PATH=$CONDA_INSTALL_PATH/$2/bin:$PATH
        export CONDA_VERSION="root"
        export CONDA_DEFAULT_ENV="root"
        echog "using anaconda $2"
    else
        export PATH=$CONDA_BASE_PATH/$2/envs/$3/bin:$PATH
        export CONDA_VERSION="$2"
        export CONDA_DEFAULT_ENV="$3"
        echog "using anaconda $2, environment $3"
    fi
else
    echor "no anaconda versions found under $CONDA_INSTALL_PATH"
fi
