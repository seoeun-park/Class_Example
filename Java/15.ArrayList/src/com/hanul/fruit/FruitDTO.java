package com.hanul.fruit;

public class FruitDTO {
	//멤버변수 선언 : 정보은닉 ▶ private
	private String name;	//과일명
	private int cost;		//단가
	private int su;			//주문수량
	private int price;		//가격
	
	//디폴트 생성자 메소드
	public FruitDTO() {}
	
	//생성자 메소드 초기화
	public FruitDTO(String name, int cost, int su) {
		super();
		this.name = name;
		this.cost = cost;
		this.su = su;
		//price는 직접 계산하므로 생성자로 초기화시키지 않는다.
	}
	
	//Getters & Setters
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
	
	
	
}//class
