FROM openjdk:8
COPY /target/taskManager-0.0.1-SNAPSHOT.jar taskManager-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java", "-jar","taskManager-0.0.1-SNAPSHOT.jar"]
