package com.hanul.student;

public class StudentDTO {
	// �������
	private String name;	//����
	private String num;		//�й�
	private String major;	//�а�
	private float java;		//java ����
	private float cpp;		//c++ ����
	private float sum;		//����
	private float avg;		//���
	
	// ����Ʈ ������ �޼ҵ�
	public StudentDTO() {}
	
	// ������ �޼ҵ� �ʱ�ȭ
	public StudentDTO(String name, String num, String major, float java, float cpp) {
		super();
		this.name = name;
		this.num = num;
		this.major = major;
		this.java = java;
		this.cpp = cpp;
	}
	
	// Getters & Setters Method
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public float getJava() {
		return java;
	}

	public void setJava(float java) {
		this.java = java;
	}

	public float getCpp() {
		return cpp;
	}

	public void setCpp(float cpp) {
		this.cpp = cpp;
	}

	public float getSum() {
		return sum;
	}

	public void setSum(float sum) {
		this.sum = sum;
	}

	public float getAvg() {
		return avg;
	}

	public void setAvg(float avg) {
		this.avg = avg;
	}
	
}//class
