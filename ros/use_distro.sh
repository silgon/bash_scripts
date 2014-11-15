#!/usr/bin/env bash

# call this script with the argument of distro you want to use, base setup.bash will be
# sourced.

# call this script with two arguments where first is distro and second is type (from
# [devel, install, rosbuild, ws]). note that here catkin workspace will be used when only
# called with option devel|install. also note that devel type will be used when only
# workspace is given.

# call this script with three arguemtns where first is distro, second is workspace and
# third is type (from [devel, install])

##### setting up ros distro by checking ws in this order: rosbuild_ws -> catkin_ws -> distro

# find out ros base and install path
#source ${BASH_PATH}/ros/ros.sh

distro_found=true

# checking if asked ros distro is installed
if [ -r $ROS_INSTALL_PATH/$1/setup.bash ]; then

    # if called without any arguments other than distro, then just use $ROS_INSTALL_PATH/distro/setup.bash
    if [ $# == 1 ]
    then
        source $ROS_INSTALL_PATH/$1/setup.bash
        echog "sourcing $ROS_INSTALL_PATH/$1/setup.bash"

    # 1 additional argument -> look for workspaces and source setup inside them
    elif [ $# == 2 ]
    then
        # check for special rosbuild_ws
        if [ $2 == 'rosbuild_ws' ]; then
            if [ -r $ROS_BASE_PATH/$1/rosbuild_ws/setup.bash ]; then
                source $ROS_BASE_PATH/$1/rosbuild_ws/setup.bash
                echog "sourcing $ROS_BASE_PATH/$1/rosbuild_ws/setup.bash"
            else
                echor "error: $ROS_BASE_PATH/$1/rosbuild_ws/setup.bash does not exist"
            fi
        else
            if [ -d $ROS_BASE_PATH/$1/$2 ]
            then
                # prefer devel over install workspace, when not specified
                if [ -r $ROS_BASE_PATH/$1/$2/devel/setup.bash ]; then
                    source $ROS_BASE_PATH/$1/$2/devel/setup.bash
                    echog "sourcing $ROS_BASE_PATH/$1/$2/devel/setup.bash"
                elif [ -r $ROS_BASE_PATH/$1/$2/install/setup.bash ]; then
                    source $ROS_BASE_PATH/$1/$2/install/setup.bash
                    echog "sourcing $ROS_BASE_PATH/$1/$2/install/setup.bash"
                else
                    echor "error: plase first build the $ROS_BASE_PATH/$1/$2"
                fi
            else
                echor "given workspace $2 does not exit under $ROS_BASE_PATH/$1"
            fi
        fi

    # 2 additional arguments -> look for workspaces and source setup inside them
    elif [ $# -eq 3 ]; then
        if [ -d $ROS_BASE_PATH/$1/$2 ]
        then
            if [ -r $ROS_BASE_PATH/$1/$2/$3/setup.bash ]; then
                source $ROS_BASE_PATH/$1/$2/$3/setup.bash
                echog "sourcing $ROS_BASE_PATH/$1/$2/$3/setup.bash"
            else
                echor "error: $ROS_BASE_PATH/$1/$2/$3/setup.bash does not exist"
            fi
        else
                echor "given workspace $2 does not exit under $ROS_BASE_PATH/$1"
        fi
    else
        echor "error: too many arguments"
        echo "usage: use ros distro_name workspace_name devel/install"
    fi

    # when we are on pr2, also source pr2 related stuff
    if [ "${ROBOT}" == "pr2" ]; then
        source ${BASH_PATH}/ros/pr2_distro.sh $1
    fi
# report when ros distro is not found
else
    echor "$1 distro not found at $ROS_INSTALL_PATH/$1"
    distro_found=false
fi

# also setup ROS_IP if ros distro is found
if [ distro_found ]; then
    source ${BASH_PATH}/ros/setup_ROS_IP.sh
fi
unset distro_found
