package com.hanul.book;

public class BookDTO {
	private String num;
	private String title;
	private String company;
	private String name;
	private int cost;
	
	public BookDTO() {}

	public BookDTO(String num, String title, String company, String name, int cost) {
		super();
		this.num = num;
		this.title = title;
		this.company = company;
		this.name = name;
		this.cost = cost;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getCost() {
		return cost;
	}

	public void setCost(int cost) {
		this.cost = cost;
	}
	
	
}
