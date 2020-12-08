package com.hanul.book;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Scanner;

public class BookInput {
	private Scanner scanner;
	
	public BookInput(Scanner scanner) {
		this.scanner = scanner;
	}

	//도서 정보 등록 서브화면
	public void insertBookInput() {
		System.out.println("\n도서등록 화면입니다.");
		System.out.print("등록할 도서의 번호를 입력하세요 : ");
		String num = scanner.nextLine();
		
		BookDAO dao = new BookDAO();
		ResultSet rs = dao.checkNum(num);
		
		try {
			if (rs.next()) {
				System.out.println("입력하신 " + num + "번 도서는 이미 존재합니다.");
				System.out.println("다시 입력하시기 바랍니다!");
			} else {
				if(dao.isNum(num)) {
					System.out.print("등록할 도서의 제목을 입력하세요 : ");
					String title = scanner.nextLine();
					System.out.print("등록할 도서의 출판사 입력하세요 : ");
					String company = scanner.nextLine();
					System.out.print("등록할 도서의 저자를 입력하세요 : ");
					String name = scanner.nextLine();
					System.out.print("등록할 도서의 단가를 입력하세요 : ");
					int cost = Integer.parseInt(scanner.nextLine());
					
					BookDTO dto = new BookDTO(num, title, company, name, cost);
					
					int succ = dao.insertBook(dto);
					if (succ > 0) {
						System.out.println("도서정보가 등록되었습니다.");
					} else {
						System.out.println("도서정보 등록이 실패되었습니다.");
					}
				} else {
					System.out.println("입력하신 도서 번호의 형식이 바르지 않습니다.");
					System.out.println("예시) xxx-xx-xxxx-xxx-x \n");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insertBookInput() Exception!");
		}
	}//insertBookInput()
	
	//도서 전체 목록 검색 서브화면
	public void selectBookAllInput() {
		System.out.println("\n도서 목록 보기 화면입니다.");
		BookDAO dao = new BookDAO();
		ArrayList<BookDTO> list = dao.selectBookAll();
		dao.display(list);
		
	}//selectBookAllInput()
	
	//도서 제목 검색 서브화면
	public void selectBookTitleInput() {
		System.out.println("도서 제목 검색 화면입니다.");
		System.out.print("검색할 도서의 제목을 입력하세요 : ");
		String searchTitle = scanner.nextLine();
		BookDAO dao = new BookDAO();
		ArrayList<BookDTO> list = dao.selectBookTitle(searchTitle);
		dao.display(list);
	}//selectBookTitleInput()
	
	//도서 정보 삭제 서브화면
	public void deleteBookInput() {
		System.out.println("도서 정보 삭제 화면입니다.");
		System.out.print("삭제할 도서 번호를 입력하세요 : ");
		String num = scanner.nextLine();
		
		BookDAO dao = new BookDAO();
		ResultSet rs = dao.checkNum(num);
		
		try {
			if (!rs.next()) {
				System.out.println("입력하신" + num + "번의 도서정보는 존재하지 않습니다.\n");
			} else {
				System.out.print("정말 삭제하시겠습니까(y/n)? : ");
				String isDelete = scanner.nextLine();
				if (isDelete.equalsIgnoreCase("y")) {
					int succ = dao.deleteBook(num);
					if (succ > 0) {
						System.out.println(num + "번의 도서 정보가 삭제되었습니다.");
					} else {
						System.out.println(num + "번의 도서 정보 삭제가 실패되었습니다.");
					}
				} else if(isDelete.equalsIgnoreCase("n")){
					System.out.println("취소되었습니다.");
				} else {
					System.out.println("잘못 입력하셨습니다.");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("deleteBookInput() Exception!");
		}
	}//deleteBookInput()
	
	//도서 정보 수정 서브화면
	public void updateBookInput() {
		System.out.println("도서 정보 수정 화면입니다.");
		System.out.print("수정할 도서의 번호를 입력하세요 : ");
		String num = scanner.nextLine();
		BookDAO dao = new BookDAO();
		ResultSet rs = dao.checkNum(num);
		
		try {
			if (!(rs.next())) {
				System.out.println("입력하신 " + num + "번의 도서 정보가 존재하지 않습니다.");
			} else {
				System.out.print(num + "번 도서의 수정할 제목을 입력하세요 : ");
				String title = scanner.nextLine();
				System.out.print(num + "번 도서의 수정할 출판사를 입력하세요 : ");
				String company = scanner.nextLine();
				System.out.print(num + "번 도서의 수정할 저자를 입력하세요 : ");
				String name = scanner.nextLine();
				System.out.print(num + "번 도서의 수정할 단가를 입력하세요 : ");
				int cost = Integer.parseInt(scanner.nextLine());
				
				BookDTO dto = new BookDTO(num, title, company, name, cost);
				int succ = dao.updateBook(dto);
				if (succ > 0) {
					System.out.println(num + "번 도서의 정보가 수정되었습니다.\n");
				} else {
					System.out.println(num + "번 도서 정보 수정이 실패되었습니다.\n");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("updateBookInput() Exception!");
		}
	}//updateBookInput()
	
	//도서 주문 서브화면
	public void orderBookInput() {
		BookDAO dao = new BookDAO();
		System.out.println("도서주문 화면입니다.");
		System.out.print("주문하실 도서의 번호를 입력하세요 : ");
		String num = scanner.nextLine();
		System.out.print("주문할 수량을 입력하세요 : ");
		String su = scanner.nextLine();
		boolean result = dao.isNumber(su);
		if(result) {
			dao.orderBook(num, su);
		} else {
			System.out.println("숫자를 입력하시길 바랍니다.");
		}
		
	}//orderBook()

}//class
