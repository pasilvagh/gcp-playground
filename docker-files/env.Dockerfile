### Stage 1: Fetch develop and testing dependencies
FROM maven:3.6.1-jdk-8 AS env

# Copy local code to the container image.
RUN mkdir -p $HOME/api 
WORKDIR $HOME/api

# copy the project files
COPY ./api/pom.xml ./

# build all dependencies for offline use
RUN mvn dependency:go-offline -B
