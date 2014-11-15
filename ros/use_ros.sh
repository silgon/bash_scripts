#!/usr/bin/env bash

# find out ros base and install path
source ${BASH_PATH}/ros/ros.sh

# call this script with one, two or three arguments of type
#   first - ros distro, second - worksapce, third - install/devel
if [ -d $ROS_INSTALL_PATH ]
then
    if [ $# -eq 1 ]
    then
        echoy "please tell me which ros-distro to use, options are:"
        for dir in $(get_directories "$ROS_INSTALL_PATH") ; do echoy $dir ; done
    else
        source ${BASH_PATH}/ros/use_distro.sh $2 $3 $4 $5
    fi
else
    echor "no ros distros found under $ROS_INSTALL_PATH"
fi
