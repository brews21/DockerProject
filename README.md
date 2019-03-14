# DockerStuff
Learrning Docker

# Basic cmds
docker build -- Build an image from a Dockerfile
docker commit -- Create an image from the container
docker diff -- Show changes in the container
docker images -- List images
docker info -- Display Docker information
docker inspect -- Show the configuration of the Docker image/container
docker logs -- Show logs of the container
docker network -- Manage networks
docker port -- Show all exposed ports by the container
docker ps -- List containers
docker rm -- Remove container
docker rmi -- Remove image
docker run -- Run a container from the image
docker search -- Search for the Docker image in Docker Hub
docker start/stop/pause/unpause -- Manage the container's state

# Portainer
Portainer is a tool that allows you to manage Docker resources from
a web interface.
$ docker container run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer

# Cleaning Up
To remove the exited containers
$ docker container prune
If we want to remove all stopped containers, we can use the following
command:
$ docker rm $(docker ps --no-trunc -aq)
Delete all containers
$ docker rm $(docker ps -a -q)
Delete all images
$ docker rmi $(docker images -q)
Delete everything not associated with a container
$ docker system prune
Delete everything, including volumes - but not stuff that is not in use
$ docker system prune -a
$ all images without tags and not being used
docker rmi $(docker images -f "dangling=true" -q)

# create
The create command is pretty similar to the run command, except that it
does not start the container, but instead prepares and configures one:
$ docker container create --name nginx-test -p 8080:80 nginx

# Attach
The first way of interacting with your running container is to attach
to the running process. ctrl + c will exit the process and stop the
container
$ docker container attach nginx-test

To exit and leave the container running
$ docker container attach --sig-proxy=false nginx-test

# exec
The attach command is useful if you need to connect to the process your
container is running, but what if you need something a little more
interactive? You can use the exec command; this spawns a second process
within the container that you can interact with
$ docker container exec -i -t nginx-test /bin/bash

# logs
$ docker container logs --tail 5 nginx-test
realtime view
$ docker container logs -f nginx-test

# top
The top command is quite a simple one; it lists the processes running
within the container you specify:
$ docker container top nginx-test

# stats
The stats command provides real-time information on either the
specified container or, if you don't pass a container name or ID, all
running containers:
$ docker container stats nginx-test

# inspect
This will return the container configuration in JSON format
docker inspect <containerID>

Will return .NetworkSettings.IPAddress part of the config, filtering
the inspect response
docker inspect --format '{{ .NetworkSettings.IPAddress }}' <containerID>

# port
This displays the port along with any port mappings for the
container:
$ docker container port nginx-test

# docker-compose
$ docker-compose start
$ docker-compose stop
$ docker-compose restart
$ docker-compose pause
$ docker-compose unpause
$ docker-compose kill
$ docker-compose rm
This will remove the containers and networks created
$ docker-compose down
This will remove everything
$ docker-compose down --rmi all --volumes
Run in detached state
$ docker-compose up -d
check running containers
$ docker-compose ps
Validate docker-compose.yaml, adding -q to just see errors
$ docker-compose config
Just pull the required images
$ docker-compose pull
execute build instructions, good for testing as it will run in any
updates
$ docker-compose build
Create the containers but in Exited state
$ docker-compose create
flags:
--force-recreate: This recreates the container even if there is
no need to as nothing within the configuration has changed
--no-recreate: This doesn't recreate a container if it already
exists; this flag cannot be used with the preceding flag
--no-build: This doesn't build the images, even if an image
that needs to be built is missing
--build: This builds the images before creating the containers
See info on the processes running, can put the container id after
to just get that one
$ docker-compose top
See the logs, can put the container id after to just get that one
$ docker-compose logs
Run cmds on a containers
$ docker-compose exec worker ping -c 3 db
Run cmd in the container
$ docker-compose run base /bin/bash
