package com.genietour.www.flight.seat;

public enum ESeatType {
	이코노미(0),
	비지니스(1),
	퍼스트(2);
	
	int value;
	
	private ESeatType(int value) {
		this.value = value;
	}
	
	public int toInt() {
		return value;
	}
}
