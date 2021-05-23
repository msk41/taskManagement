FROM java:8
VOLUME /tmp
EXPOSE 8080
ADD /target/taskManager-0.0.1-SNAPSHOT.jar taskManager-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java", "-jar","taskManager-0.0.1-SNAPSHOT.jar"]
