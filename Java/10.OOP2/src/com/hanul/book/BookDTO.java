package com.hanul.book;

public class BookDTO {
	// ������� ����
	private String title;	//����
	private String name; 	//����
	private String comp;	//���ǻ�
	private int cost;		//�ܰ�
	private int su;			//����
	private int price;		//����
	
	// ����Ʈ ������ �޼ҵ�
	public BookDTO() {}

	// ������ �޼ҵ� �ʱ�ȭ (������ �����ϴ� ��� ������ �ʱ�ȭ��Ű�� x)
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
