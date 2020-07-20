package com.covid9.stats.model;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonAutoDetect.Visibility;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@lombok.Data
@NoArgsConstructor
@AllArgsConstructor
@JsonAutoDetect(fieldVisibility = Visibility.ANY) 
public class Data {

	private String state;
	private String statecode;
	private List<DistrictData> districtData;
	private int totalConfirmed;
	private int totalDeceased;
	private int totalRecovered;
	private int totalActive;
	public int getTotalActive() {
		return totalActive;
	}
	public void setTotalActive(int totalActive) {
		this.totalActive = totalActive;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getStatecode() {
		return statecode;
	}
	public void setStatecode(String statecode) {
		this.statecode = statecode;
	}
	public List<DistrictData> getDistrictData() {
		return districtData;
	}
	public void setDistrictData(List<DistrictData> districtData) {
		this.districtData = districtData;
	}
	public int getTotalConfirmed() {
		return totalConfirmed;
	}
	public void setTotalConfirmed(int totalConfirmed) {
		this.totalConfirmed = totalConfirmed;
	}
	public int getTotalDeceased() {
		return totalDeceased;
	}
	public void setTotalDeceased(int totalDeceased) {
		this.totalDeceased = totalDeceased;
	}
	public int getTotalRecovered() {
		return totalRecovered;
	}
	public void setTotalRecovered(int totalRecovered) {
		this.totalRecovered = totalRecovered;
	}

}
