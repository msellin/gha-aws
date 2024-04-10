FROM gradle:8.5-jdk AS build
WORKDIR /app
COPY src/main ./src/main
COPY build.gradle settings.gradle  ./
RUN gradle clean build

FROM eclipse-temurin:17-jdk-alpine AS run
COPY --from=build /app/build/libs/gha-aws.jar gha-aws.jar
EXPOSE 8080
CMD ["java", "-jar", "gha-aws.jar"]