public class BookMain02 {
	public static void main(String[] args) {
		// 도서 정보(BookDTO_java)를 저장할 객체 배열(book[])
		BookDTO[] book;			// 객체 배열 선언
		
		// 3번의 도서 정보가 저장될 객체 배열(book[])을 생성
		book = new BookDTO[3];
		// BookDTO[] book1 = new BookDTO[3];	// 객체 배열을 선언 및 생성
		
		// 1) BookDTO.java에 초기화된 생성자 메소드를 이용하여 도서정보의 내용(값)을 입력
		book[0] = new BookDTO("JAVA", 24000, "한빛미디어", "신용권");
		book[1] = new BookDTO("View", 28000, "삼양미디어", "김은옥");
		
		// 2) 기본(default) 생성자 메소드를 이용하여 값을 입력
		BookDTO dto = new BookDTO();
		dto.setTitle("DB");
		dto.setPrice(5000);
		dto.setCom("한울");
		dto.setAuth("한울");
		book[2] = dto;
		
		// 도서정보(book[])의 내용을 출력 : BookDAO.java → display() 메소드 호출
		BookDAO dao = new BookDAO();		// 기본 생성자 메소드 : 따로 만들지 않아도 자동으로 생성
		dao.display(book);
		
	}//main()
}//class
