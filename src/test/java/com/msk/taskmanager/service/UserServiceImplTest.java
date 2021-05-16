package com.msk.taskmanager.service;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.when;

import java.util.Arrays;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;

import com.msk.taskmanager.model.User;
import com.msk.taskmanager.repository.UserRepository;

@RunWith(MockitoJUnitRunner.class)
public class UserServiceImplTest {

    @Mock
    private UserRepository userRepository;

    @InjectMocks
    private UserServiceImpl userServiceMock;

    @Test
    public void findAll_shouldReturnUsersList() {
        List<User> expectedUsers = Arrays.asList(
                new User(),
                new User());
        when(userRepository.findAll()).thenReturn(expectedUsers);

        assertThat(userServiceMock.findAll()).isEqualTo(expectedUsers);
    }

}
