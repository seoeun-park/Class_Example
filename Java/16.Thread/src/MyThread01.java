// 동시 작업 : 스레드(Thread) 구현  ▶  Thread 클래스를 상속받아 구현
public class MyThread01 extends Thread{
	// 1부터 30까지 출력하는 코드 : run() 메소드에서 재정의(Override)해야 함
	@Override
	public void run() {
		for (int i = 1; i <= 30; i++) {
			System.out.print(i + ", ");
		}//for
		System.out.println();
	}//run()
}//class

//.java 안에 여러 개의 클래스를 선언할 수 있는데 파일명과 같은 이름을 가진 클래스에만 접근제어자를 붙인다.
class MyThread02 extends Thread{
	// a부터 z까지 출력하는 코드 : run() 메소드에서 재정의(Override)해야 함
	@Override
	public void run() {
		for (char i = 'a'; i <= 'z'; i++) {
			System.out.print(i + ", ");
		}//for
	System.out.println();
	}//run()
}//class
