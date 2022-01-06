FROM openjdk:11
ARG JAR_FILE=target/department-service-0.0.1.jar
COPY ${JAR_FILE} department-service.jar
ENTRYPOINT ["java","-jar","/department-service.jar"]
EXPOSE 9001