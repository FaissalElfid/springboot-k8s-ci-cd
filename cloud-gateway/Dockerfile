FROM openjdk:11
ARG JAR_FILE=target/cloud-gateway-0.0.1.jar
COPY ${JAR_FILE} cloud-gateway.jar
ENTRYPOINT ["java","-jar","/cloud-gateway.jar"]
EXPOSE 9191