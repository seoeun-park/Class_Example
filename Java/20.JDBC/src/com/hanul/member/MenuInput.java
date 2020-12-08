package com.hanul.member;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Scanner;

public class MenuInput {
	private Scanner scanner;
	
	public MenuInput(Scanner scanner) {
		this.scanner = scanner;
	}

	//insertInput() : ȸ������ ��� ����ȭ��
	public void insertInput() {
		System.out.println("ȸ������ ��� ȭ�� �Դϴ�.");
		
		//DAO�� �����Ͽ� DB�� ������ �� ��ȣ�� �ߺ� �˻縦 �����ؾ� �Ѵ�.
		System.out.print("��ȣ�� �Է��ϼ��� : ");
		int num = Integer.parseInt(scanner.nextLine());
		
		MemberDAO dao = new MemberDAO();
		ResultSet rs =  dao.checkNum(num);		//�ߺ� �˻縦 �ϱ� ���� ��ȣ�˻�
		
		//������(�ϳ��� ���ڵ�)�� ������ �Ǻ��Ͽ� true/false�� ��ȯ�ϴ� �޼ҵ� : next()
		try {
			if (rs.next()) {	//�˻� ����� �ִ� �� �ߺ��� ��ȣ
				System.out.println("�Է��Ͻ�" + num + "�� �ڷ�� �̹� �����մϴ�.");
				System.out.println("�ٸ� ��ȣ�� �Է��Ͻñ� �ٶ��ϴ�.");
			} else {		//�˻� ����� ���� �� ��밡���� ��ȣ
				System.out.print("�̸��� �Է��ϼ��� : ");
				String name = scanner.nextLine();	//db�� ���� �̸��� ���ƾ� ��
				System.out.print("���̸� �Է��ϼ��� : ");
				int age = Integer.parseInt(scanner.nextLine());
				System.out.print("�ּҸ� �Է��ϼ��� : ");
				String addr = scanner.nextLine();
				System.out.print("��ȭ��ȣ�� �Է��ϼ��� : ");
				String tel = scanner.nextLine();
				
//				System.out.println("num : " + num);
//				System.out.println("name : " + name);
//				System.out.println("age : " + age);
//				System.out.println("addr : " + addr);
//				System.out.println("tel : " + tel);
				MemberDTO dto = new MemberDTO(num, name, age, addr, tel);
				
				int succ = dao.insertMember(dto);
				if (succ > 0) {		//����
					System.out.println(num + "�� ȸ������ ������ ��ϵǾ����ϴ�.");
				} else {
					System.out.println(num + "�� ȸ������ ������ ��ϵ��� �ʾҽ��ϴ�.");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}//insertInput()
	
	//��ü ȸ�� ��� �˻� ����ȭ��
	public void getAllList() {
		System.out.println("��ü ȸ�� ��� �˻� ȭ���Դϴ�.");
		MemberDAO dao = new MemberDAO();
		ArrayList<MemberDTO> list = dao.searchAllMember();
		dao.display(list);
	}//getAllList()
	
	//ȸ�� ���� ���� ����ȭ��
	public void deleteInput() {
		System.out.println("ȸ�� ���� ���� ȭ���Դϴ�.");
		System.out.print("������ ȸ����ȣ�� �Է��ϼ��� : ");
		int num = Integer.parseInt(scanner.nextLine());
		
		MemberDAO dao = new MemberDAO();
		ResultSet rs = dao.checkNum(num);
		
		try {
			if (!(rs.next())) {		//rs.next() == false(�˻� ����� ���� ��, ������ ��ȣ�� ����)
				System.out.println("�Է��Ͻ� " + num + "�� �ڷ�� �����ϴ�.");
			} else {
				System.out.print("���� �����Ͻðڽ��ϱ�(y/n)? : ");
				String isDelete = scanner.nextLine();
				if (isDelete.equalsIgnoreCase("y")) {
					int succ = dao.deleteMember(num);
					if (succ > 0) {
						System.out.println(num + "�� ȸ������ ������ �����Ǿ����ϴ�.");
					} else {
						System.out.println(num + "�� ȸ������ ������ ���� ���еǾ����ϴ�.");
					}
				} else if(isDelete.equalsIgnoreCase("n")) {
					System.out.println("��ҵǾ����ϴ�.");
				} else {
					System.out.println("�߸� �Է��ϼ̽��ϴ�.");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("deleteInput() Exception!");
		}
		
	}//deleteInput()

	//�ּ� �˻� ����ȭ��
	public void addrInput() {
		System.out.println("�ּ� �˻� ����ȭ���Դϴ�.");
		System.out.print("�˻��� �ּҸ� �Է��ϼ��� : ");
		String searchAddr = scanner.nextLine();
		MemberDAO dao = new MemberDAO();
		ArrayList<MemberDTO> list = dao.searchAddr(searchAddr);
		dao.display(list);
	}//addrInput()
	
	//�̸� �˻� ����ȭ��
	public void nameInput() {
		System.out.println("�̸��˻� ȭ���Դϴ�.");
		System.out.print("�˻��� �̸��� �Է��ϼ��� : ");
		String searchName = scanner.nextLine();
		MemberDAO dao = new MemberDAO();
		ArrayList<MemberDTO> list = dao.searchName(searchName);
		dao.display(list);		
	}//nameInput()
	
	// ȸ������ ���� ����ȭ��
	public void updateInput() {
		System.out.println("ȸ�� ���� ���� ȭ���Դϴ�.");
		System.out.print("������ ȸ���� ��ȣ�� �Է��ϼ��� : ");
		int num = Integer.parseInt(scanner.nextLine());
		MemberDAO dao = new MemberDAO();
		ResultSet rs = dao.checkNum(num);
		try {
			if (!(rs.next())) {
				System.out.println("�Է��Ͻ� " + num + "�� �ڷᰡ �����ϴ�.");
			} else {
				System.out.print(num + "�� ȸ������ ������ �̸��� �Է��ϼ��� : ");
				String name = scanner.nextLine();
				System.out.print(num + "�� ȸ������ ������ ���̸� �Է��ϼ��� : ");
				int age = Integer.parseInt(scanner.nextLine());
				System.out.print(num + "�� ȸ������ ������ �ּҸ� �Է��ϼ��� : ");
				String addr = scanner.nextLine();
				System.out.print(num + "�� ȸ������ ������ ��ȭ��ȣ�� �Է��ϼ��� : ");
				String tel = scanner.nextLine();
				
				MemberDTO dto = new MemberDTO(num, name, age, addr, tel);
				int succ = dao.updateMember(dto);
				
				if (succ > 0) {
					System.out.println(num + "�� ȸ������ ������ �����Ǿ����ϴ�.\n");
				} else {
					System.out.println(num + "�� ȸ������ ������ ���� ���еǾ����ϴ�.\n");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("updateInput() Exception!");
		}
		
	}//updateInput()
	
}//class
