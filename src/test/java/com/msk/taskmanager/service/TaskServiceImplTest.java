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

import com.msk.taskmanager.model.Task;
import com.msk.taskmanager.repository.TaskRepository;

@RunWith(MockitoJUnitRunner.class)
public class TaskServiceImplTest {

    @Mock
    private TaskRepository taskRepository;

    @InjectMocks
    private TaskServiceImpl taskServiceMock;

    @Test
    public void findAll_shouldReturnTasksList() {
        List<Task> expectedTasks = Arrays.asList(
                new Task(),
                new Task());
        when(taskRepository.findAll()).thenReturn(expectedTasks);

        assertThat(taskServiceMock.findAll()).isEqualTo(expectedTasks);
    }

}
