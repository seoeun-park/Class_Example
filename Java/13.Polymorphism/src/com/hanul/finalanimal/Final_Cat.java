package com.hanul.finalanimal;

public class Final_Cat extends Final_Animal{
	@Override
	public void cry() {
		super.cry();
		System.out.println("�߿�");
	}
	
	public void grooming() {
		System.out.println(getName() + "�� �׷���� �Ѵ�.");
	}
}//class
