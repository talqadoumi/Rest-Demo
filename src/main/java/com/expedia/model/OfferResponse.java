package com.expedia.model;

import java.util.Map;

import lombok.Data;

/**
 * 
 * Using lombok to generate data (  set,get toString and constructor  ) at runtime 
 *
 */


@Data
public class OfferResponse {

	Offers offers;
	Map<String, Object> userInfo;
	Map<String, String> offerInfo;

	

}
