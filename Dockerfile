
FROM eclipse-temurin:21-jdk-alpine
WORKDIR /Downloads/my_maven_app       #here you need change your app path
COPY target/*.jar app.jar
EXPOSE 8080
CMD ["java","-jar","app.jar"]
