package com.hanul.student;

import java.text.DecimalFormat;

public class StudentDAO {
	
	public StudentDTO[] student;

	public StudentDAO(StudentDTO[] student) {
		this.student= student;
	}//StudentDAO
	
	// ����, ��� ���
	public void getSumAvg() {
		for (int i = 0; i < student.length; i++) {
			student[i].setSum(student[i].getJava() + student[i].getCpp());
			student[i].setAvg(student[i].getSum() / 2);
		}//for
	}//getSumAvg()
	
	// ��� �������� ����
	public void avgDescSort() {
		for (int i = 0; i < student.length; i++) {
			for (int j = i + 1; j < student.length; j++) {
				if (student[i].getAvg() < student[j].getAvg()) {
					StudentDTO temp = student[i];
					student[i] = student[j];
					student[j] = temp;
				}//if
			}//for j
		}//for i
	}//avgDescSort()
	
	// ���� �������� ����
	public void nameAscSort() {
		for (int i = 0; i < student.length; i++) {
			for (int j = i + 1; j < student.length; j++) {
				if (student[i].getName().compareTo(student[j].getName()) > 0) {
					StudentDTO temp = student[i];
					student[i] = student[j];
					student[j] = temp;
				}//if
			}//for j
		}//for i
	}//nameAscSort()
	
	// ���
	public void display() {
		DecimalFormat df = new DecimalFormat("0.0");
		System.out.println("�̸�\t�й�\t�а�\tJAVA\tC++\t����\t���");
		System.out.println("====================================================");
		for (int i = 0; i < student.length; i++) {
			System.out.print(student[i].getName() + "\t");
			System.out.print(student[i].getNum() + "\t");
			System.out.print(student[i].getMajor() + "\t");
			System.out.print(student[i].getJava() + "\t");
			System.out.print(student[i].getCpp() + "\t");
			System.out.print(df.format(student[i].getSum()) + "\t");
			System.out.print(df.format(student[i].getAvg()) + "\n");
		}//for
		System.out.println("====================================================");
	}//display()
	
}//class
