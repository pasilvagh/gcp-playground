FROM tomcat:9.0.50-jdk8-openjdk as staging

RUN mv /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps
RUN rm -rf /usr/local/tomcat/webapps.dist
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
ENV JAVA_HOME=/usr/local/openjdk-8
ENV CATALINA_HOME=/usr/local/tomcat
ENV PATH $PATH:$CATALINA_HOME/lib
COPY ./config/logging.properties /usr/local/tomcat/conf/logging.properties
COPY ./config/server-prod.xml /usr/local/tomcat/conf/server.xml
COPY ./config/web.xml /usr/local/tomcat/conf/web.xml

FROM staging as prod
VOLUME create tomcat-prod
COPY --from=ticblue/backend-jdk8-maven6_3:staging $HOME/api/target/api-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ultravision#api.war

CMD ["catalina.sh", "run"]