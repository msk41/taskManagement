package com.msk.taskmanager.service;

import java.util.List;

import com.msk.taskmanager.model.Task;

public interface TaskService {

    void createTask(Task task);

    List<Task> findAll();
}