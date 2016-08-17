package com.genietour.www.hotel.room;

import org.springframework.stereotype.Component;

@Component
public class RoomDTO {
	private int roomCode, price, vacancy, hotCode;
	private String roomType;
	public int getRoomCode() {
		return roomCode;
	}
	public void setRoomCode(int roomCode) {
		this.roomCode = roomCode;
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
	public int getHotCode() {
		return hotCode;
	}
	public void setHotCode(int hotCode) {
		this.hotCode = hotCode;
	}
	public String getRoomType() {
		return roomType;
	}
	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}
	
	
	
}
