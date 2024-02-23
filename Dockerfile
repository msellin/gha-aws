FROM eclipse-temurin:17-jdk-alpine
VOLUME /tmp
COPY build/libs/*.jar gha-aws.jar
ENTRYPOINT ["java","-jar","/gha-aws.jar"]