package com.hanul.finalanimal;

public class Final_Dog extends Final_Animal{	//extends : ���
	
	@Override			// cry() �޼ҵ带 ������(Override)
	public void cry() {
		super.cry();		// �θ� Ŭ������ �ִ� cry() �޼ҵ� ����
		System.out.println("�۸�");
	}
	
	public void run() {
		//System.out.println(name + "�� �ڴ�.");		
		//���� : ��������� ���� �����ڰ� private�̱� ������ ������ �Ұ���  �� getter �޼ҵ�� ����
		
		System.out.println(getName() + "�� �ڴ�.");
	}

}//class
