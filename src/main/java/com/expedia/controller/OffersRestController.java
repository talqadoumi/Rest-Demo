package com.expedia.controller;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.expedia.model.OfferResponse;
import com.expedia.service.HotelService;
@EnableWebMvc
@RestController
@RequestMapping("/getOffers")
public class OffersRestController {

	private static final Logger logger = LoggerFactory.getLogger(OffersRestController.class);

	@Autowired
	HotelService hotelService;

	@RequestMapping(value = "/v1", method = RequestMethod.GET)
	public ResponseEntity<OfferResponse> getAllOffers(@RequestParam MultiValueMap<String, String> requestParams) {

		
		
		logger.info("Call /getOffers/v1/ rest endpoint ");

		OfferResponse hotelsOffers = hotelService.getHotelsOffers(requestParams);


		if (hotelsOffers.getOffers().getHotel() == null) {

			logger.info(" Calling Rest No Offers was Found ");
			return new ResponseEntity<OfferResponse>(HttpStatus.NO_CONTENT);// You many decide to return
																			// HttpStatus.NOT_FOUND
		} else 
		{
			logger.info("After Calling Rest offers exist ");
			logger.info("Number Of Offers is " + hotelsOffers.getOffers().getHotel().size());
			
			
			return new ResponseEntity<OfferResponse>(hotelsOffers, HttpStatus.OK);
		}
	}
}