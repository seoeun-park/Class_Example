public class PriorityMain {
	public static void main(String[] args) {
		Priority priority0 = new Priority();
		Priority priority01 = new Priority();
		Priority priority02 = new Priority();
		
		//�켱���� ����
		//priority0.setPriority(1);	//�ּ�
		//priority01.setPriority(5);	//�⺻��
		//priority02.setPriority(10);	//�ִ�
		
		priority0.setPriority(Thread.MIN_PRIORITY);
		priority01.setPriority(Thread.NORM_PRIORITY);
		priority02.setPriority(Thread.MAX_PRIORITY);
		
		priority0.start();
		priority01.start();
		priority02.start();
	}//main()
}//class
