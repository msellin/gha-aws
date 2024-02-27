FROM gradle:8.5-jdk AS build
COPY src/main ./src/main
COPY build.gradle settings.gradle  ./
RUN gradle clean build

FROM openjdk:17.0.1-jdk-slim AS run
RUN adduser --system --group app-user
COPY --from=build --chown=app-user:app-user /build/libs/gha-aws.jar gha-aws.jar
EXPOSE 8080
USER app-user
CMD ["java", "-jar", "gha-aws.jar"]