#!/usr/bin/env bash

# by convention all ros workspaces are post
function get_workspaces {
    if [ $1 -a -d $1 ]
    then
        local dirs=`find $1 -maxdepth 1 -mindepth 1 -type d -name '*_ws' ! -name '.*' -printf '%f\n'`
        local ws=()
        for dir in ${dirs[@]}
        do
            local ws_setup=$(get_ws_setup "$1/$dir")
            if [ "$ws_setup" != "" ]
            then
                ws+=($dir)
            fi
        done
    fi
    echo "${ws[@]}"
}

function get_ws_setup {
    local ws_setup=()
    if [ -d $1/devel -a -f $1/devel/setup.bash ]
    then
        ws_setup+=('devel')
    fi
    if [ -d $1/install -a -f $1/install/setup.bash ]
    then
        ws_setup+=('install')
    fi
    # workaround for rosbuild workspaces
    if  [ -f $1/setup.bash ]
    then
        ws_setup+=(' ')
    fi
    echo "${ws_setup[@]}"
}
