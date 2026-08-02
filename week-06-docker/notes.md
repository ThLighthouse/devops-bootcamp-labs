# Week 06 - Containers with Docker

## What is a container?
- A way to package application with all the necessary dependencies and configuration
- Portable artifact, easily shared and moved around.

# Where do containers live?
- Container Repository
- Private repositoires(for companies)
- Public repository for Docker(Dockerhub)

# Application Development
With containers it's much easier to develop an application. Because containers have:
- Own isolated environment
- Packaged with complete configuration
- One command to install the app
- Run same app with 2 different versions

# Application Deployment
- Developers and Operations work together to package the application in a container
- No environmental configuration needed on server(except Docker Runtime)

# Docker Images
Containers technically are:
- Layers of images
- Mostly Linux Base image, because of their small size(apline:3.17) 
- Application image on top(postgres:15.3)

# Docker image - is the actual package(configuration, app, start script). Artifact, that can be moved around
# Docker Container - actually start the application. Container environment is created.
Container is a running environment for an IMAGE.
There is a filesystem, environment configs, application image in a container.

---

### Docker Architecture and Components 

Docker Engine:
1. Docker Server:
    - Container Runtime(Pulling Images, Managing Images & containers);
    - Volumes(Persisting data);
    - Network(Configuring network for container communication);
    - Build Images(Build own Docker images).
2. Docker API(Interacting with Docker Server).
3. CLI(client to execute docker commands).

## Docker Network

Docker creates its own isolated network on the host machine. Inside that isolated network, all containers could reach each other withous port mapping.

## Main Docker Commands

`docker pull` - pulls te image from the repository.
`docker run` - pull the image and start the container with that pulled image. (`-d`=run the container in a detached mode, `-p`=bind the ports for hosts and container). `--name`=give name for the container.
`docker start/stop` - start/stop the container.
`docker ps` - show the running containers. (`-a`=show all the containers, even stooped ones.)
`docker images` - gives all the images that exist locally.
`docker logs` - show the container logs. 
`docker exec` - get the terminal of the running container. `it`=interactive terminal.

## Docker Volumes

Used for data persistence in Docker. 
Folder in physical host file system is mounted into the virtual file system of Docker. So, when data are created in the countainer in the host machine this data gets automatically replicated.

There are 3 types of Docker Volumes. Usually volumes are created with `docker run -v` command.
- Host Volume. `docker run -v /home/mount/data:/var/lib/mysql/data`. The main characteristic of that type is that you decide where on the host file system the reference is made.
- Anonymous Volume: `docker run -v /var/lib/mysql/data`. For each container a folder is generated that gets mounted.
- Named Volumes: `docker run -v name:/var/lib/mysql/data`. You can reference the volume by name. Should be used in poduction.

### For Demo project README.md file 
# What I did?

- viewed all lectures and made notes
- download Docker Engine to the local machine on Linux Mint
- got around with Docker commands
- cloned to the local machine the demo project from `https://gitlab.com/twn-devops-bootcamp/latest/07-docker/js-app`
- run `npm install` and `node server.js` to test the project locally
- get `mondodb` and `mongo-express` images from dockerhub with docker run/pull commands 
- Started containers  with `docker run mongodb/mongo-express` and other parametars like `-d`(detached mode), `-p`(port binding), and `-e`(environment variables).
- Got the status of the containers with `docker ps` commands.
- Practiced to use Docker Compose
- Built image with Dockerfile
- Created a docker repository(Nexus), configure it, create docker-hosted repository, configure firewalls in order to reach the repository and configure docker login to allow connections to push the image.
- Tag the my image with repository address
- Push the image to the repository with `docker push` tagged image
- Fetch the image with `curl -u '$USER:$PASSWORD' -X GET '3.70.99.7:8081/service/rest/v1/components?repository=docker-hosted`
- Also made `docker login` from dev server to pull the image from Nexus repository
- Pull the image and edit and push again to the repository
- Start docker compose on the dev server