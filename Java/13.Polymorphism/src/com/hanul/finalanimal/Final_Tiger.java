package com.hanul.finalanimal;

public class Final_Tiger extends Final_Animal{
	@Override
	public void cry() {
		super.cry();
		System.out.println("어흥");
	}
	
	public void hunter() {
		System.out.println(getName() + "가 사냥을 한다.");
	}
}//class
