public class MyThread04Main {
	public static void main(String[] args) {
		// 객체 생성
		MyThread04 run01 = new MyThread04();
		MyThread05 run02 = new MyThread05();
		
		//Runnable Interface를 상속 받아 구현한 스레드는 진짜 스레드가 아니다.
		//인터페이스 타입을 클래스 타입으로 바꾸어야 진짜 스레드로 구현이 가능하다.
		//그러므로 Thread 객체를 생성하고, Runnable을 매개변수로 전달한다.(Thread(Runnable arg0))
		Thread thread01 = new Thread(run01);	//run01 → thread01
		Thread thread02 = new Thread(run02);
		//Thread thread = new Thread(new MyThread04());
		
		//Thread의 실행 : start() 메소드 호출
		//run01.start();	
		// → 오류 : 인터페이스를 상속받은 스레드는 진짜 스레드가 아니기 때문에 
		thread01.start();
		thread02.start();
	}//main()
}//class
