package com.genietour.www.flight.seat;

import org.springframework.stereotype.Component;

@Component
public class SeatDTO {
	private int seatCode, price, vacancy, fliCode;
	private String seatType;
	
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
	
	public int getFliCode() {
		return fliCode;
	}
	
	public void setFliCode(int fliCode) {
		this.fliCode = fliCode;
	}
	
	public String getSeatType() {
		return seatType;
	}
	
	public void setSeatType(String seatType) {
		this.seatType = seatType;
	}
	
}
