package com.hanul.product;

import java.text.DecimalFormat;
import java.util.ArrayList;

public class ProductDAO {
	
	private ArrayList<ProductDTO> list;

	// list�� �Ű������� ���޹޴� ������ �޼ҵ�
	public ProductDAO(ArrayList<ProductDTO> list) {
		this.list = list;
	}

	// ���� ���
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

	// ���� �������� ����
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

	// �̸� �������� ����
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
		
		// printf("���Ĺ��ڿ�", ����ϴ� ��1, ��2, ~~);
		// �� ���Ĺ��ڿ�
		// %s : ���ڿ�
		// %d : ����
		// %f : �Ǽ�
		
	}//nameAscSort()
	
	// ���
	public void display() {
		System.out.println("��ǰ��\t�ܰ�\t����\t����");
		System.out.println("===============================");
		DecimalFormat df = new DecimalFormat("��#,##0");
		for (ProductDTO dto : list) {
			System.out.print(dto.getName() + "\t");
			System.out.print(df.format(dto.getCost()) + "\t");
			System.out.print(dto.getSu() + "\t");
			System.out.print(df.format(dto.getPrice()) + "\n");
		}//for
		System.out.println("===============================\n");
	}//display()
	
	//printf�� ���
	public void print() {
		for (ProductDTO dto : list) {
			DecimalFormat df = new DecimalFormat("��#,##0");
			System.out.printf("%s \t %d \t %d \t %10s \n", 
					dto.getName(), dto.getCost(), 
					dto.getSu(), df.format(dto.getPrice()));
		}//for
	}//print()
	
}//class
