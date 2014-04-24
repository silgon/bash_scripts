#!/bin/bash

# call this script with the argument of distro you want to use, base setup.bash will be
# sourced.

# call this script with two arguments where first is distro and second is type (from
# [devel, install, rosbuild, ws]). note that here catkin workspace will be used when only
# called with option devel|install. also note that devel type will be used when only
# workspace is given.

# call this script with three arguemtns where first is distro, second is workspace and
# third is type (from [devel, install])

##### setting up ros distro by checking ws in this order: rosbuild_ws -> catkin_ws -> distro

# checking if asked ros distro is installed
if [ -r /opt/ros/$1/setup.bash ]; then

    # if called without any arguments other than distro, then just use /opt/ros/distro/setup.bash
    if [ $# == 1 ]; then
	source /opt/ros/$1/setup.bash
	echog "sourcing /opt/ros/$1/setup.bash"

    # 1 additional argument > look for workspaces and source setup inside them
    elif [ $# == 2 ]; then
	if [[ $2 == 'devel' || $2 == 'install' ]]; then
	    if [ -r ${HOME}/ros/$1/catkin_ws/$2/setup.bash ]; then
		source ${HOME}/ros/$1/catkin_ws/$2/setup.bash
		echog "sourcing ${HOME}/ros/$1/catkin_ws/$2/setup.bash"
	    else
		echor "error: ${HOME}/ros/$1/catkin_ws/$2/setup.bash does not exist"
	    fi
	else
	    if [ -r ${HOME}/ros/$1/$2_ws/devel/setup.bash ]; then
		source ${HOME}/ros/$1/$2_ws/devel/setup.bash
		echog "sourcing ${HOME}/ros/$1/$2_ws/devel/setup.bash"
	    else
		echor "error: ${HOME}/ros/$1/$2_ws/devel/setup.bash does not exist"
	    fi
	fi

    # 2 additional arguments > look for workspaces and source setup inside them
    elif [ $# -eq 3 ]; then
	if [ -r ${HOME}/ros/$1/$2_ws/$3/setup.bash ]; then
	    source ${HOME}/ros/$1/$2_ws/$3/setup.bash
	    echog "sourcing ${HOME}/ros/$1/$2_ws/$3/setup.bash"
	else
	    echor "error: ${HOME}/ros/$1/$2_ws/$3/setup.bash does not exist"
	fi

    else
	echor "error: please call use_$1 with only 1 or 2 arguments"
    fi

    # when we are on pr2, also source pr2 related stuff
    if [ "${ROBOT}" == "pr2" ]; then
	source ${HOME}/.bash_scripts/ros/pr2_distro.sh $1
    fi

# report when ros distro is not found
else
    echor "error: ros $1 setup.bash not found at /opt/ros/$1/"
fi
