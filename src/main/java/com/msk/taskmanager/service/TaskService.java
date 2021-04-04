package com.msk.taskmanager.service;

import java.util.List;

import com.msk.taskmanager.model.Task;
import com.msk.taskmanager.model.User;

public interface TaskService {

    void createTask(Task task);

    List<Task> findAll();

    List<Task> findByOwnerOrderByDateDesc(User user);
}