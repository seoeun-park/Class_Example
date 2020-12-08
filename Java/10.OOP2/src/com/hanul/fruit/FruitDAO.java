package com.hanul.fruit;
// FruitMain에서 생성한 객체배열(fruit[])을 매개변수로 전달받는 생성자 메소드 작성
// getPrice() : 가격 계산	/	getDescSort() : 가격 내림차순 정렬
// display() : 출력

public class FruitDAO {
	public FruitDAO() {}

	private FruitDTO[] fruit;
	
	public FruitDAO(FruitDTO[] fruit) {
		this.fruit = fruit;
	}//FruitDAO()
	
	// 가격 계산
	public void getPrice() {
		for (int i = 0; i < fruit.length; i++) {
			fruit[i].setPrice(fruit[i].getCost() * fruit[i].getSu());
		}
	}//getPrice()
	
	// 가격의 내림차순 정렬
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
	
	// 출력
	public void display() {
		System.out.println("과일명\t단가\t수량\t가격\t");
		System.out.println("==============================");
		for (int i = 0; i < fruit.length; i++) {
			System.out.print(fruit[i].getName() + "\t");
			System.out.print(fruit[i].getCost() + "\t");
			System.out.print(fruit[i].getSu() + "\t");
			System.out.println(fruit[i].getPrice() + "\t");
		}//for
	}//display()
	
}//class
