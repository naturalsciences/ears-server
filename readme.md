# Installation of the EARS server

## Prerequisites
Linux with docker installed. Not yet tested on docker on Windows.

## Install docker
Ubuntu: Follow the guidelines on https://docs.docker.com/install/linux/docker-ce/ubuntu/
Debian, CentOS, Fedora also available

## Get the source code for the EARS server
```
cd <installation directory>
git clone https://github.com/naturalsciences/ears-server.git
cd ears-server
```
## Create the docker container and run the image, in detached (-d) mode
```
sudo docker-compose build
sudo docker-compose up -d
```
Wait some moments (a minute or so), then go to localhost:8181/ears2/getEvents and all other web verbs. Replace localhost:8181 with the server IP adress

## If you need to kill the docker images, for instance if you make a change in the Dockerfile 
```sudo docker kill ears-server_acquisition_1 ears-server_tomcat_1 ears-server_mysql_1```

