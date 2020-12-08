package com.hanul.product;

import java.text.DecimalFormat;
import java.util.ArrayList;

public class ProductDAO {
	
	private ArrayList<ProductDTO> list;

	// list를 매개변수로 전달받는 생성자 메소드
	public ProductDAO(ArrayList<ProductDTO> list) {
		this.list = list;
	}

	// 가격 계산
	public void getPrice() {
		for (ProductDTO dto : list) {
			dto.setPrice(dto.getCost() * dto.getSu());
		}
		
		/*
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setPrice(list.get(i).getCost() * list.get(i).getSu());
		}//for
		*/
	}//getPrice()

	// 가격 내림차순 정렬
	public void priceDescSort() {
		for (int i = 0; i < list.size(); i++) {
			for (int j = i + 1; j < list.size(); j++) {
				if (list.get(i).getPrice() < list.get(j).getPrice()) {
					ProductDTO temp = list.get(i);
					list.set(i, list.get(j));
					list.set(j, temp);
				}//if
			}//for j
		}//for i
	}//priceDescSort()

	// 이름 오름차순 정렬
	public void nameAscSort() {
		for (int i = 0; i < list.size(); i++) {
			for (int j = i + 1; j < list.size(); j++) {
				if (list.get(i).getName().compareTo(list.get(j).getName()) > 0) {
					ProductDTO temp = list.get(i);
					list.set(i, list.get(j));
					list.set(j, temp);
				}//if
			}//for j
		}//for i
		
		// printf("형식문자열", 출력하는 값1, 값2, ~~);
		// → 형식문자열
		// %s : 문자열
		// %d : 정수
		// %f : 실수
		
	}//nameAscSort()
	
	// 출력
	public void display() {
		System.out.println("제품명\t단가\t수량\t가격");
		System.out.println("===============================");
		DecimalFormat df = new DecimalFormat("￦#,##0");
		for (ProductDTO dto : list) {
			System.out.print(dto.getName() + "\t");
			System.out.print(df.format(dto.getCost()) + "\t");
			System.out.print(dto.getSu() + "\t");
			System.out.print(df.format(dto.getPrice()) + "\n");
		}//for
		System.out.println("===============================\n");
	}//display()
	
	//printf로 출력
	public void print() {
		for (ProductDTO dto : list) {
			DecimalFormat df = new DecimalFormat("￦#,##0");
			System.out.printf("%s \t %d \t %d \t %10s \n", 
					dto.getName(), dto.getCost(), 
					dto.getSu(), df.format(dto.getPrice()));
		}//for
	}//print()
	
}//class
