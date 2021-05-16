package com.msk.taskmanager.controller;

import static org.hamcrest.CoreMatchers.instanceOf;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import com.msk.taskmanager.model.Task;
import com.msk.taskmanager.service.TaskService;

public class TaskControllerTest {

    @Mock
    TaskService taskServiceMock;

    @InjectMocks
    TaskController taskController;
    private MockMvc mockMvc;

    @Before
    @WithMockUser(username = "admin", authorities = { "ADMIN" })
    public void setup() {
        MockitoAnnotations.openMocks(this);
        mockMvc = MockMvcBuilders.standaloneSetup(taskController).build();
    }

    @Test
    public void updateTask_shouldReturnStatusOkAndFilledTaskFormAsViewNameAndTaskAsAttribute() throws Exception {
        Long id = 1L;

        when(taskServiceMock.getTaskById(id)).thenReturn(new Task());

        mockMvc.perform(get("/task/edit/1"))
                .andExpect(status().isOk())
                .andExpect(view().name("forms/task-edit"))
                .andExpect(model().attribute("task", instanceOf(Task.class)));
    }

    @Test
    public void deleteTask_shouldInvokeDeleteTaskMethodAndRedirectToTasks() throws Exception {
        Long id = 1L;

        mockMvc.perform(get("/task/delete/1"))
                .andExpect(status().is3xxRedirection())
                .andExpect(view().name("redirect:/tasks"));

        verify(taskServiceMock, times(1)).deleteTask(id);
    }

}
