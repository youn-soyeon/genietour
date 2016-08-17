package com.genietour.www.global;

import org.springframework.stereotype.Repository;

@Repository
public class Paging {
	/**
	 * pageSize : 한 페이지에 보여질 list 개수
	 * groupSize : 총 페이지 수
	 * pageNo : 내가 요청한 페이지
	 * startPage / endPage : 페이지 시작 번호 / 끝 번호 
	 * startRow / endRow : 글 시작 번호 / 끝 번호
	 * totalPages : 총 페이지 수
	 * */
	private final int PAGESIZE = 10; // 한 페이지에 보여줄 목록 개수, 10개로 고정
	private final int GROUPSIZE = 5; // 한 라인에 보여줄 페이지 개수, 5개로 고정
	private int startRow, endRow; //시작 글번호, 끝 글번호 (1-10, 11-20 ...)
	private int startPage, endPage; // 시작페이지, 끝 페이지 (총 글 수/10 ex) 101/10 = 10...1 => 11page)
	private int countRow; // 개수
	private int pageNo; // 내가 요청한 페이지 번호
	private int totalPages; // 총 페이지 수
	
	public Paging() {}
	public Paging(String strPageNo, int countRow) {
		this.pageNo = Integer.parseInt(strPageNo);
		this.countRow = countRow;
		
		int mok = countRow / PAGESIZE;
		int nmg = countRow % PAGESIZE;
		
		if(nmg != 0) {
			totalPages = mok + 1;
		} else {
			totalPages = mok;
		}
		
		this.startRow = (pageNo-1) * PAGESIZE; // 현재페이지-1 : 현재페이지가 1일경우 1*10이되므로 0*10이되게 만든다
		this.endRow = pageNo * PAGESIZE;
		if( endRow > countRow ) {
			this.endRow = countRow;
		}
		this.startPage = pageNo - ((pageNo-1) % GROUPSIZE);
		
		int end = startPage + GROUPSIZE - 1;
		if (end > totalPages) {
			end = totalPages;
		} 
		this.endPage = end;
	}
	
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getCountRow() {
		return countRow;
	}
	public void setCountRow(int countRow) {
		this.countRow = countRow;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
	public int getPAGESIZE() {
		return PAGESIZE;
	}
	public int getGROUPSIZE() {
		return GROUPSIZE;
	}
	@Override
	public String toString() {
		return "Paging [PAGESIZE=" + PAGESIZE + ", GROUPSIZE=" + GROUPSIZE
				+ ", startRow=" + startRow + ", endRow=" + endRow
				+ ", startPage=" + startPage + ", endPage=" + endPage
				+ ", countRow=" + countRow + ", pageNo=" + pageNo
				+ ", totalPages=" + totalPages + "]";
	}
	
}
