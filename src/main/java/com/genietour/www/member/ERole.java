package com.genietour.www.member;

public enum ERole {
	삭제(0),
	일반(1),
	판매(2),
	관리(3);
	
	int value;
	
	private ERole(int value) {
		this.value = value;		
	}

	public int toInt() {
		return value;
	}	
}
