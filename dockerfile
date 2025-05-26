# Stage 1: Build the application
FROM maven:3.8.6-openjdk-8 AS builder

WORKDIR /app

# Copy source code and pom.xml
COPY pom.xml .
COPY src ./src

# Build WAR file
RUN mvn clean package

# Stage 2: Run with Tomcat
FROM tomcat:9.0

# Remove default apps in Tomcat webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR from builder stage to Tomcat webapps
COPY --from=builder /app/target/WebAppCal-1.3.5.war /usr/local/tomcat/webapps/app.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
