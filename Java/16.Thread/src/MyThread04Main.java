public class MyThread04Main {
	public static void main(String[] args) {
		// ��ü ����
		MyThread04 run01 = new MyThread04();
		MyThread05 run02 = new MyThread05();
		
		//Runnable Interface�� ��� �޾� ������ ������� ��¥ �����尡 �ƴϴ�.
		//�������̽� Ÿ���� Ŭ���� Ÿ������ �ٲپ�� ��¥ ������� ������ �����ϴ�.
		//�׷��Ƿ� Thread ��ü�� �����ϰ�, Runnable�� �Ű������� �����Ѵ�.(Thread(Runnable arg0))
		Thread thread01 = new Thread(run01);	//run01 �� thread01
		Thread thread02 = new Thread(run02);
		//Thread thread = new Thread(new MyThread04());
		
		//Thread�� ���� : start() �޼ҵ� ȣ��
		//run01.start();	
		// �� ���� : �������̽��� ��ӹ��� ������� ��¥ �����尡 �ƴϱ� ������ 
		thread01.start();
		thread02.start();
	}//main()
}//class
