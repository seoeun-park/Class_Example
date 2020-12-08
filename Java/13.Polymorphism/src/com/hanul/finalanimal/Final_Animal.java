package com.hanul.finalanimal;

public class Final_Animal {		//상위 클래스
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
	
	// 추상 메소드(구현부 x)
	// public abstract void cry();
	
	// 일반 메소드
	public void cry() {
		System.out.println(name + "가 소리를 낸다.");
	}//cry()
	
}//class
