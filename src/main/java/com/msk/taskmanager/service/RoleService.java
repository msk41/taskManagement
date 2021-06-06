package com.msk.taskmanager.service;

import java.util.List;

import com.msk.taskmanager.model.Role;

public interface RoleService {

    Role createRole(Role role);

    List<Role> findAll();

    long getRoleCount();
}
