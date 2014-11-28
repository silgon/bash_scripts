# Path of the project
BASH_PATH=$(dirname `readlink -f ${BASH_SOURCE[0]}`)
# My logo for the display in alerts
MY_LOGO=$BASH_PATH/img/silgon_white_logo.png

# modified default configuration (.bashrc) of ubuntu (like ls, grep, color and more)
if [ -f $BASH_PATH/ubuntu_default.sh ]; then
	source $BASH_PATH/ubuntu_default.sh; fi

# other commands
if [ -f $BASH_PATH/env.sh ]; then
	source $BASH_PATH/env.sh; fi

# morse
if [ -f $BASH_PATH/morse/rc.sh ]; then
	source $BASH_PATH/morse/rc.sh; fi
# ros
if [ -f $BASH_PATH/ros/ros.sh ]; then
	source $BASH_PATH/ros/ros.sh; fi
# use command
if [ -f $BASH_PATH/use_command.sh ]; then
	source $BASH_PATH/use_command.sh; fi

# functions
if [ -f $BASH_PATH/functions/sn-functions ]; then
        source $BASH_PATH/functions/sn-functions; fi

# load my private config
BASH_PATH_PRIV=$BASH_PATH/../.bash_scripts_priv
if [ -f $BASH_PATH_PRIV/env.sh ]; then
	source $BASH_PATH_PRIV/env.sh; fi

# .bashrc2 is for particular configurations of each computer
# in the end because it can override everything else
if [ -f "$HOME/.bashrc2" ]; then
	. "$HOME/.bashrc2"
fi
