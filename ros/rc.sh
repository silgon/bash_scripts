#!/bin/bash

# adding functions for selecting ros distro

alias use_fuerte="source ${HOME}/.bash_scripts/ros/use_distro.sh fuerte"

function use_groovy {
    use_ros_distro_special groovy $1 $2 $3
}

function use_hydro {
    use_ros_distro_special hydro $1 $2 $3
}

function use_indigo {
    use_ros_distro_special indigo $1 $2 $3
}

function use_ros_distro_special {
    # workaround as loading groovy and hydro  messes up with python2
    export PYTHONPATH_BK=$PYTHONPATH
    export PYTHONPATH=""

    # as starting a distro rewrites ROS_PACKAGE_PATH need to save it
    export ROS_PACKAGE_PATH_BK=$ROS_PACKAGE_PATH
    export ROS_PACKAGE_PATH=""

    # now finally setup groovy or hydro
    source ${HOME}/.bash_scripts/ros/use_distro.sh $1 $2 $3

    # reapply saved variables
    export PYTHONPATH=$PYTHONPATH_BK:$PYTHONPATH
    export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH_BK:$ROS_PACKAGE_PATH

    # unset temporary variables
    unset PYTHONPATH_BK
    unset ROS_PACKAGE_PATH_BK
}

export ROBOT=sim # simulation unless declare - command below
alias master_pr2="export ROS_MASTER_URI=http://pr2-c1:11311; unset ROBOT"
alias master_sim="export ROS_MASTER_URI=http://localhost:11311"
alias master_none="unset ROS_MASTER_URI"
