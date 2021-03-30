package com.msk.taskmanager.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.msk.taskmanager.service.TaskService;

@Controller
public class TaskController {

    private TaskService taskService;

    @Autowired
    public TaskController(TaskService taskService) {
        this.taskService = taskService;
    }

    @GetMapping("/tasks")
    public String listTasks(Model model) {

        model.addAttribute("tasks", taskService.findAll());
        return "views/tasksList";
    }
}