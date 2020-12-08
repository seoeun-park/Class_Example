package com.hanul.finalanimal;

public class Final_Dog extends Final_Animal{	//extends : 상속
	
	@Override			// cry() 메소드를 재정의(Override)
	public void cry() {
		super.cry();		// 부모 클래스에 있는 cry() 메소드 동작
		System.out.println("멍멍");
	}
	
	public void run() {
		//System.out.println(name + "가 뛴다.");		
		//오류 : 멤버변수의 접근 제어자가 private이기 때문에 접근이 불가능  → getter 메소드로 접근
		
		System.out.println(getName() + "가 뛴다.");
	}

}//class
