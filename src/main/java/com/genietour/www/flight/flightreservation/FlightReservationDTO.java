package com.genietour.www.flight.flightreservation;

import org.springframework.stereotype.Component;

@Component
public class FlightReservationDTO {
	private int fliResCode, seatCode;
	private String passport, korName, engName, gender, phone, comments, memId, birth, resDate;
	
	public int getFliResCode() {
		return fliResCode;
	}
	public void setFliResCode(int fliResCode) {
		this.fliResCode = fliResCode;
	}
	public int getSeatCode() {
		return seatCode;
	}
	public void setSeatCode(int seatCode) {
		this.seatCode = seatCode;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getResDate() {
		return resDate;
	}
	public void setResDate(String resDate) {
		this.resDate = resDate;
	}
	public String getPassport() {
		return passport;
	}
	public void setPassport(String passport) {
		this.passport = passport;
	}
	public String getKorName() {
		return korName;
	}
	public void setKorName(String korName) {
		this.korName = korName;
	}
	public String getEngName() {
		return engName;
	}
	public void setEngName(String engName) {
		this.engName = engName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
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
	
	
}
