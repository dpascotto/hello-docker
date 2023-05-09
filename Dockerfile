FROM eclipse-temurin:17-jdk-jammy

WORKDIR /app

COPY .mvn/ .mvn
COPY mvnw pom.xml ./

# Copio i sorgenti in remoto
COPY src ./src

# Eseguo il build remoto
RUN ./mvnw clean install

# Eseguo in remoto
CMD ["./mvnw", "exec:java", "-Dexec.mainClass=HelloDocker"]