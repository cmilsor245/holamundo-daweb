# selecting the base image
FROM tomcat:10.1.18-jdk17-temurin-jammy

# updating the system
RUN apt update
RUN apt upgrade -y

# copying necessary files and folders to the container
RUN mkdir tmp
WORKDIR /tmp
COPY gradlew .
COPY gradle/wrapper gradle/wrapper
COPY *.gradle .
COPY src src

# compiling
RUN chmod +x gradlew
RUN ./gradlew build

# moving war file to tomcat webapps
RUN mv build/libs/holamundo-0.0.1-SNAPSHOT.war ${CATALINA_HOME}/webapps/holamundo-docker.war