package com.msk.taskmanager.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import org.junit.Before;
import org.junit.Test;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

public class StaticPageControllerTest {

    private MockMvc mockMvc;

    @Before
    public void setup() {
        StaticPageController staticPageController = new StaticPageController();
        mockMvc = MockMvcBuilders.standaloneSetup(staticPageController).build();
    }

    @Test
    public void testStaticPage() throws Exception {
        mockMvc.perform(get("/about"))
                .andExpect(status().isOk())
                .andExpect(view().name("views/about"));
    }

}
