public class BookMain01 {
	public static void main(String[] args) {
		// JAVA, 24000, 한빛미디어, 신용권
		// View, 28000, 삼양미디어, 김은옥
		// DB, 5000, 한울, 홍길동
		Book b1 = new Book();	// b1 : 인스턴스(instance) 변수, 레퍼런스(reference) 변수
		b1.title = "JAVA";
		b1.price = 24000;
		b1.com = "한빛미디어";
		b1.auth = "신용권";
		b1.display();
		
		Book b2 = new Book();
		b2.title = "View";
		b2.price = 28000;
		b2.com = "삼양미디어";
		b2.auth = "김은옥";
		b2.display();
		
		Book b3 = new Book();
		b3.title = "DB";
		b3.price = 5000;
		b3.com = "한울";
		b3.auth = "홍길동";
		b3.display();

	}//main()
}//class
