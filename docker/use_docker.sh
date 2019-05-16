DOCKER_PATH=/opt/docker/
if [ $# -eq 1 ]; then
    echo "We need a second parameter"
elif [[ $2 == "default" ]]; then
    [[ ! -z "${DOCKER_HOST}" ]] && unset DOCKER_HOST
else
    SOCKET_PATH=$DOCKER_PATH$2.socket
    if [ -S $SOCKET_PATH ]; then
        DOCKER_HOST=unix://$SOCKET_PATH
        export DOCKER_HOST
    else
        echo "Doing nothing. The value $2 doesn't seem to exists or have a socket."
    fi
fi
