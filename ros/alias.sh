#!/usr/bin/env bash

export ROBOT=sim # simulation unless declare - command below
# set all ros related aliases here
alias master_pr2="export ROS_MASTER_URI=http://pr2-c1:11311; unset ROBOT"
alias master_sim="export ROS_MASTER_URI=http://localhost:11311"
alias master_none="unset ROS_MASTER_URI"
