# Task Management App
Application for a team or a small company to manage tasks

Read this in other languages: [日本語](README.ja.md)

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
* H2 database
* Maven 3.6.3
* Bootstrap 4.2.1
* jQuery 3.3.1-1
