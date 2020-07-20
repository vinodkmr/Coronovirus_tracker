package com.covid19.stats.service;

import java.util.List;

import org.springframework.web.client.RestTemplate;

import com.covid9.stats.model.Data;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@org.springframework.stereotype.Service
public class Service {
	
	private static final org.slf4j.Logger log = 
		    org.slf4j.LoggerFactory.getLogger(Service.class);
	
	
	private static final String URL = "https://api.covid19india.org/v2/state_district_wise.json";
	
	
	public List<Data> getData() {
		JsonNode jsonNode=  new RestTemplate().getForObject(URL, JsonNode.class);
		
		//Jackson's use of generics here are completely unsafe, but that's another issue
		return new ObjectMapper().convertValue(
				jsonNode, 
		    new TypeReference<List<Data>>(){}
		);
		
	}

}
