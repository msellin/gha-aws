FROM gradle:8.5-jdk AS build
WORKDIR /app
COPY src/main ./src/main
COPY build.gradle settings.gradle  ./
RUN gradle clean build

FROM eclipse-temurin:17-jdk-alpine AS run
RUN adduser --system --group app-user
COPY --from=build --chown=app-user:app-user /app/build/libs/gha-aws.jar gha-aws.jar
EXPOSE 8080
USER app-user
CMD ["java", "-jar", "gha-aws.jar"]