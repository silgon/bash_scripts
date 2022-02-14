#!/usr/bin/env bash

source ${BASH_PATH}/conda/conda.sh
source <(${CONDA_INSTALL_PATH}/bin/conda shell.bash hook| sed '$d')



# this keeps the variable in path
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
        export CONDA_DEFAULT_ENV="base"
        eval "$(__conda_exe shell.posix activate | sed '/PS1=/d')"
        echog "using version default anaconda"
    else
        export CONDA_DEFAULT_ENV="$2"
        eval "$(__conda_exe shell.posix activate $2 | sed '/PS1=/d')"
        echog "using anaconda $2, environment $3"
    fi
    export CONDA_VERSION=$(python --version  2>&1  | grep -oP "\d\.\d")

else
    echor "no anaconda versions found under $CONDA_INSTALL_PATH"
fi
