# Installation of the EARS server

## Prerequisites
Linux with docker installed. Not yet tested on docker on Windows

## Install docker
Ubuntu: Follow the guidelines on https://docs.docker.com/install/linux/docker-ce/ubuntu/
Debian, CentOS, Fedora also available

## Get the source code for the EARS server
```
cd <installation directory>
git clone https://github.com/naturalsciences/ears-server.git
cd ears-server
```
## Create the docker container and run the image
```
sudo docker-compose build
sudo docker up -d
```
Wait some moments
## Kill the docker images if needed
```sudo docker kill ears-server_acquisition_1 ears-server_tomcat_1 ears-server_mysql_1```

