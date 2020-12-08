import java.util.Scanner;

import com.hanul.book.BookDAO;
import com.hanul.book.BookInput;

import oracle.jdbc.driver.DBConversion;

public class BookMain {
	public static void menuPrint() {
		System.out.println("====도서관리====");
		System.out.println("도서정보등록 : I");
		System.out.println("도서목록보기 : A");
		System.out.println("도서제목검색 : S");
		System.out.println("도서정보삭제 : D");
		System.out.println("도서정보수정 : U");
		System.out.println("도서주문하기 : O");
		System.out.println("도서관리종료 : E");
		System.out.println("================\n");
	}//menuPrint()
	
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		BookInput input = new BookInput(scanner);
		
		while (true) {
			menuPrint();
			System.out.print("메뉴를 입력하세요  ▶ ");
			String menu = scanner.nextLine();
			
			if (menu.equalsIgnoreCase("i")) {			//도서정보등록
				input.insertBookInput();
				continue;
			} else if(menu.equalsIgnoreCase("a")) {		//전체목록검색
				input.selectBookAllInput();
				continue;
			} else if(menu.equalsIgnoreCase("s")) {		//도서제목검색
				input.selectBookTitleInput();
				continue;
			} else if(menu.equalsIgnoreCase("d")) {		//도서정보삭제
				input.deleteBookInput();
				continue;
			} else if(menu.equalsIgnoreCase("u")) {		//도서정보수정
				input.updateBookInput();
				continue;
			} else if(menu.equalsIgnoreCase("o")) {		//도서주문하기
				input.orderBookInput();
				continue;
			} else if(menu.equalsIgnoreCase("e")) {		//도서정보종료
				System.out.print("정말 종료하시겠습니까(y/n)? ▶ ");
				String exit = scanner.nextLine();
				if (exit.equalsIgnoreCase("y")) {
					System.out.println("도서관리 프로그램을 종료합니다.");
					BookDAO dao = new BookDAO();
					dao.dbClose();
					System.exit(0);		//관련된 다른 클래스를 메모리에서 함께 종료
					break;
				} else if (exit.equalsIgnoreCase("n")) {
					System.out.println("취소하셨습니다.");
					continue;
				} else {
					System.out.println("잘못 입력하셨습니다!");
					continue;
				}
			} else {
				System.out.println("메뉴를 잘못 입력하셨습니다.");
				continue;
			}
		}//while
		scanner.close();
	}//main()
}//class
