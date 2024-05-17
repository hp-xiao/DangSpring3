package com.icss.dto;

public class TurnPage {	
	public int page =1 ;             //当前页号        
	public int rows = 10;            //每页显示行数
	public int allRows =1 ;
	public int allPages = 1;
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public int getAllRows() {
		return allRows;
	}
	public void setAllRows(int allRows) {
		this.allRows = allRows;
	}
	public int getAllPages() {
		return allPages;
	}
	public void setAllPages(int allPages) {
		this.allPages = allPages;
	}	
}
