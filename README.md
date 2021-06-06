# Task Management App
Application for a team or a small company to manage tasks

Read this in other languages: [日本語](README.ja.md)

![Image of Task Management App](src/main/resources/static/images/taskManager.png)

## Features
Most features require logging in.<br/>
Not authorized users have access to the welcome, login, and registration page.

**Admin (manager) can:**
-   Create task and assign task to any user
-   View list of all users with possibility to delete user
-   View list of all tasks with editing or deleting task
-   Switch task as completed/uncompleted

**Common user (employee) can:**
-   Create task only for himself
-   View list of all users with no action allowed
-   View list of all tasks with editing or deleting only tasks for which he is responsible
-   Switch owned task as completed/uncompleted

**Every authorized user can:**
-   View his own profile


## Development Environment
* Java 8（jdk1.8.0_171）
* Spring Boot 2.4.3
* MySQL 8.0.25
* Maven 3.6.3
* Bootstrap 4.2.1
* jQuery 3.3.1-1
* Docker 20.10.6
* Docker Compose 1.29.1

## Build and Run the App
Build the app with profile specified

```
mvn clean install -Dspring.profiles.active=dev -DskipTests
```

Run the app with Docker Compose

```
docker-compose -f docker-compose.yml -f docker-compose.dev.yml up --build
```

Once the container is built and running, visit [http://localhost:8080](http://localhost:8080) in your web browser.<br/>
Paste email and password in the login form or click one of demo user buttons under the login form to log in.

Email             | Password
----------------- | -------------
manager@mail.com  | 112233
ann@mail.com      | 112233
mark@mail.com     | 112233

To stop the container, use the `docker-compose down` command

```
docker-compose down
```
