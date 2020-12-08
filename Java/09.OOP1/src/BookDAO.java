// 행위 정보(기능, 동작)를 저장하는 Class ▶ Method 집합
public class BookDAO {
	// 출력 메소드
	public void display(BookDTO[] book) {
		//System.out.println(Arrays.toString(book));	// 객체 배열 내의 BookDTO 객체가 참조하는 해쉬코드 값
		for (int i = 0; i < book.length; i++) {
			System.out.println("제목 : " + book[i].getTitle());
			System.out.println("가격 : " + book[i].getPrice());
			System.out.println("출판사 : " + book[i].getCom());
			System.out.println("저자 : " + book[i].getAuth());
			System.out.println("==============");
		}
	}//display()
}//class
