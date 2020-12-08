package com.hanul.book;

public class BookDAO {
	// ����Ʈ ������ �޼ҵ� : ���� ����
	public BookDAO() {}
	
	// ������ �޼ҵ� �ʱ�ȭ
	private BookDTO[] book;		//��� ���� : ������ �޼ҵ�� ���� Ŭ���� ���ο����� ���
	
	public BookDAO(BookDTO[] book) {
		this.book = book;
	}//BookDAO()

	// ���� ���
	public void getPrice() {
		for (int i = 0; i < book.length; i++) {
			// int price = book[i].getCost() * book[i].getSu();
			// book[i].setPrice(price);
			book[i].setPrice(book[i].getCost() * book[i].getSu());
		}//for
	}//getPrice()
	
	// ���
	public void display() {
		System.out.println("����\t����\t���ǻ�\t�ܰ�\t����\t����");
		System.out.println("==============================================");
		for (int i = 0; i < book.length; i++) {
			System.out.print(book[i].getTitle() + "\t");
			System.out.print(book[i].getName() + "\t");
			System.out.print(book[i].getComp() + "\t");
			System.out.print(book[i].getCost() + "\t");
			System.out.print(book[i].getSu() + "\t");
			System.out.println(book[i].getPrice() + "\t");
		}//for
	}//display()
	
}//class
