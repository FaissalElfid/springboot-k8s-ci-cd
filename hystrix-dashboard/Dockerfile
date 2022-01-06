FROM openjdk:11
ARG JAR_FILE=target/hystrix-dashboard-0.0.1.jar
COPY ${JAR_FILE} hystrix-dashboard.jar
ENTRYPOINT ["java","-jar","/hystrix-dashboard.jar"]
EXPOSE 9295