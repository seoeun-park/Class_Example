import com.hanul.book.BookDAO;
import com.hanul.book.BookDTO;	// 패키지가 다를 때

public class BookMain {
	public static void main(String[] args) {
		// 책 3권의 정보를 저장할 객체배열(book[])을 선언 및 생성하고 초기화
		BookDTO[] book = new BookDTO[3];
		
		book[0] = new BookDTO("JAVA", "신용권", "한빛", 24000, 21);
		book[1] = new BookDTO("View", "김은옥", "삼양", 20000, 23);
		book[2] = new BookDTO("DB", "홍길동", "한울", 5000, 25);
		
		// 가격계산(getPrice()), 출력(display()) 메소드 호출 ▶ BookDAO.java
		// BookDAO 객체 생성 시 객체배열(book[])을 매개변수로 전달하자.
		BookDAO dao = new BookDAO(book);
		dao.getPrice();
		dao.display();
				
	}//main()
}//class
