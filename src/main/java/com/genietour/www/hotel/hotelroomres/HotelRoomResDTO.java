package com.genietour.www.hotel.hotelroomres;

import org.springframework.stereotype.Component;

@Component
public class HotelRoomResDTO {
	private int hotCode, roomCode, price, maxRoom, resCount, vacancy;
	private String hotName, country, city, address, tel, homepage, roomType, options;
	private String stayDate, startDay, endDay;
	
	public int getHotCode() {
		return hotCode;
	}
	public void setHotCode(int hotCode) {
		this.hotCode = hotCode;
	}
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
	public int getMaxRoom() {
		return maxRoom;
	}
	public void setMaxRoom(int maxRoom) {
		this.maxRoom = maxRoom;
	}
	public int getResCount() {
		return resCount;
	}
	public void setResCount(int resCount) {
		this.resCount = resCount;
	}
	public int getVacancy() {
		return vacancy;
	}
	public void setVacancy(int vacancy) {
		this.vacancy = vacancy;
	}
	public String getHotName() {
		return hotName;
	}
	public void setHotName(String hotName) {
		this.hotName = hotName;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getRoomType() {
		return roomType;
	}
	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}
	public String getOptions() {
		return options;
	}
	public void setOptions(String options) {
		this.options = options;
	}
	public String getStayDate() {
		return stayDate;
	}
	public void setStayDate(String stayDate) {
		this.stayDate = stayDate;
	}
	public String getStartDay() {
		return startDay;
	}
	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}
	public String getEndDay() {
		return endDay;
	}
	public void setEndDay(String endDay) {
		this.endDay = endDay;
	}
	
}
