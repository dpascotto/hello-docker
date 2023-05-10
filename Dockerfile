FROM eclipse-temurin:17-jdk-jammy

WORKDIR /app

COPY .mvn/ .mvn
COPY mvnw pom.xml ./

# Copio i compilati in 'remoto' (suppongo di avere fatto il build 'locale')
COPY target ./target

# Eseguo in remoto
CMD ["./mvnw", "exec:java", "-Dexec.mainClass=HelloDocker"]