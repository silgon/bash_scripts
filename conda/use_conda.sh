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
        export PATH=$CONDA_INSTALL_PATH/bin:$PATH
        export CONDA_DEFAULT_ENV="base"
        echog "using version default anaconda"
    else
        export PATH=$CONDA_INSTALL_PATH/bin:$PATH
        export PATH=$CONDA_BASE_PATH/envs/$2/bin:$PATH
        export CONDA_DEFAULT_ENV="$2"
        echog "using anaconda $2, environment $3"
    fi
    export CONDA_VERSION=$(python --version  2>&1  | grep -oP "\d\.\d")

else
    echor "no anaconda versions found under $CONDA_INSTALL_PATH"
fi
