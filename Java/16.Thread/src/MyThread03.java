public class MyThread03 extends Thread{
	@Override
	public void run() {
		//1���� 10���� ���
		for (int i = 1; i <= 10; i++) {
			//���� �������� �������� �̸��� ����ϴ� �޼ҵ� : getName()
			System.out.println(getName() + "[" + i + "]");
		}//for
	}//run()
}//class
