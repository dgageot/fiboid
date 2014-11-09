#!/bin/bash

if [ $1 -le 0 ]; then
  echo 0
  exit 1
fi

if [ $1 -eq 1 ]; then
  echo 1
  exit 1
fi

# Start daemon docker
./startdocker.sh >/dev/null 2>/dev/null

# Wait for docker daemon to start
for i in {1..30}; do
	docker run --rm --privileged -v /var/lib/docker:/var/lib/docker busybox true >/dev/null 2>/dev/null

	if [ "$?" -eq 0 ]; then
		break
	else
		sleep .1
		# >&2 echo "error"
	fi
done

a=$(docker run --rm --privileged -v /var/lib/docker:/var/lib/docker dgageot/fiboid $[$1-2])
b=$(docker run --rm --privileged -v /var/lib/docker:/var/lib/docker dgageot/fiboid $[$1-1])
echo $[$a+$b]
