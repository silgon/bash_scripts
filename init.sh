#!/bin/bash
# delete default files
rm ~/.bashrc ~/.profile ~/.octaverc ~/.screenrc ~/.tmux.conf 2> /dev/null
# save current directory and go to home
DIR=`pwd`
cd ~
# create links
ln -s ${DIR}/.bashrc
ln -s ${DIR}/.profile
ln -s ${DIR}/.octaverc
ln -s ${DIR}/.screenrc
ln -s ${DIR}/.tmux.conf
