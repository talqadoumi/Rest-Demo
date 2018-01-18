package com.expedia.test;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.MockitoAnnotations;
import org.mockito.Spy;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import com.expedia.controller.OffersRestController;
import com.expedia.service.HotelServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "classpath:test-context.xml"})

public class OffersControllerTest {

	private String restEndPoint = "/getOffers/v1";

	@InjectMocks
	private OffersRestController restController;

	private MockMvc mockMvc;

	@Spy
	private HotelServiceImpl hotelService;

	@Before
	public void setup() {

		MockitoAnnotations.initMocks(this);
		mockMvc = MockMvcBuilders.standaloneSetup(restController).build();

	}

	@Test
	public void getOffersWithOutQueryParameter() throws Exception {

		mockMvc.perform(get(restEndPoint)).andExpect(MockMvcResultMatchers.status().is(200));

	}

	@Test
	public void getOffersWithQueryParameter() throws Exception {

		mockMvc.perform(get(restEndPoint+"?regionIds=333333")).andExpect(MockMvcResultMatchers.status().is(204));

	}

}
