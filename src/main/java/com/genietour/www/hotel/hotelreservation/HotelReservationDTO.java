package com.genietour.www.hotel.hotelreservation;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class HotelReservationDTO {
	private int hotResCode; 
	private int payment; 
	private int roomCode;
	private String hotResName;
	private String email;
	private String phone;
	private String nationality;
	private String gender;
	private String arrTime;
	private String comments;
	private String memId;
	private String stayDate;
	private String resDate;
	
	public int getHotResCode() {
		return hotResCode;
	}
	public void setHotResCode(int hotResCode) {
		this.hotResCode = hotResCode;
	}
	public int getPayment() {
		return payment;
	}
	public void setPayment(int payment) {
		this.payment = payment;
	}
	public int getRoomCode() {
		return roomCode;
	}
	public void setRoomCode(int roomCode) {
		this.roomCode = roomCode;
	}
	public String getHotResName() {
		return hotResName;
	}
	public void setHotResName(String hotResName) {
		this.hotResName = hotResName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getNationality() {
		return nationality;
	}
	public void setNationality(String nationality) {
		this.nationality = nationality;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getArrTime() {
		return arrTime;
	}
	public void setArrTime(String arrTime) {
		this.arrTime = arrTime;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getStayDate() {
		return stayDate;
	}
	public void setStayDate(String stayDate) {
		this.stayDate = stayDate;
	}
	public String getResDate() {
		return resDate;
	}
	public void setResDate(String resDate) {
		this.resDate = resDate;
	}
	
	
}
