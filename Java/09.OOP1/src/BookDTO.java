// 상태정보(멤버변수, 필드)를 저장하는 Class
// 서로 다른 타입의 데이터를 하나로 묶기 위해 설계
public class BookDTO {
	// ① 멤버변수(필드)를 선언 ▶ 정보 은닉(캡슐화) : private
	private String title;	// 제목
	private int price;		// 가격
	private String com;		// 출판사	
	private String auth;	// 저자
	
	//------------------------------------------------------
	// ② 기본 생성자 메소드(Default Constructor Method) : 객체를 생성할 때 호출
	// 기본 규칙 : 클래스의 이름과 메소드의 이름이 동일해야한다, 리턴타입이 존재하지 않는다.
	// 			전달되는 매개변수와 구현부(body{})가 없다 : 빈 깡통 ▶ 생략가능 : JVM 자동생성
	public BookDTO() {}
	
	//------------------------------------------------------
	// ③ 선언된 멤버변수로 값을 할당하기 위해 , 전달되는 매개변수를 초기화하는 생성자 메소드 정의
	// 생성하는 방법 : 
	// 		Eclipse 상단 메뉴바에 Source 탭 → Generate Constructor using field... 
	// 		마우스 오른쪽 버튼 → Source 버튼 → Generate Constructor using field...
	public BookDTO(String title, int price, String com, String auth) {
		// 자바는 모든 클래스를 super 클래스로부터 상속받게 되어있다.
		super();			// 부모(상위) 클래스 : JAVA의 모든 클래스는 Object Class 무조건 상속
		
		this.title = title;		// 매개변수와 멤버변수를 구분하기 위해 멤버변수 앞에 this 키워드를 달아준다.
		this.price = price;
		this.com = com;
		this.auth = auth;
	}
	
	//------------------------------------------------------
	// ④ 입력(setter), 출력(getter) 메소드 정의 : 멤버변수에 접근
	// 생성하는 방법 : 
	// 		마우스 오른쪽 버튼 → Source 버튼 → Generate getters and setters...
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getCom() {
		return com;
	}

	public void setCom(String com) {
		this.com = com;
	}

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}
	
	// ※ DTO VS VO
	//	- VO는 매개변수의 값을 변경할 수도 전달할수도 없기 때문에 getter 메소드만 있고 setter 메소드는 존재하지 않음
	//	- 즉, 멤버 변수를 초기화하는 생성자 메소드도 필요하지 않다.
	
}//class
