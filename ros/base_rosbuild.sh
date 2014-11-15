#!/usr/bin/env bash

# this script changes on which workspace specific rosbuild workspace should be overlayed
# call with one argument of distro when you want to base directly on distro
# call this script with three arguemtns, first distro, second is catkinized ws and third is type

# first argument should be ros distro

# checking if asked ros distro is installed
if [ -r /opt/ros/$1/setup.bash ]; then
    if [ $# -eq 1 ]; then
	if [ -r ${HOME}/ros/$1/rosbuild_ws/.rosinstall ]; then
	    new_line="- setup-file: {local-name: \/opt\/ros\/$1\/setup.bash}"
	    perl -pi.bak -e "s/.*/$new_line/ if $. == 6" ${HOME}/ros/$1/rosbuild_ws/.rosinstall
	    new_line=$(echo ${new_line} | tr -d '\\')
	    echog "updated ${HOME}/ros/$1/rosbuild_ws/.rosinstall with $new_line"
	    unset new_line
	else
	    echor "error: ${HOME}/ros/$1/rosbuild_ws/.rosinstall does not exist"
	fi
    elif [ $# -eq 3 ]; then
	if [ -r ${HOME}/ros/$1/rosbuild_ws/.rosinstall ]; then
	    if [ -r ${HOME}/ros/$1/$2_ws/$3/setup.bash ]; then
		new_home=$(echo ${HOME} | sed 's/\//\\\//g')
		new_line="- setup-file: {local-name: ${new_home}\/ros\/$1\/$2_ws\/$3\/setup.bash}"
		perl -pi.bak -e "s/.*/$new_line/ if $. == 6"  ${HOME}/ros/$1/rosbuild_ws/.rosinstall
		unset new_home
		new_line=$(echo ${new_line} | tr -d '\\')
		echog "updated ${HOME}/ros/$1/rosbuild_ws/.rosinstall with $new_line"
		unset new_line
	    else
		echor "error ${HOME}/ros/$1/$2_ws/$3/setup.bash does not exist"
	    fi
	else
	    echor "error: ${HOME}/ros/$1/rosbuild_ws/.rosinstall does not exist"
	fi
    else
	echoy "usage: base_rosbuild distro [name_ws {devel/install}]\n you  must provide 1 or 3 arguments"
    fi
else
    	echor "ros $1 setup.bash not found at /opt/ros/$1/"
fi
