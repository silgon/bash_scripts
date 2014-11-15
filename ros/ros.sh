#!/usr/bin/env bash

# function for re-basing rosbuild workspace on some other workspace
function base_rosbuild {
    if [[  $# -eq 1  ||  $# -eq 3 ]]; then
       source ${BASH_PATH}/ros/base_rosbuild.sh $1 $2 $3
    else
       echor "error: you must provide 1 or 3 arguments"
       echoy "usage: base_rosbuild distro [name_ws {devel/install}]"
    fi
}

function ws_overlays {
    source ${HOME}/.bash_scripts/ros/rosws_setup.sh $1
}

# set aliases for ros
source ${BASH_PATH}/ros/alias.sh
source ${BASH_PATH}/ros/ros_common_functions.sh

# path where ros distros are installed (default one is usually correct)
export ROS_INSTALL_PATH=/opt/ros

# path where ros development is done
export ROS_BASE_PATH=${HOME}/ros
