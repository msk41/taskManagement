package com.msk.taskmanager.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.msk.taskmanager.model.Role;

@Repository
public interface RoleRepository extends JpaRepository<Role, Integer>{

}