# Usar imagen base de OpenJDK 21 (versión ligera)
FROM openjdk:21-jdk-slim

# Instalar Maven
RUN apt-get update && apt-get install -y maven && rm -rf /var/lib/apt/lists/*

# Establecer directorio de trabajo
WORKDIR /app

# Copiar archivos de Maven primero (para cache de dependencias)
COPY pom.xml .
COPY .mvn .mvn
COPY mvnw .

# Dar permisos de ejecución
RUN chmod +x mvnw

# Descargar dependencias (se cachea si pom.xml no cambia)
RUN ./mvnw dependency:go-offline -B

# Copiar código fuente
COPY src src

# Compilar aplicación sin ejecutar tests
RUN ./mvnw clean package -DskipTests

# Exponer puerto donde corre Spring Boot
EXPOSE 8080

# Ejecutar la aplicación
CMD ["java", "-jar", "target/parcial-final-n-capas-0.0.1-SNAPSHOT.jar"]