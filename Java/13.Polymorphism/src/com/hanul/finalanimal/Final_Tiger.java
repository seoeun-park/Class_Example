package com.hanul.finalanimal;

public class Final_Tiger extends Final_Animal{
	@Override
	public void cry() {
		super.cry();
		System.out.println("����");
	}
	
	public void hunter() {
		System.out.println(getName() + "�� ����� �Ѵ�.");
	}
}//class
