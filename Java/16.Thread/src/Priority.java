// ������� �켱����(Priority)�� ������ �� �ִ�.
// 1(�ּ�, MIN_PRIORITY)���� 10(�ִ�, MAX_PRIORITY)���� ���� ����
// ���ڰ� �������� �켱������ ����.
// �⺻��(NORM_PRIORITY)�� 5�� ����
// getPriority() �޼ҵ�� �켱������ Ȯ�� : ��¹� �ۼ��� ��
// setPriority() �޼ҵ�� �켱������ ���� : ���๮ �ۼ��� ��
// �� ���⼭ ���ϴ� �켱������ �켱������ �����ؼ� �ش� �����尡 ���� ����ǰų�, ���� ����ȴٴ� �ǹ̰� �ƴϴ�.
//	 �켱������ ���ٶ�� ������ �����尡 ���� �� ���������� ���� �����Ѵٴ� �ǹ̷� �ؼ��ؾ� �Ѵ�.
public class Priority extends Thread{
	@Override
	public void run() {
		for(int i = 1; i <= 10; i++) {
			System.out.println(getName() + "�켱���� : " + getPriority() + ", Hello" + i);
		}//for
	}//run()
}//class
