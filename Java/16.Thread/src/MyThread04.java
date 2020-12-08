// JAVA는 다중 상속이 불가능
// 이미 다른 클래스를 상속받은 상태에서 Thread class를 상속받아 구현할 수 없다.
// 이러한 문제점을 해결하기 위해서 Runnable Interface 제공
public class MyThread04 implements Runnable{
	// interface로 구현했기 때문에 상속받은 클래스의 메소드를 무조건 오버라이드해야한다.
	@Override
	public void run() {
		for (int i = 1; i <= 30; i++) {
			System.out.print(i + ", ");
		}//for
		System.out.println();		
	}//run()
	
}//class

class MyThread05 implements Runnable {
	@Override
	public void run() {
		for (char i = 'a'; i <= 'z'; i++) {
			System.out.print(i + ", ");
		}//for
	System.out.println();		
	}//run()
}//class
