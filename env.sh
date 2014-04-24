# PS1 on my way
PS1='\[\e[1;32m\]\u@\h: \w$\[\e[0m\] '

# seek forward
stty -ixon

# aliases
alias o="xdg-open" # open
alias md="mkdir" 
# alias sdcc="sdcc-sdcc"
alias finished='notify-send FINISHED "your long process has finished" -u critical -i $MY_LOGO'

# opencv
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib


# To be changed for a better use
if [ -f ~/catkin_ws/devel/setup.sh ]; then
	source /opt/ros/groovy/setup.bash
    source ~/catkin_ws/devel/setup.sh
elif [ -f /opt/ros/groovy/setup.bash ]; then
	source /opt/ros/groovy/setup.bash
fi

export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:~/ros_ws:~/m2_stage:~/hri
export ROBOT=sim

if [ -f ~/Dropbox/programming/linux/.bashrc ]; then
    source ~/Dropbox/programming/linux/.bashrc
fi
export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python3:/usr/local/lib/python3/dist-packages
alias tf='cd /var/tmp && rosrun tf view_frames && evince frames.pdf &'
