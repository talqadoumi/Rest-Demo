package com.expedia.model;
import java.util.List;
/**
 * 
 * Using lombok to generate data (  set,get toString and constructor  ) at runtime 
 *
 */

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;
@Data
public class Offers {

		
		@JsonProperty(value="Hotel")
		List<HotelOffer> hotel;

	
}
