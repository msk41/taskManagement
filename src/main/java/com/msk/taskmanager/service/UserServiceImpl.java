package com.msk.taskmanager.service;

import java.util.ArrayList;
import java.util.Collections;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.msk.taskmanager.model.Role;
import com.msk.taskmanager.model.User;
import com.msk.taskmanager.repository.RoleRepository;
import com.msk.taskmanager.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {

    private UserRepository userRepository;
    private RoleRepository roleRepository;

    @Autowired
    public UserServiceImpl(UserRepository userRepository,
                        RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    @Override
    public User createUser(User user) {
        Role userRole = roleRepository.findByRole("USER");
        user.setRoles(new ArrayList<>(Collections.singletonList(userRole)));
        return userRepository.save(user);
    }

    @Override
    public User changeRoleToAdmin(User user) {
        Role adminRole = roleRepository.findByRole("ADMIN");
        user.setRoles(new ArrayList<>(Collections.singletonList(adminRole)));
        return userRepository.save(user);
    }
}