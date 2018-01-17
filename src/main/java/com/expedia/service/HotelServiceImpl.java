package com.expedia.service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.expedia.model.OfferResponse;

@Service("hotelService")
public class HotelServiceImpl implements HotelService {

	private static final Logger logger = LoggerFactory.getLogger(HotelServiceImpl.class);

	@Value("${expedia.offers.service.url}")
	private String restUrl;

	@Override
	public OfferResponse getHotelsOffers(MultiValueMap<String, String> requestParams) {

		logger.info("Start calling " + restUrl);
		logger.info("Query Parameters   " + requestParams);

		HttpHeaders headers = new HttpHeaders();
		headers.set("Accept", MediaType.APPLICATION_JSON_VALUE);
		UriComponentsBuilder builder = UriComponentsBuilder.fromHttpUrl(restUrl).queryParams(requestParams);

		HttpEntity<?> entity = new HttpEntity<>(headers);
		RestTemplate restTemplate = new RestTemplate();

		OfferResponse offerResponse = restTemplate
				.exchange(builder.build().encode().toUri(), HttpMethod.GET, entity, OfferResponse.class).getBody();

		
		
		
		return offerResponse;

	}

}
