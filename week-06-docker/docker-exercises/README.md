# Docker Exercises

This project is an exercise from the DevOps bootcamp module **"Containers - Docker"**.

## What I Did

### Pull Images from Docker Hub

```bash
docker pull mysql:8.0
docker pull phpmyadmin:latest
```

### Run the Application Locally

```bash
gradle build
```

"Vars" `java -jar /build/libs/docker-exercises-project-1.0-SNAPSHOT/jar`

### Run Images Locally

#### MySQL

```
docker run -d \
--name mysql-local \
-p 3306:3306 \
-e MYSQL_ROOT_PASSWORD=123 \
-e MYSQL_DATABASE=mydb \
-e MYSQL_USER=dbuser \
-e MYSQL_PASSWORD=123 \
mysql:8.0
```

#### phpMyAdmin

```
docker run -d \
--name phpmyadmin-local \
--network mysql-network \
-p 8081:80 \
-e PMA_HOST=mysql-local \
-e PMA_PORT=3306 \
phpmyadmin
```

### Connect phpMyAdmin to the Database

`docker network connect mysql-network mysql-local`

### Build the Image with the Dockerfile

`docker build -t 3.79.99.59:8083/my-app:1.0`

### Log In to the Private Repository

For an insecure HTTP connection, configure the following in `/etc/docker/daemon.json`:

```
{
	"insecure-registries" : ["3.79.99.59:8083"]
}
```

`docker login 3.79.99.59:8083`

### Add the Application to `docker-compose.yaml`

```
services:
  my-java-app:
    image: 3.65.226.227:8083/my-java-app:1.1
    ports:
      - "8080:8080"
    environment:
      DB_USER: ${MYSQL_USER}
      DB_PWD: ${MYSQL_PASSWORD}
      DB_SERVER: mysql
      DB_NAME: ${MYSQL_DATABASE}
    depends_on:
      mysql:
        condition: service_healthy
```

Test the application locally:

`docker compose -f docker-compose.yaml up -d`

Edit the application `index.html` and push the new image version to the private repository.

### Copy `docker-compose.yaml` to the EC2 Instance

```
scp -i ~/.ssh/Docker-exercises.pem docker-compose.yaml ubuntu@3.65.226.227:~/
```

### Install Docker on the EC2 Instance

`sudo apt install docker.io`

Start the containers with Docker Compose:

```
ubuntu@ip-172-31-24-255:~$ docker compose -f docker-compose.yaml up -d
[+] Running 3/3
 ✔ Container ubuntu-mysql-1        Healthy                                                                                                                                               0.5s
 ✔ Container ubuntu-phpmyadmin-1   Running                                                                                                                                               0.0s
 ✔ Container ubuntu-my-java-app-1  Started                                                                                                                                               0.2s
ubuntu@ip-172-31-24-255:~$ docker ps
CONTAINER ID   IMAGE                               COMMAND                  CREATED          STATUS                   PORTS                                         NAMES
59b544273f29   phpmyadmin:latest                   "/docker-entrypoint.…"   25 seconds ago   Up 25 seconds            0.0.0.0:8082->80/tcp, [::]:8082->80/tcp       ubuntu-phpmyadmin-1
c9d1fde0e05e   3.65.226.227:8083/my-java-app:1.1   "java -jar app.jar"      3 minutes ago    Up 4 seconds             0.0.0.0:8080->8080/tcp, [::]:8080->8080/tcp   ubuntu-my-java-app-1
fd7bc9be4d6b   mysql:8.0                           "docker-entrypoint.s…"   3 minutes ago    Up 3 minutes (healthy)   3306/tcp, 33060/tcp                           ubuntu-mysql-1
```


### Open the Necessary Ports

Open the necessary ports so that the application can be reached from anywhere.