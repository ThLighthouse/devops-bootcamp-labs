#### This project is for the Devops bootcamp exercise for 
#### "Containers - Docker" 

### Whay I did?

## Pull images from Dockerhub

`docker pull mysql:8.0`
`docker pull phpmyadmin:latest`

## Run the app locally

`gradle build`

"Vars" java -jar /build/libs/docker-exercises-project-1.0-SNAPSHOT/jar`

## Run Images locally

# Mysql

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

# phpmyadmin

```
docker run -d \
--name phpmyadmin-local \
--network mysql-network \
-p 8081:80 \
-e PMA_HOST=mysql-local \
-e PMA_PORT=3306 \
phpmyadmin
```

### Connect phpmyadmin to the db

`docker network connect mysql-network mysql-local`