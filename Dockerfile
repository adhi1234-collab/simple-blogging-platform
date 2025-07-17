FROM tomcat:10.1-jdk17-temurin

WORKDIR /usr/local/tomcat/webapps

# Clean default apps and deploy WAR
RUN rm -rf ROOT*
COPY target/finalblogging.war ROOT.war

# Add custom server.xml and wait script
COPY server.xml /usr/local/tomcat/conf/server.xml
COPY wait-for-mysql.sh /wait-for-mysql.sh

# Install netcat for wait script
RUN apt-get update && apt-get install -y netcat-traditional && chmod +x /wait-for-mysql.sh

EXPOSE 9090

CMD ["/wait-for-mysql.sh"]
