package com.hanul.fruit;

import java.util.ArrayList;

public class FruitDAO {
	
	private ArrayList<FruitDTO> list;
	
	public FruitDAO(ArrayList<FruitDTO> list) {
		this.list = list;
	}
	
	//가격 계산
	public void getPrice() {
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setPrice(list.get(i).getCost() * list.get(i).getSu());
			/*list.set(i, list.get(i).getCost() * list.get(i).getSu());*/
		}
	}//getPrice()
	
	//가격 내림차순 정렬
	public void priceDesSort() {
		for (int i = 0; i < list.size(); i++) {
			for (int j = i + 1; j < list.size(); j++) {
				if (list.get(i).getPrice() < list.get(j).getPrice()) {
					FruitDTO temp = list.get(i);
					list.set(i, list.get(j));
					list.set(j, temp);
				}
			}
		}
	}
	
	//출력
	public void display() {
		for (FruitDTO dto : list) {
			System.out.print(dto.getName() + "\t");
			System.out.print(dto.getCost() + "\t");
			System.out.print(dto.getSu() + "\t");
			System.out.print(dto.getPrice() + "\n");
		}//for
	}//display()
	
}
