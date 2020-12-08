public class PriorityMain {
	public static void main(String[] args) {
		Priority priority0 = new Priority();
		Priority priority01 = new Priority();
		Priority priority02 = new Priority();
		
		//우선순위 설정
		//priority0.setPriority(1);	//최소
		//priority01.setPriority(5);	//기본값
		//priority02.setPriority(10);	//최대
		
		priority0.setPriority(Thread.MIN_PRIORITY);
		priority01.setPriority(Thread.NORM_PRIORITY);
		priority02.setPriority(Thread.MAX_PRIORITY);
		
		priority0.start();
		priority01.start();
		priority02.start();
	}//main()
}//class
