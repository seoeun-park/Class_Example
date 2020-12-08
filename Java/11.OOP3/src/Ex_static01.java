public class Ex_static01 {
	public static void main(String[] args) {
		display1();
		//display2();	//non-static : 접근 불가능
		
		Ex_static01 ex01 = new Ex_static01();	//객체 생성
		ex01.display2();
		
	}//main()
	
	public static void display1() {
		System.out.println("Display1");
	}//display1()
	
	public void display2() {
		System.out.println("Display2");
	}//display2()
	
	static {
		System.out.println("초기화 블럭");
	}//static
	
}//class

// static : 프로그램 실행하기 전에 먼저 메모리에 할당, 프로그램 종료가 되면 소멸
//			접근은 편하지만 난발하지 않는다. 	▶  메모리 문제
//			메모리 문제가 생길 경우 Project 메뉴바 > Clean을 클릭하면 메모리 정리를 해준다.
//			main 메소드를 제외한 메소드는 되도록이면 static을 걸지 않아야 한다.
// 초기화 블럭 : static { ~~~ } ▶  가장 먼저 실행되는 블럭(코드) , main 함수보다 우선권을 가지고 있음
