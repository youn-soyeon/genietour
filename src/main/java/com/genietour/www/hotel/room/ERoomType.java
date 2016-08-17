package com.genietour.www.hotel.room;

public enum ERoomType {
	싱글(0),
	트윈(1),
	더블(2),
	트리플(3);
	
	int value;
	
	private ERoomType(int value) {
		this.value = value;
	}
	
	public int toInt() {
		return value;
	}
}
