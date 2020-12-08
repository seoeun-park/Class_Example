package com.hanul.member;

import java.util.ArrayList;

public class MemberDAO {
	// ��� �޼ҵ�
	public void display(ArrayList<MemberDTO> list) {
		
		// ���ѹ迭�� forEach������ ����ϴ� ���� ���ϴ�.
		for(MemberDTO dto : list) {
			System.out.print(dto.getName() + "\t");
			System.out.print(dto.getAge() + "\t");
			System.out.print(dto.getAddr() + "\t");
			System.out.print(dto.getTel() + "\n");
		}//forEach
		System.out.println("=============================================");
	}//display()

	// ������ �������� ����
	public void ageAscSort(ArrayList<MemberDTO> list) {
		for (int i = 0; i < list.size(); i++) {
			for (int j = i + 1; j < list.size(); j++) {
				if (list.get(i).getAge() > list.get(j).getAge()) {
					MemberDTO temp = list.get(i);
					list.set(i, list.get(j));
					list.set(j, temp);
				}//if
			}//for j
		}//for i
	}//ageAscSort()
	
	//�̸��� �������� ����
	public void nameDescSort(ArrayList<MemberDTO> list) {
		for (int i = 0; i < list.size(); i++) {
			for (int j = i + 1; j < list.size(); j++) {
				if (list.get(i).getName().compareTo(list.get(j).getName()) < 0) {
					MemberDTO temp =  list.get(i);
					list.set(i, list.get(j));
					list.set(j, temp);
				}//if
			}//for j
		}//for i
	}//nameDescSort()
	
}//class
