import java.io.InputStream;

public class Ex03 {
	public static void main(String[] args) {
		//Ű���忡�� ������ ���� ���ڸ� �Է¹޾� ����Ͻÿ�
		InputStream is = System.in;
		System.out.print("������ ���� ���ڸ� �Է��ϼ��� : ");
		/*
		while(true) {		//�Է¹��� ���ڰ� �� �������� �� �� ����.
			try {
				int data = is.read();
				System.out.println("�Է��Ͻ� �����ڴ� " + (char)data + "�Դϴ�.");
				
				if (data == -1) {		//Ctrl + C(-1) �Է� �� break ����� ���� ����
					System.out.println("����Ǿ����ϴ�.");
					break;
					// Ctrl + C�� ������ �� �Է��Ͻ� "�����ڴ� ?�Դϴ�" "����Ǿ����ϴ�"
					// ��� ����Ѵ��� ����ȴ�.
				}//if
			} catch (Exception e) {
				e.printStackTrace();
			}//try-catch
			
			// �Դϴ�. �����ڴ� 	�� CR
			// �Է��Ͻ� �����ڴ�
			// �Դϴ� 			�� LF
			
		}//while
		*/
		
		try {
			int data;
			while((data = is.read()) != -1) {
				System.out.println("�Է��Ͻ� �����ڴ� " + (char)data + "�Դϴ�.");
			}
			System.out.println("����Ǿ����ϴ�.");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}//main()
}//class
