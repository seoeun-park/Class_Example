package com.hanul.mouse;
public class OpticalMouse extends WheelMouse{
	// ���� Ŭ������ WheelMouse Class�� ���� Ŭ������ OpticalMouse Class�� ��� ����

	// �������̵�(Override) : �ڽ� Ŭ�������� �θ� Ŭ�����κ��� ��ӹ��� �޼ҵ带 ������(����)
	
	// �������̵� �� �޼ҵ�����, ���� ������ �޼ҵ����� �����ϱ� ���� 
	// 1. �������̵�� �޼ҵ� ��ܺο��� @Override��� ǥ�����ְų�
	@Override
	public void clickLeft() {
		System.out.println("�����콺 ���� Ŭ��");
	}//clickLeft()
	
	// 2. Source �޴��� > Override / Implement Method Ŭ�� > �������̵��� �޼ҵ� ����
	@Override
	public void clickRight() {
		// super.clickRight();
		// �� �����θ� ������ ���� ������ �θ� Ŭ������ �ش� �޼ҵ带 �״�� �����Ų�ٴ� �ǹ�
		System.out.println("�����콺 ������ Ŭ��");
	}
	
	// 3. Ctrl + Spacebar > �������̵��� �޼ҵ� ����
	@Override
	public void scroll() {
		// super.scroll();
		System.out.println("�����콺 ��ũ�� ���");
	}
}//class

/*
  	�������̵��� ����
  	
 	1. �ݵ�� ���� Ŭ���� �޼ҵ�� ������ �̸�, ������ ȣ�� ����, ��ȯ Ÿ���� ������ �Ѵ�.
 	
	2. �������̵��� �޼ҵ��� ���� �����ڴ� ���� Ŭ������ �޼ҵ��� ���� ������ ���� ������ �� ����.
    public > protected > private ������ ���� ������ ��������.
    
	3. ��ȯ Ÿ���� �ٸ��� ����
	
	4. static, private, �Ǵ� final �޼ҵ�� �������̵� �� �� ����.
 */
