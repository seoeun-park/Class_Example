import java.io.InputStream;
import java.io.InputStreamReader;

public class Ex04 {
	public static void main(String[] args) {
		//Ű���忡�� �ѱ� 1���ڸ� �Է¹޾� ���
		InputStream is = System.in;		
		// �� ����Ʈ ��Ʈ��(1 byte �����͸� �����ϴ� ��Ʈ��) : ASCII �ڵ�, �̹���, ����, ����
		
		InputStreamReader isr = new InputStreamReader(is);		
		// �� ���� ��Ʈ��(2 byte �����͸� �����ϴ� ��Ʈ��) : UniCode, �ؽ�Ʈ
		//InputStreamReader isr = new InputStreamReader(System.in);
		
		// �ѱۻӸ� �ƴ϶� ������ ��°��� : UniCode�� ASCII �ڵ带 Ȯ���� �����̱� ������
		System.out.print("�ѱ� 1���ڸ� �Է��ϼ��� : ");
		try {
			int data = isr.read();
			System.out.println("�Է��Ͻ� ���ڴ� " + data + "�Դϴ�.");		//UniCode
			System.out.println("�Է��Ͻ� ���ڴ� " + (char)data + "�Դϴ�.");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}//main()
}//class
