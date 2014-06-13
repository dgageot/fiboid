Recursive Fibonacci with Docker inside Docker inside Docker inside...

Here's the algorithm:

'''
if value is 0 then return 0
if value is 1 then return 1
otherwise
start a docker daemon inside current docker container
run a container for value-2
run a container for value-1
return the sum up the two values
'''

Most of the time is spent starting docker -d and sleeping until its started.

# Build

docker build -t dgageot/fibonacci .

# Run

docker run --rm --privileged -ti -v /var/lib/docker:/var/lib/docker dgageot/fibonacci 0
docker run --rm --privileged -ti -v /var/lib/docker:/var/lib/docker dgageot/fibonacci 1
docker run --rm --privileged -ti -v /var/lib/docker:/var/lib/docker dgageot/fibonacci 2
docker run --rm --privileged -ti -v /var/lib/docker:/var/lib/docker dgageot/fibonacci 4
