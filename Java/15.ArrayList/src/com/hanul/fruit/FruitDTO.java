package com.hanul.fruit;

public class FruitDTO {
	//������� ���� : �������� �� private
	private String name;	//���ϸ�
	private int cost;		//�ܰ�
	private int su;			//�ֹ�����
	private int price;		//����
	
	//����Ʈ ������ �޼ҵ�
	public FruitDTO() {}
	
	//������ �޼ҵ� �ʱ�ȭ
	public FruitDTO(String name, int cost, int su) {
		super();
		this.name = name;
		this.cost = cost;
		this.su = su;
		//price�� ���� ����ϹǷ� �����ڷ� �ʱ�ȭ��Ű�� �ʴ´�.
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
