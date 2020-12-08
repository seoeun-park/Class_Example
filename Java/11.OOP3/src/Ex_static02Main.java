public class Ex_static02Main {
	public static void main(String[] args) {
		// 다른 클래스의 메소드를 호출하고 싶을 때, 
		// 같은 클래스에 있지만 static이 걸려있지 않은 메소드를 호출하고 싶을 때 객체를 생성해야 한다.
		// 다만, 클래스의 기본 생성자 메소드의 접근 제어자가 private일 경우, 객체를 생성할 수 없다.
		//Ex_static02 ex02 = new Ex_static02();
		
		// 하지만 다른 클래스의 메소드 중 static이 걸려있는 메소드는 굳이 객체를 생성하지 않아도 접근할 수 있다.
		// 클래스명.static 메소드명();
		// 이러한 방식으로 접근한다면 기본 생성자 메소드의 접근 제어자가 private이라도 접근할 수 있다.
		//ex02.display1();
		Ex_static02.display1();
		//ex02.display2();
		
	}//main()
}//class
