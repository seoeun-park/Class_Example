import java.io.InputStreamReader;

public class Ex05 {
	public static void main(String[] args) {
		//Ű���忡�� �ѱ� ���� ���ڸ� �Է¹޾� ���
		InputStreamReader isr = new InputStreamReader(System.in);
		System.out.print("�ѱ� ���� ���ڸ� �Է��ϼ��� : ");
		
		try {
			int data;
			while((data = isr.read()) != -1) {
				System.out.println("�Է��Ͻ� ���ڴ� " + (char)data + "�Դϴ�.");
			}//while
			System.out.println("����Ǿ����ϴ�.");
			
		} catch (Exception e) {
			e.printStackTrace();
		}//try-catch
		
		
	}//main()
}//class
