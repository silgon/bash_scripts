#!/usr/bin/env bash

# this file should set the COMPLETES variable

# find out ros base and install path
source ${BASH_PATH}/ros/ros.sh

# list directoris belwo install path
if [ $# -le 2 -a -d $ROS_INSTALL_PATH ] ; then
    COMPLETES=$(get_directories "$ROS_INSTALL_PATH")
    for i in $COMPLETES
        do
            if [ "$i" == "$2" ] ; then
                COMPLETES=$(get_workspaces "$ROS_BASE_PATH/$2")
                break;
            fi
        done
elif [ $# -le 3 -a -d $ROS_BASE_PATH ] ; then
    COMPLETES=$(get_workspaces "$ROS_BASE_PATH/$2")
    for i in $COMPLETES
        do
            if [ "$i" == "$3" ] ; then
                COMPLETES=$(get_ws_setup "$ROS_BASE_PATH/$2/$3")
                break;
            fi
        done
elif [ $# -le 4 -a -d $ROS_BASE_PATH ] ; then
    COMPLETES=$(get_ws_setup "$ROS_BASE_PATH/$2/$3")
    for i in $COMPLETES
        do
            if [ "$i" == "$4" ] ; then
                COMPLETES=""
                break;
            fi
        done
else
    COMPLETES=""
fi
