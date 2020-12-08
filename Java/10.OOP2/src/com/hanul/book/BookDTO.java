package com.hanul.book;

public class BookDTO {
	// 멤버변수 선언
	private String title;	//제목
	private String name; 	//저자
	private String comp;	//출판사
	private int cost;		//단가
	private int su;			//수량
	private int price;		//가격
	
	// 디폴트 생성자 메소드
	public BookDTO() {}

	// 생성자 메소드 초기화 (가격을 저장하는 멤버 변수는 초기화시키지 x)
	public BookDTO(String title, String name, String comp, int cost, int su) {
		super();
		this.title = title;
		this.name = name;
		this.comp = comp;
		this.cost = cost;
		this.su = su;
	}
	
	// Getters & Setters Method
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getComp() {
		return comp;
	}

	public void setComp(String comp) {
		this.comp = comp;
	}

	public int getCost() {
		return cost;
	}

	public void setCost(int cost) {
		this.cost = cost;
	}

	public int getSu() {
		return su;
	}

	public void setSu(int su) {
		this.su = su;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
}
