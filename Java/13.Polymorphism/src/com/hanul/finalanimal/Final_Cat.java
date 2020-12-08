package com.hanul.finalanimal;

public class Final_Cat extends Final_Animal{
	@Override
	public void cry() {
		super.cry();
		System.out.println("야옹");
	}
	
	public void grooming() {
		System.out.println(getName() + "가 그루밍을 한다.");
	}
}//class
