package com.expedia.service;



import org.springframework.util.MultiValueMap;

import com.expedia.model.OfferResponse;

public interface HotelService {
	
	
	OfferResponse getHotelsOffers(MultiValueMap<String, String> requestParams);
	
	
	
}
