package com.hanul.finalanimal;

public class Final_Animal {		//���� Ŭ����
	private String name;
	
	public Final_Animal() {}
	
	public Final_Animal(String name) {
		super();
		this.name = name;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	// �߻� �޼ҵ�(������ x)
	// public abstract void cry();
	
	// �Ϲ� �޼ҵ�
	public void cry() {
		System.out.println(name + "�� �Ҹ��� ����.");
	}//cry()
	
}//class
