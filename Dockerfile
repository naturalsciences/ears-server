FROM tomcat:9.0.22-jdk8-openjdk
COPY wait-for-mysql.sh wait-for-mysql.sh
COPY ears_ddl.sql ears_ddl.sql
COPY context.xml /usr/local/tomcat/webapps/manager/META-INF/
COPY tomcat-users.xml /usr/local/tomcat/conf/
RUN mkdir /etc/.java
RUN echo 'be.naturalsciences.bmdc.ears.ontology.rest.username=ears' > /etc/.java/ears.properties
RUN echo 'be.naturalsciences.bmdc.ears.ontology.rest.username=REPLACEME' >> /etc/.java/ears.properties

RUN echo 'Acquire::http::Pipeline-Depth 0;Acquire::http::No-Cache true;Acquire::BrokenProxy    true;' > /etc/apt/apt.conf.d/99fixbadproxy
RUN rm -rf /var/lib/apt && apt-get clean && apt-get update
RUN apt-get install -y mysql-client

#ARG DB_HOST

#RUN mysql -h "$DB_HOST" -u root -proot -t -D casino -c "select * from event;" | grep -q 0 || echo 'Not found EARS tables, installing' && mysql -h "$DB_HOST" -u root -proot -t < ears_ddl.sql

# CMD ["catalina.sh", "run"]
#'sudo chgrp -R tomcat .java`  
#'sudo chmod -R 775 .java`
