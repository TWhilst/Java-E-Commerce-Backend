FROM maven:3.9.9-eclipse-temurin-11-alpine as build

COPY . /app

WORKDIR /app

RUN mvn clean package

FROM amazoncorretto:22

LABEL version="1.0"

# This is the particular port where the docker container will be listening on
EXPOSE 8080:8080

WORKDIR /app

# THis basically copies the result of the node container and paste it in the nginx html folder
COPY target/ecommerce-1.0-SNAPSHOT.jar /app/java-backend.jar
# COPY --from=build /app/target/ecommerce-1.0-SNAPSHOT.jar /app/java-backend.jar

ENTRYPOINT ["java", "-jar", "java-backend.jar"]