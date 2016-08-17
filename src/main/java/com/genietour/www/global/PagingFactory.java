package com.genietour.www.global;

public class PagingFactory {
	public static Paging createPaging(String strPageNo, int countRow) {
		return new ListPaging(strPageNo, countRow);
	}
}
