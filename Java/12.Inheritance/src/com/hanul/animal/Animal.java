package com.hanul.animal;
// 상태 정보 상속(잘 사용하지 않는 방법, 주로 메소드를 상속)
public class Animal {		// 부모 클래스 : 상태 정보(멤버 변수, 필드) ▶  DTO Class, VO Class
	private String name;
	private int age;
	
	// 디폴트 생성자 메소드
	public Animal() {}

	// 생성자 메소드 초기화
	public Animal(String name, int age) {
		super();		// 여기서 말하는 super는 Object 클래스(자동으로 상속)
		this.name = name;
		this.age = age;
	}
	
	// Getter & Setter
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}
	
	
	
	

}
