public class Book {
	// 멤버 변수 : 제목(title), 가격(price), 출판사(com), 저자(auth) ▶ DTO Class
	String title, com, auth;
	int price;
	
	// 멤버 메소드 : display() ▶ DAO Class
	public void display() {
		System.out.println("제목 : " + title);
		System.out.println("가격 : " + price);
		System.out.println("출판사 : " + com);
		System.out.println("저자 : " + auth);
		System.out.println();
	}
}
