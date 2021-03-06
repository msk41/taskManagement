package com.msk.taskmanager.service;

import java.util.List;

import com.msk.taskmanager.model.User;

public interface UserService {

    User createUser(User user);

    User changeRoleToAdmin(User user);

    List<User> findAll();

    User getUserByEmail(String email);

    boolean isUserEmailPresent(String email);

    User getUserById(Long id);

    void deleteUser(Long id);

    long getUserCount();
}
