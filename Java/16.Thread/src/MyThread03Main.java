public class MyThread03Main {
	public static void main(String[] args) {
		//�ϳ��� �۾�(MyThread03.java)�� ���ÿ� ����ǰ� ����
		//Thread Class(run())�� �ϳ��� ����� (run()), ��ü�� ���� �� ���� ����(start())�ϸ� �ȴ�.
		MyThread03 thread0 = new MyThread03(); 
		MyThread03 thread01 = new MyThread03(); 
		MyThread03 thread02 = new MyThread03(); 
		
		//�������� ������ start() �޼ҵ带 ȣ��
		thread0.start();
		thread01.start();
		thread02.start();
		
		
	}//main()
}//class
