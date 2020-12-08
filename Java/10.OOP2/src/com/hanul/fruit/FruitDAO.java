package com.hanul.fruit;
// FruitMain���� ������ ��ü�迭(fruit[])�� �Ű������� ���޹޴� ������ �޼ҵ� �ۼ�
// getPrice() : ���� ���	/	getDescSort() : ���� �������� ����
// display() : ���

public class FruitDAO {
	public FruitDAO() {}

	private FruitDTO[] fruit;
	
	public FruitDAO(FruitDTO[] fruit) {
		this.fruit = fruit;
	}//FruitDAO()
	
	// ���� ���
	public void getPrice() {
		for (int i = 0; i < fruit.length; i++) {
			fruit[i].setPrice(fruit[i].getCost() * fruit[i].getSu());
		}
	}//getPrice()
	
	// ������ �������� ����
	public void priceDesSort() {
		for (int i = 0; i < fruit.length; i++) {
			for (int j = i + 1; j < fruit.length; j++) {
				if(fruit[i].getPrice() < fruit[j].getPrice()) {
					FruitDTO temp = fruit[i];
					fruit[i] = fruit[j];
					fruit[j] = temp;
				}
			}//for j
		}//for i	
	}//priceDesSort
	
	// ���
	public void display() {
		System.out.println("���ϸ�\t�ܰ�\t����\t����\t");
		System.out.println("==============================");
		for (int i = 0; i < fruit.length; i++) {
			System.out.print(fruit[i].getName() + "\t");
			System.out.print(fruit[i].getCost() + "\t");
			System.out.print(fruit[i].getSu() + "\t");
			System.out.println(fruit[i].getPrice() + "\t");
		}//for
	}//display()
	
}//class
