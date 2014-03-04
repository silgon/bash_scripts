#!/bin/bash
# delete default files
rm ~/.bashrc ~/.profile
# save current directory and go to home
DIR=`pwd`
cd ~
# create links
ln -s ${DIR}/.bashrc
ln -s ${DIR}/.profile
ln -s ${DIR}/.octaverc
ln -s ${DIR}/.screenrc
