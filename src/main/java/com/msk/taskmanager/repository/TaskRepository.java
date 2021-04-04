package com.msk.taskmanager.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.msk.taskmanager.model.Task;
import com.msk.taskmanager.model.User;

public interface TaskRepository extends JpaRepository<Task, Long>{

    List<Task> findByOwnerOrderByDateDesc(User user);
}