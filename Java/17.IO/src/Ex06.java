import java.io.InputStream;

public class Ex06 {
	public static void main(String[] args) {
		//Ű���忡�� ������ ���� ���ڸ� �Է¹޾� ���
		//��, �Է��� ���� �߿� 'q'��� ���ڰ� ������ ����
		InputStream is = System.in;
		System.out.print("������ ���� ���ڸ� �Է��ϼ��� : ");
		
		try {
			int data;
			while ((data = is.read()) != 'q') {
				System.out.println("�Է��Ͻ� �����ڴ� " + (char)data + "�Դϴ�.");
			}
			System.out.println("����Ǿ����ϴ�.");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}//main()
}//class
