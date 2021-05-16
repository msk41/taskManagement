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

import com.msk.taskmanager.model.Role;
import com.msk.taskmanager.repository.RoleRepository;

@RunWith(MockitoJUnitRunner.class)
public class RoleServiceImplTest {

    @Mock
    private RoleRepository roleRepository;

    @InjectMocks
    private RoleServiceImpl roleServiceMock;

    @Test
    public void findAll_shouldReturnRolesList() {

        List<Role> expectedRoles = Arrays.asList(
                new Role(),
                new Role());
        when(roleRepository.findAll()).thenReturn(expectedRoles);

        assertThat(roleServiceMock.findAll()).isEqualTo(expectedRoles);
    }

}
