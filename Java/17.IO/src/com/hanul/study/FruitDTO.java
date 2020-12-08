package com.hanul.study;

public class FruitDTO {
	//��� ���� : ���ϸ�(name), �ܰ�(cost), ����(su), ����(price)
	private String name;
	private int cost;
	private int su;
	private int price;
	
	//����Ʈ ������ �޼���
	public FruitDTO() {}

	//������ �޼ҵ� �ʱ�ȭ
	public FruitDTO(String name, int cost, int su) {
		super();
		this.name = name;
		this.cost = cost;
		this.su = su;
	}

	//Getters & Setters �޼ҵ�
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
