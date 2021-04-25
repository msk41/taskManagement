package com.msk.taskmanager.controller;

import static org.hamcrest.CoreMatchers.instanceOf;
import static org.mockito.Mockito.verifyNoInteractions;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import com.msk.taskmanager.model.User;
import com.msk.taskmanager.service.UserService;

public class RegisterControllerTest {

    @Mock
    UserService userServiceMock;

    @InjectMocks
    RegisterController registerController;

    private MockMvc mockMvc;

    @Before
    public void setup() {
        MockitoAnnotations.openMocks(this);
        mockMvc = MockMvcBuilders.standaloneSetup(registerController).build();
    }

    @Test
    public void showRegisterForm_shouldReturnStatusOkAndRegisterFormAsViewNameAndUserAsAttribute() throws Exception {

        verifyNoInteractions(userServiceMock);

        mockMvc.perform(get("/register"))
                .andExpect(status().isOk())
                .andExpect(view().name("views/registerForm"))
                .andExpect(model().attribute("user", instanceOf(User.class)));
    }

}
