# Path of the project
BASH_PATH=$HOME/.silgon
# My logo for the display in alerts
MY_LOGO=$HOME/.silgon/img/silgon_white_logo.png


# modified default configuration (.bashrc) of ubuntu (like ls, grep, color and more)
if [ -f $BASH_PATH/ubuntu_default.sh ]; then
	source $BASH_PATH/ubuntu_default.sh; fi

# other commands
if [ -f $BASH_PATH/env.sh ]; then
	source $BASH_PATH/env.sh; fi

# morse
if [ -f $BASH_PATH/morse/rc.sh ]; then
	source $BASH_PATH/morse/rc.sh; fi


## from here on it's in a private repository
# some private commands
if [ -f $BASH_PATH/priv_conf/commands.sh ]; then
	source $BASH_PATH/priv_conf/commands.sh; fi

# config of the servers I use
if [ -f $BASH_PATH/priv_conf/servers.sh ]; then
	source $BASH_PATH/priv_conf/servers.sh; fi


# functions
if [ -f $BASH_PATH/functions/sn-functions ]; then
        source $BASH_PATH/functions/sn-functions; fi
