public class Sleep extends Thread{
	// 디폴트 생성자의 매개변수를 클래스 전체에서 활용하기 위해서 멤버변수 선언
	private int num;
	// 디폴트 생성자
	public Sleep(int num) {
		this.num = num;
	}
	
	@Override
	public void run() {
		for (int i = 1; i <= 10 ; i++) {
			System.out.print(num + ", ");
			try {
				sleep(1000);		//1000ms : 1초
				// 모든 스레드를 1초동안 일시 중지시킴
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			
		}//for
	}//run()
	
}//class
