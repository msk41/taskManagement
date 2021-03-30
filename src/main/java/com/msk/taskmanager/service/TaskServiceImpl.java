package com.msk.taskmanager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.msk.taskmanager.model.Task;
import com.msk.taskmanager.repository.TaskRepository;

@Service
public class TaskServiceImpl implements TaskService {

    private TaskRepository taskRepository;

    @Autowired
    public TaskServiceImpl(TaskRepository taskRepository) {
        this.taskRepository = taskRepository;
    }

    @Override
    public void createTask(Task task) {
        taskRepository.save(task);
    }

    @Override
    public List<Task> findAll() {
        return taskRepository.findAll();
    }
}