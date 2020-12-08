public class MyThread03 extends Thread{
	@Override
	public void run() {
		//1부터 10까지 출력
		for (int i = 1; i <= 10; i++) {
			//현재 실행중인 스레드의 이름을 출력하는 메소드 : getName()
			System.out.println(getName() + "[" + i + "]");
		}//for
	}//run()
}//class
