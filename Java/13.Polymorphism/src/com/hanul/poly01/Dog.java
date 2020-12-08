package com.hanul.poly01;

public class Dog extends Animal {	// 하위 클래스 : Animal Class 상속
	@Override		// 재정의 : 상위 클래스가 정의한 메소드를 수정 (하위 클래스에서 오버라이드된 메소드가 우선권을 가짐)
	public void cry() {
		System.out.println("멍멍");
	}
	
	
}//class
