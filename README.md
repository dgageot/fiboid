Recursive Fibonacci with Docker inside Docker inside Docker inside...

# Build

```bash
	docker build -t dgageot/fiboid .
```

# Run

	docker run --rm --privileged -ti -v /var/lib/docker:/var/lib/docker dgageot/fiboid 0
	docker run --rm --privileged -ti -v /var/lib/docker:/var/lib/docker dgageot/fiboid 1
	docker run --rm --privileged -ti -v /var/lib/docker:/var/lib/docker dgageot/fiboid 2
	docker run --rm --privileged -ti -v /var/lib/docker:/var/lib/docker dgageot/fiboid 4

# How it works

Here's the algorithm:

	if value is 0 then return 0
	if value is 1 then return 1
	otherwise
	start a docker daemon inside current docker container
	run a container for value-2
	run a container for value-1
	return the sum of the two values

Most of the time is spent starting docker -d and sleeping until its started.

# Sample Execution Plan

	docker run --rm --privileged -ti -v /var/lib/docker:/var/lib/docker dgageot/fiboid 7
	- docker 7 (=13)
	  - docker 5
	    - docker 3
	      - docker 1
	      - docker 2
	        - docker 0
	        - docker 1
	    - docker 4
	      - docker 2
	        - docker 0
	        - docker 1
	      - docker 3
	        - docker 1
	        - docker 2
	          - docker 0
	          - docker 1 (depth=6)
	  - docker 6
	    - docker 4
	      - docker 2
	        - docker 0
	        - docker 1
	      - docker 3
	        - docker 1
	        - docker 2
	          - docker 0
	          - docker 1
	    - docker 5
	      - docker 3
	        - docker 1
	        - docker 2
	          - docker 0
	          - docker 1
	      - docker 4
	        - docker 2
	          - docker 0
	          - docker 1
	        - docker 3
	          - docker 1
	          - docker 2
	            - docker 0
	            - docker 1
