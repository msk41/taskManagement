package com.msk.taskmanager.service;

import com.msk.taskmanager.model.User;

public interface UserService {

    User createUser(User user);

    User changeRoleToAdmin(User user);
}