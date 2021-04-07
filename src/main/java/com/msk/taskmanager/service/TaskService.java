package com.msk.taskmanager.service;

import java.util.List;

import com.msk.taskmanager.model.Task;
import com.msk.taskmanager.model.User;

public interface TaskService {

    void createTask(Task task);

    void updateTask(Long id, Task task);

    List<Task> findAll();

    List<Task> findByOwnerOrderByDateDesc(User user);

    void setTaskCompleted(Long id);

    void setTaskNotCompleted(Long id);

    List<Task> findFreeTasks();

    Task getTaskById(Long id);

    void assignTaskToUser(Task task, User user);

    void unassignTask(Task task);
}
