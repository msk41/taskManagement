package com.msk.taskmanager.dataloader;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

import com.msk.taskmanager.model.Role;
import com.msk.taskmanager.model.Task;
import com.msk.taskmanager.model.User;
import com.msk.taskmanager.service.RoleService;
import com.msk.taskmanager.service.TaskService;
import com.msk.taskmanager.service.UserService;

@Component
public class InitialDataLoader implements ApplicationListener<ContextRefreshedEvent> {

    private UserService userService;
    private TaskService taskService;
    private RoleService roleService;

    @Autowired
    public InitialDataLoader(UserService userService, TaskService taskService, RoleService roleService) {
        this.userService = userService;
        this.taskService = taskService;
        this.roleService = roleService;
    }

    @Override
    public void onApplicationEvent(ContextRefreshedEvent event) {

        //ROLES --------------------------------------------------------------------------------------------------------
        roleService.createRole(new Role("ADMIN"));
        roleService.createRole(new Role("USER"));

        //USERS --------------------------------------------------------------------------------------------------------
        User admin = new User(
                "admin@mail.com",
                "admin",
                "112233",
                "photo");
        userService.createUser(admin);
        userService.changeRoleToAdmin(admin);

        User ann = new User(
                "ann@mail.com",
                "Ann",
                "112233",
                "photo");
        userService.createUser(ann);
        userService.changeRoleToAdmin(ann);

        User mark = new User(
                "mark@mail.com",
                "Mark",
                "112233",
                "photo");
        userService.createUser(mark);
        userService.changeRoleToAdmin(mark);

        //TASKS --------------------------------------------------------------------------------------------------------
        taskService.createTask(new Task(
                "First task",
                "Detailed description of first task",
                LocalDate.now().plusDays(10),
                true,
                "mark",
                mark
        ));

        taskService.createTask(new Task(
                "Second task",
                "Detailed description of second task",
                LocalDate.now(),
                true,
                "ann",
                ann
        ));

        taskService.createTask(new Task(
                "Third task",
                "Detailed description of third task",
                LocalDate.now().minusDays(1),
                false,
                "admin",
                admin
        ));

        taskService.createTask(new Task(
                "Fourth task",
                "Detailed description of fourth task",
                LocalDate.now().minusDays(10),
                true,
                "admin",
                admin
        ));

    }

}