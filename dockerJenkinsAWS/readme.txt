### readme for the Docker/Jenkins project

### cheat-sheet ###
https://github.com/wsargent/docker-cheat-sheet

### some cmds ###

docker inspect <containerID>
 - this will return the container configuration in JSON format

docker inspect --format '{{ .NetworkSettings.IPAddress }}' <containerID>
  - will return .NetworkSettings.IPAddress part of the config, filtering the inspect response

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



### clean up ###
If we want to remove all stopped containers, we can use the following command:
$ docker rm $(docker ps --no-trunc -aq)

The -aq option specifies to pass only IDs (no additional data) for all containers. Additionally, --no-trunc asks Docker not to truncate the output.
We can also adopt a different approach and ask the container to remove itself, when it's stopped using the --rm flag, for example:
$ docker run --rm hello-world

To remove an image, we can call the following command:
$ docker rmi 48b5124b2768

In the case of images, the automatic cleanup process is slightly more complex. Images don't have states, so we cannot ask them to remove themselves when not used.
The common strategy would be to set up the Cron cleanup job, which removes all old and unused images. We could do this using the following command:
$ docker rmi $(docker images -q)

In order to prevent removing the images with tags (for example, to not remove all the latest images), it's very common to use the dangling parameter:
$ docker rmi $(docker images -f "dangling=true" -q)

If we have containers that use volumes, then, in addition to images and containers, it's worth to think about cleaning up volumes.
The easiest way to do this is to use the docker volume ls -qf dangling=true | xargs -r docker volume rm command.
