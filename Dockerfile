FROM tomcat:9.0.22-jdk8-openjdk
COPY wait-for-mysql.sh wait-for-mysql.sh
COPY ears_ddl.sql ears_ddl.sql
COPY tomcat-users.xml /usr/local/tomcat/conf/

RUN mkdir /etc/.java
RUN echo 'be.naturalsciences.bmdc.ears.ontology.rest.username=earsontology' > /etc/.java/ears.properties
RUN echo 'be.naturalsciences.bmdc.ears.ontology.rest.password=REPLACEME' >> /etc/.java/ears.properties

RUN echo 'Acquire::http::Pipeline-Depth 0;Acquire::http::No-Cache true;Acquire::BrokenProxy    true;' > /etc/apt/apt.conf.d/99fixbadproxy
RUN rm -rf /var/lib/apt && apt-get clean && apt-get update
RUN apt-get install -y mysql-client
