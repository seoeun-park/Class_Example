public class MyThread03Main {
	public static void main(String[] args) {
		//하나의 작업(MyThread03.java)이 동시에 실행되게 하자
		//Thread Class(run())는 하나만 만들고 (run()), 객체를 여러 개 만들어서 실행(start())하면 된다.
		MyThread03 thread0 = new MyThread03(); 
		MyThread03 thread01 = new MyThread03(); 
		MyThread03 thread02 = new MyThread03(); 
		
		//스레드의 실행은 start() 메소드를 호출
		thread0.start();
		thread01.start();
		thread02.start();
		
		
	}//main()
}//class
