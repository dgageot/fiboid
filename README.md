Recursive Fibonacci with Docker inside Docker inside Docker inside...

# Build

docker build -t dgageot/fibonacci .

# Run

docker run --rm --privileged -ti -v /var/lib/docker:/var/lib/docker dgageot/fibonacci 0
docker run --rm --privileged -ti -v /var/lib/docker:/var/lib/docker dgageot/fibonacci 1
docker run --rm --privileged -ti -v /var/lib/docker:/var/lib/docker dgageot/fibonacci 2
docker run --rm --privileged -ti -v /var/lib/docker:/var/lib/docker dgageot/fibonacci 4
