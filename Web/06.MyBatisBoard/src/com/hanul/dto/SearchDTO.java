package com.hanul.dto;

import java.io.Serializable;

// 디폴트 생성자, 생성자 메소드 x → VO Class
public class SearchDTO implements Serializable{
	private String part;
	private String searchData;
	
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public String getSearchData() {
		return searchData;
	}
	public void setSearchData(String searchData) {
		this.searchData = searchData;
	}
	
}//class
