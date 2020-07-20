package com.covid19.stats.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.*;

import com.covid9.stats.model.Data;
import com.covid9.stats.model.DistrictData;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.covid19.stats.service.Service;

@org.springframework.stereotype.Controller
public class Controller {
	
	@Autowired
	Service service;
	
	@GetMapping("/")
	public String showIndex(final Model model) throws JsonMappingException, JsonProcessingException {
		
		List<Data> dataListByState = service.getData();
				
		for(Data data : dataListByState) {
			List<DistrictData> districtDatas = data.getDistrictData();
			int confirmed = 0;
			int deceased = 0;
			int recovered = 0;
			int active = 0;
			for(DistrictData districtData : districtDatas) {
				confirmed += districtData.getConfirmed();
				deceased += districtData.getDeceased();
				recovered += districtData.getRecovered();
				active  += districtData.getActive();
			}
			data.setTotalConfirmed(confirmed);
			data.setTotalDeceased(deceased);
			data.setTotalRecovered(recovered);
			data.setTotalActive(active);
		}		
		model.addAttribute("dataListByState", dataListByState);
		return "index";
	}
	
	/*
	 * @GetMapping("/getDistrictDataByState") public String
	 * getDistrictDataByState(@PathVariable String stateName) { return }
	 */
	
	
}
