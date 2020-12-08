package com.hanul.book;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Scanner;

public class BookInput {
	private Scanner scanner;
	
	public BookInput(Scanner scanner) {
		this.scanner = scanner;
	}

	//���� ���� ��� ����ȭ��
	public void insertBookInput() {
		System.out.println("\n������� ȭ���Դϴ�.");
		System.out.print("����� ������ ��ȣ�� �Է��ϼ��� : ");
		String num = scanner.nextLine();
		
		BookDAO dao = new BookDAO();
		ResultSet rs = dao.checkNum(num);
		
		try {
			if (rs.next()) {
				System.out.println("�Է��Ͻ� " + num + "�� ������ �̹� �����մϴ�.");
				System.out.println("�ٽ� �Է��Ͻñ� �ٶ��ϴ�!");
			} else {
				if(dao.isNum(num)) {
					System.out.print("����� ������ ������ �Է��ϼ��� : ");
					String title = scanner.nextLine();
					System.out.print("����� ������ ���ǻ� �Է��ϼ��� : ");
					String company = scanner.nextLine();
					System.out.print("����� ������ ���ڸ� �Է��ϼ��� : ");
					String name = scanner.nextLine();
					System.out.print("����� ������ �ܰ��� �Է��ϼ��� : ");
					int cost = Integer.parseInt(scanner.nextLine());
					
					BookDTO dto = new BookDTO(num, title, company, name, cost);
					
					int succ = dao.insertBook(dto);
					if (succ > 0) {
						System.out.println("���������� ��ϵǾ����ϴ�.");
					} else {
						System.out.println("�������� ����� ���еǾ����ϴ�.");
					}
				} else {
					System.out.println("�Է��Ͻ� ���� ��ȣ�� ������ �ٸ��� �ʽ��ϴ�.");
					System.out.println("����) xxx-xx-xxxx-xxx-x \n");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insertBookInput() Exception!");
		}
	}//insertBookInput()
	
	//���� ��ü ��� �˻� ����ȭ��
	public void selectBookAllInput() {
		System.out.println("\n���� ��� ���� ȭ���Դϴ�.");
		BookDAO dao = new BookDAO();
		ArrayList<BookDTO> list = dao.selectBookAll();
		dao.display(list);
		
	}//selectBookAllInput()
	
	//���� ���� �˻� ����ȭ��
	public void selectBookTitleInput() {
		System.out.println("���� ���� �˻� ȭ���Դϴ�.");
		System.out.print("�˻��� ������ ������ �Է��ϼ��� : ");
		String searchTitle = scanner.nextLine();
		BookDAO dao = new BookDAO();
		ArrayList<BookDTO> list = dao.selectBookTitle(searchTitle);
		dao.display(list);
	}//selectBookTitleInput()
	
	//���� ���� ���� ����ȭ��
	public void deleteBookInput() {
		System.out.println("���� ���� ���� ȭ���Դϴ�.");
		System.out.print("������ ���� ��ȣ�� �Է��ϼ��� : ");
		String num = scanner.nextLine();
		
		BookDAO dao = new BookDAO();
		ResultSet rs = dao.checkNum(num);
		
		try {
			if (!rs.next()) {
				System.out.println("�Է��Ͻ�" + num + "���� ���������� �������� �ʽ��ϴ�.\n");
			} else {
				System.out.print("���� �����Ͻðڽ��ϱ�(y/n)? : ");
				String isDelete = scanner.nextLine();
				if (isDelete.equalsIgnoreCase("y")) {
					int succ = dao.deleteBook(num);
					if (succ > 0) {
						System.out.println(num + "���� ���� ������ �����Ǿ����ϴ�.");
					} else {
						System.out.println(num + "���� ���� ���� ������ ���еǾ����ϴ�.");
					}
				} else if(isDelete.equalsIgnoreCase("n")){
					System.out.println("��ҵǾ����ϴ�.");
				} else {
					System.out.println("�߸� �Է��ϼ̽��ϴ�.");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("deleteBookInput() Exception!");
		}
	}//deleteBookInput()
	
	//���� ���� ���� ����ȭ��
	public void updateBookInput() {
		System.out.println("���� ���� ���� ȭ���Դϴ�.");
		System.out.print("������ ������ ��ȣ�� �Է��ϼ��� : ");
		String num = scanner.nextLine();
		BookDAO dao = new BookDAO();
		ResultSet rs = dao.checkNum(num);
		
		try {
			if (!(rs.next())) {
				System.out.println("�Է��Ͻ� " + num + "���� ���� ������ �������� �ʽ��ϴ�.");
			} else {
				System.out.print(num + "�� ������ ������ ������ �Է��ϼ��� : ");
				String title = scanner.nextLine();
				System.out.print(num + "�� ������ ������ ���ǻ縦 �Է��ϼ��� : ");
				String company = scanner.nextLine();
				System.out.print(num + "�� ������ ������ ���ڸ� �Է��ϼ��� : ");
				String name = scanner.nextLine();
				System.out.print(num + "�� ������ ������ �ܰ��� �Է��ϼ��� : ");
				int cost = Integer.parseInt(scanner.nextLine());
				
				BookDTO dto = new BookDTO(num, title, company, name, cost);
				int succ = dao.updateBook(dto);
				if (succ > 0) {
					System.out.println(num + "�� ������ ������ �����Ǿ����ϴ�.\n");
				} else {
					System.out.println(num + "�� ���� ���� ������ ���еǾ����ϴ�.\n");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("updateBookInput() Exception!");
		}
	}//updateBookInput()
	
	//���� �ֹ� ����ȭ��
	public void orderBookInput() {
		BookDAO dao = new BookDAO();
		System.out.println("�����ֹ� ȭ���Դϴ�.");
		System.out.print("�ֹ��Ͻ� ������ ��ȣ�� �Է��ϼ��� : ");
		String num = scanner.nextLine();
		System.out.print("�ֹ��� ������ �Է��ϼ��� : ");
		String su = scanner.nextLine();
		boolean result = dao.isNumber(su);
		if(result) {
			dao.orderBook(num, su);
		} else {
			System.out.println("���ڸ� �Է��Ͻñ� �ٶ��ϴ�.");
		}
		
	}//orderBook()

}//class
