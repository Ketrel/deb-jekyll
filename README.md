**Docker config**  
Dockerfiles and Docker-Compose files + script for jekyll dev enviornment

**Requirements**  
1. Docker
2. Docker Compose

**Instructions**  
1. Run the build script `build.sh` to build the required docker images
2. Run the connect script `connect.sh` to connect to the docker container.  
3. If the docker container is not running (for instance after a reboot), you can use `docker-compose up -d` to start it again, or run the build script a second time.
