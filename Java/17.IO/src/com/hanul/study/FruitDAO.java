package com.hanul.study;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.text.DecimalFormat;
import java.util.ArrayList;

import com.hanul.study.FruitDTO;
import java.text.DecimalFormat;

public class FruitDAO {
	//������ �޼ҵ忡 ArrayList<FruitDTO> list�� �Ű������� ������ �޼ҵ带 ����
	private ArrayList<FruitDTO> list;

	
	public FruitDAO(ArrayList<FruitDTO> list) {
		this.list = list;
	}
	
	//getPrice() : ���� ���
	public void getPrice() {
		for (FruitDTO dto : list) {
			dto.setPrice(dto.getCost() * dto.getSu());
		}//for
	}//getPrice()
	
	//priceDescSort() : ������ �������� ����
	public void priceDescSort() {
		for (int i = 0; i < list.size(); i++) {
			for (int j = i + 1; j < list.size(); j++) {
				if (list.get(i).getPrice() < list.get(j).getPrice()) {
					FruitDTO temp = list.get(i);
					list.set(i, list.get(j));
					list.set(j, temp);
				}//for j
			}//for j
		}//for i
	}//priceDescSort()
	
	//fileSave() : fruitResult.txt ������ �����Ͽ� ���(����)
	public void fileSave() {
		try {
			String outputPath = "D:\\JAVA��� ���� SW ������ ����\\Study_Java\\workspace\\17.IO\\fruitResult.txt";
			FileWriter fw = new FileWriter(outputPath);
			BufferedWriter bw = new BufferedWriter(fw);
			
			int index = 0;
			DecimalFormat df = new DecimalFormat("��#,##0");
			bw.write("���ϸ�\t�ܰ�\t����\t����");
			bw.write("\n==============================\n");
			for (FruitDTO dto2 : list) {
				if (index < list.size() - 1) {
					String data = dto2.getName() + "\t" + df.format(dto2.getCost()) + "\t"  
								  + dto2.getSu() + "\t"  + df.format(dto2.getPrice()) + "\n";
					bw.write(data);
					bw.write("\n");			//�ٹٲ� ó��
					bw.flush();
					index++;
				} else {
					String data = dto2.getName() + "\t" + df.format(dto2.getCost()) + "\t"  
							  + dto2.getSu() + "\t"  + df.format(dto2.getPrice());
				bw.write(data);
				bw.flush();
				System.out.println("������ �Ϸ�Ǿ����ϴ�!");
				}//if
				
			}//for
			bw.close();
			fw.close();
		} catch (Exception e) {
			e.printStackTrace();
		}//try-catch
	}//fileSave
	
	//display() : ȭ�� ���
	public void display() {
		DecimalFormat df = new DecimalFormat("��#,##0");
		System.out.println("���ϸ�\t�ܰ�\t����\t����");
		System.out.println("==============================");

		for (FruitDTO dto : list) {
			System.out.print(dto.getName() + "\t");
			System.out.print(df.format(dto.getCost()) + "\t");
			System.out.print(dto.getSu() + "\t");
			System.out.print(df.format(dto.getPrice()) + "\n");
		}//for
	}//display()
}//class
