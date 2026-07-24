# Week 06 - Containers with Docker

## What is a container?
- A way to package application with all the necessary dependencies and configuration
- Portable artifact, easily shared and moved around.

# Where do containers live?
- Container Repository
- Private repositoires(for companies)
- Public repository for Doceker(Dockerhub)

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

## Main Docker Commands