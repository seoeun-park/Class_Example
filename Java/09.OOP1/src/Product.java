public class Product {		// Class : 특성(상태정보)과 동작(행위정보)이 기술(구현)
	// 상태 정보 : 멤버 변수(필드) 선언  ▶ DTO Class, VO Class
	int num;
	String name;
	
	// 행위 정보 : 멤버 메소드 정의  ▶ DAO Class
	public void display() {
		System.out.println("num : " + num);
		System.out.println("name : " + name);
	}//display()

}//class
