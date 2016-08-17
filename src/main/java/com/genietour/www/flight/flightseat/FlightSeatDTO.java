package com.genietour.www.flight.flightseat;

import org.springframework.stereotype.Component;

@Component
public class FlightSeatDTO {
	private int fliCode, seatCode, price, vacancy;
	private String airline, fliName, depCity, arrCity, depTime, arrTime, seatType, depDate, arrDate, duration;

	public int getFliCode() {
		return fliCode;
	}

	public void setFliCode(int fliCode) {
		this.fliCode = fliCode;
	}

	public int getSeatCode() {
		return seatCode;
	}

	public void setSeatCode(int seatCode) {
		this.seatCode = seatCode;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getVacancy() {
		return vacancy;
	}

	public void setVacancy(int vacancy) {
		this.vacancy = vacancy;
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

	public String getDepTime() {
		return depTime;
	}

	public void setDepTime(String depTime) {
		this.depTime = depTime;
	}

	public String getArrTime() {
		return arrTime;
	}

	public void setArrTime(String arrTime) {
		this.arrTime = arrTime;
	}

	public String getSeatType() {
		return seatType;
	}

	public void setSeatType(String seatType) {
		this.seatType = seatType;
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

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}
	
}
