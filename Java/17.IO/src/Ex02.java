import java.io.InputStream;

public class Ex02 {
	public static void main(String[] args) {
		//Ű���忡�� ������ 1���ڸ� �Է¹޾� ���
		InputStream is = System.in;
		// new Ű����� �����ڸ� ������ �ʾƵ� System Ŭ������ ���� ����
		// java.lang ��Ű�� �ȿ� �ִ� Ŭ�����̹Ƿ�
		System.out.print("������ 1���ڸ� �Է��ϼ��� : ");
		
		try {
			int data = is.read();
			System.out.println((char)data);		//��� �� : �Է��� ������
			
			data = is.read();					//�Է��� EnterŰ : CR
			System.out.println(data);			//13 : ASCII �ڵ� ��
			System.out.println((char)data);		//�� �� : ȭ�鿡�� �ƹ� �͵� ǥ�õ��� �ʴ´�.
												//�� �� : println���� ln ���
			
			data = is.read();					//�Է��� EnterŰ : LF					
			System.out.println(data);			//10 : ASCII �ڵ� ��
			System.out.println((char)data);		//�� �� : ȭ�鿡�� �ƹ� �͵� ǥ�õ��� �ʴ´�.
												//�� �� : println���� ln ���
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}//main()
}//class

/*

- ����ڰ� ���ڸ� �Է� �� Enter �Է�
- Enter�� �Է��ϴ� ���� ���α׷��� ����(Terminate, Ctrl + C, Break Ű)�� �ƴϴ�.
- CR(Carriage Return): Ŀ���� ���� �� ������ �̵�
- LF(Line Feed) : Ŀ���� �� �� �Ʒ��� �̵�


 */
