package com.hanul.animal;
// ���� ���� ���(�� ������� �ʴ� ���, �ַ� �޼ҵ带 ���)
public class Animal {		// �θ� Ŭ���� : ���� ����(��� ����, �ʵ�) ��  DTO Class, VO Class
	private String name;
	private int age;
	
	// ����Ʈ ������ �޼ҵ�
	public Animal() {}

	// ������ �޼ҵ� �ʱ�ȭ
	public Animal(String name, int age) {
		super();		// ���⼭ ���ϴ� super�� Object Ŭ����(�ڵ����� ���)
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
