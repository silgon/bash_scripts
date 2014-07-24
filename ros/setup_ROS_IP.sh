#!/bin/bash

# setting up ROS_IP for computers i work on, this has to be ros distro independent as we are using for all of them
case "$HOSTNAME" in
	# not setting any ROS_IP for the pr2 robots
	"pr2-c1")
		;;
	"pr2-c2")
		;;
    # for everything else assume eth0 exist! modify or create a new case in any other case, for example for wlan0
	*)	
		export ROS_IP=`int-ip eth0`
        if [ -z "$ROS_IP" ]; then ROS_IP=`int-ip wlan0`; fi
		;;
esac
