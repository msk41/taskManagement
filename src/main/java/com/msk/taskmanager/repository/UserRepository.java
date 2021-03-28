package com.msk.taskmanager.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.msk.taskmanager.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long>{

}