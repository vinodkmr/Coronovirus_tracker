package com.covid9.stats.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DistrictData {
	
	private String district;
	
	private String notes;
	
	private int active;
	
	private int confirmed;
	
	private int deceased;
	
	private int recovered;
	
	private Delta delta;
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public int getActive() {
		return active;
	}
	public void setActive(int active) {
		this.active = active;
	}
	public int getConfirmed() {
		return confirmed;
	}
	public void setConfirmed(int confirmed) {
		this.confirmed = confirmed;
	}
	public int getDeceased() {
		return deceased;
	}
	public void setDeceased(int deceased) {
		this.deceased = deceased;
	}
	public int getRecovered() {
		return recovered;
	}
	public void setRecovered(int recovered) {
		this.recovered = recovered;
	}
	public Delta getDelta() {
		return delta;
	}
	public void setDelta(Delta delta) {
		this.delta = delta;
	}
	
	
}
