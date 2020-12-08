public class MyThread01Main {
	public static void main(String[] args) {
		//객체 생성을 통해 접근
		MyThread01 thread01 = new MyThread01();
		MyThread02 thread02 = new MyThread02();
		
		//thread01, thread02의 run() 메소드를 호출
		//thread01.run();		//1 ~ 30 출력
		//thread02.run();		//a ~ z 출력
		// 동시에 출력하는 것이 아니라 하나의 메소드를 끝낸 다음, 그 다음 메소드를 실행
		
		//thread01, thread02의 run() 메소드가 동시에 실행될 수 있도록 호출  ▶  start() 메소드 호출
		thread01.start();
		thread02.start();
		
		
	}//main()
}//class
