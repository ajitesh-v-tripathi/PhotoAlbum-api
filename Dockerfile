FROM eclipse-temurin:8-jre-alpine
WORKDIR /app
COPY . .
EXPOSE 8080
CMD ["java", "-jar", "target/PhotoAlbum-1.0-SNAPSHOT.jar"]
