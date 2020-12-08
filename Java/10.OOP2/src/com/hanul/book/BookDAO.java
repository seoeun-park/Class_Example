package com.hanul.book;

public class BookDAO {
	// 디폴트 생성자 메소드 : 생략 가능
	public BookDAO() {}
	
	// 생성자 메소드 초기화
	private BookDTO[] book;		//멤버 변수 : 생성자 메소드와 현재 클래스 내부에서만 사용
	
	public BookDAO(BookDTO[] book) {
		this.book = book;
	}//BookDAO()

	// 가격 계산
	public void getPrice() {
		for (int i = 0; i < book.length; i++) {
			// int price = book[i].getCost() * book[i].getSu();
			// book[i].setPrice(price);
			book[i].setPrice(book[i].getCost() * book[i].getSu());
		}//for
	}//getPrice()
	
	// 출력
	public void display() {
		System.out.println("제목\t저자\t출판사\t단가\t수량\t가격");
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
