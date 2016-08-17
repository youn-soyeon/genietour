package com.genietour.www.flight.flight;

import org.springframework.stereotype.Component;

@Component
public class FlightDTO {
	private int fliCode;
	private String airline, fliName, depCity, arrCity, depDate, arrDate;
	
	public int getFliCode() {
		return fliCode;
	}
	
	public void setFliCode(int fliCode) {
		this.fliCode = fliCode;
	}
	
	public String getAirline() {
		return airline;
	}
	
	public void setAirline(String airline) {
		this.airline = airline;
	}
	
	public String getFliName() {
		return fliName;
	}
	
	public void setFliName(String fliName) {
		this.fliName = fliName;
	}
	
	public String getDepCity() {
		return depCity;
	}
	
	public void setDepCity(String depCity) {
		this.depCity = depCity;
	}
	
	public String getArrCity() {
		return arrCity;
	}
	
	public void setArrCity(String arrCity) {
		this.arrCity = arrCity;
	}
	
	public String getDepDate() {
		return depDate;
	}
	
	public void setDepDate(String depDate) {
		this.depDate = depDate;
	}
	
	public String getArrDate() {
		return arrDate;
	}
	
	public void setArrDate(String arrDate) {
		this.arrDate = arrDate;
	}
}
