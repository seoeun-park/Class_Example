import java.io.IOException;
import java.io.InputStream;

public class Ex01 {
	public static void main(String[] args) {
		//Ű����(ǥ���Է�)���� ������ 1���ڸ� �Է¹޾� ���
		InputStream is = System.in;		//��� ��Ʈ�� : ���� ���� ����Ǵ� ��Ʈ��
		System.out.print("������ 1���ڸ� �Է��ϼ��� : ");	//������(Blocked State)
		
		try {
			int data = is.read();		//Ȯ�� ����
			System.out.println("�Է��Ͻ� �����ڴ� " + data + "�Դϴ�.");
			//Casting���� ������ ASCII �ڵ� 65�� ��µ�.
			System.out.println("�Է��Ͻ� �����ڴ� " + (char)data + "�Դϴ�.");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}//main()
}//class
