// JAVA�� ���� ����� �Ұ���
// �̹� �ٸ� Ŭ������ ��ӹ��� ���¿��� Thread class�� ��ӹ޾� ������ �� ����.
// �̷��� �������� �ذ��ϱ� ���ؼ� Runnable Interface ����
public class MyThread04 implements Runnable{
	// interface�� �����߱� ������ ��ӹ��� Ŭ������ �޼ҵ带 ������ �������̵��ؾ��Ѵ�.
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
