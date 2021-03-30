package com.msk.taskmanager.service;

import java.util.List;

import com.msk.taskmanager.model.User;

public interface UserService {

    User createUser(User user);

    User changeRoleToAdmin(User user);

    List<User> findAll();
}