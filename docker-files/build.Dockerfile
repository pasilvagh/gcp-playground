### Stage 2: Build for qa and stagging
FROM ticblue/backend-jdk8-maven6_3:env as dev

# Copy local code to the container image.
COPY ./api/src ./src
COPY ./config/qa.Aplicacion.properties ./src/main/resources/Aplicacion.properties
COPY ./config/qa.log4j2.xml ./src/main/resources/log4j2.xml

# Crate build package for development
RUN mvn clean package -DskipTests 


### Stage 2: Build for qa and stagging
FROM ticblue/backend-jdk8-maven6_3:env as staging

# Copy local code to the container image.
COPY ./api/src ./src
COPY ./config/prod.Aplicacion.properties ./src/main/resources/Aplicacion.properties
COPY ./config/prod.log4j2.xml ./src/main/resources/log4j2.xml

# Crate build package for development
RUN mvn clean package -DskipTests 
