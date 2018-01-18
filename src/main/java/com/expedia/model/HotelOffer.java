package com.expedia.model;
import java.util.Map;

import lombok.Data;
/**
 * 
 * Using lombok to generate data (  set,get toString and constructor  ) at runtime 
 *
 */


@Data

public class HotelOffer {

	private Map<String, String> hotelInfo;
	private Map<String, Object> offerDateRange;
	private Map<String, String> destination;
	private Map<String, String> hotelUrgencyInfo;
	private Map<String, String> hotelPricingInfo;
	private Map<String, String > hotelUrls;

	
}
