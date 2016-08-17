package com.genietour.www.member;

import org.springframework.stereotype.Component;

@Component
public class MemberDTO {
	private String memId,password,memName,phone,role;
	
	public MemberDTO() {}
	public MemberDTO(String memId,String password,String memName,String phone,String role) {
		this.memId = memId;
		this.password = password;
		this.memName = memName;
		this.phone = phone;
		this.role = role;
	}
	
	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
	
}
