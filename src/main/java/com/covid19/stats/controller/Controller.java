package com.covid19.stats.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

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
			
			Collections.sort(districtDatas,(DistrictData d1, DistrictData d2) -> d2.getConfirmed() - d1.getConfirmed());
			
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
		
		Collections.sort(dataListByState,(Data d1, Data d2) -> d2.getTotalConfirmed() - d1.getTotalConfirmed());

		model.addAttribute("dataListByState", dataListByState);
		return "index";
	}
		
	
}
