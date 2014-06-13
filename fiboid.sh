#!/bin/bash

if [ $1 -le 0 ]; then
    echo 0
	exit 1
fi

if [ $1 -eq 1 ]; then
    echo 1
	exit 1
fi

./startdocker.sh >/dev/null 2>/dev/null
docker ps >/dev/null 2>/dev/null

a=$(docker run --rm --privileged -v /var/lib/docker:/var/lib/docker dgageot/fiboid $[$1-2])
b=$(docker run --rm --privileged -v /var/lib/docker:/var/lib/docker dgageot/fiboid $[$1-1])
echo $[$a+$b]
