FROM openjdk:11
ARG JAR_FILE=target/user-service-0.0.1.jar
COPY ${JAR_FILE} user-service.jar
ENTRYPOINT ["java","-jar","/user-service.jar"]
EXPOSE 9002