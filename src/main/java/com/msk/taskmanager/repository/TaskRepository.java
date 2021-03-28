package com.msk.taskmanager.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.msk.taskmanager.model.Task;

public interface TaskRepository extends JpaRepository<Task, Long>{

}