public class MyThread01Main {
	public static void main(String[] args) {
		//��ü ������ ���� ����
		MyThread01 thread01 = new MyThread01();
		MyThread02 thread02 = new MyThread02();
		
		//thread01, thread02�� run() �޼ҵ带 ȣ��
		//thread01.run();		//1 ~ 30 ���
		//thread02.run();		//a ~ z ���
		// ���ÿ� ����ϴ� ���� �ƴ϶� �ϳ��� �޼ҵ带 ���� ����, �� ���� �޼ҵ带 ����
		
		//thread01, thread02�� run() �޼ҵ尡 ���ÿ� ����� �� �ֵ��� ȣ��  ��  start() �޼ҵ� ȣ��
		thread01.start();
		thread02.start();
		
		
	}//main()
}//class
