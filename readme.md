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

## Set the username and password of admin users so that the vessel ontology can be saved on the EARS server
Only to save the vessel ontology this password and username is needed. This username and password needs to be provided in the EARS front-end application as well.
 
Modify these lines in the Dockerfile to your username and password:
```
RUN echo 'be.naturalsciences.bmdc.ears.ontology.rest.username=earsontology' > /etc/.java/ears.properties
RUN echo 'be.naturalsciences.bmdc.ears.ontology.rest.password=REPLACEME' >> /etc/.java/ears.properties
```

## Create the docker container and run the image, in detached (-d) mode
```
sudo docker-compose build
sudo docker-compose up -d
```
Wait some moments (a minute or so), then go to localhost:8181/ears2/getEvents and all other web verbs. Replace localhost:8181 with the server IP adress

## If you need to kill the docker images, for instance if you make a change in the Dockerfile 
```sudo docker kill ears-server_acquisition ears-server_tomcat ears-server_mysql```

## View the database, e.g. with MySQL Workbench
First retrieve the ip address of the MySQL container:
```
sudo docker inspect ears-server_mysql_1
```
and note the value for the key "IPAddress".

Create a new connection in MySQL Workbench towards this IP address, using as database name 'casino', user 'casino' and password 'casino'.

## Troubleshooting

Read the logs of the acquisition module like so: sudo docker logs ears-server_acquisition_1
