// ���� �۾� : ������(Thread) ����  ��  Thread Ŭ������ ��ӹ޾� ����
public class MyThread01 extends Thread{
	// 1���� 30���� ����ϴ� �ڵ� : run() �޼ҵ忡�� ������(Override)�ؾ� ��
	@Override
	public void run() {
		for (int i = 1; i <= 30; i++) {
			System.out.print(i + ", ");
		}//for
		System.out.println();
	}//run()
}//class

//.java �ȿ� ���� ���� Ŭ������ ������ �� �ִµ� ���ϸ�� ���� �̸��� ���� Ŭ�������� ���������ڸ� ���δ�.
class MyThread02 extends Thread{
	// a���� z���� ����ϴ� �ڵ� : run() �޼ҵ忡�� ������(Override)�ؾ� ��
	@Override
	public void run() {
		for (char i = 'a'; i <= 'z'; i++) {
			System.out.print(i + ", ");
		}//for
	System.out.println();
	}//run()
}//class
