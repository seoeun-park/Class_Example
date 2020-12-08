import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.nio.Buffer;

public class Ex08 {
	public static void main(String[] args) {
		//Ű���忡�� ���ڿ��� ���� �� �Է¹޾� ���
		//���۸� Ȱ�� : InputStream �� InputStreamReader �� BufferedReader
		//��, 'bye'��� ���ڿ��� �ԷµǸ� ����
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		while (true) {
			System.out.print("���ڿ��� �Է��ϼ��� : ");
			try {
				String msg = br.readLine();
				System.out.println("�Է��Ͻ� ���ڿ��� " + msg + "�Դϴ�.");
				//if (msg == "bye") {			//���ڿ��� �� �����ڸ� ����� �� ����.
				
				/*
				if (msg.compareTo("bye") == 0) {	
					System.out.println("����Ǿ����ϴ�.");
					break;
				}
				*/
				
				/*
				if(msg.equals("bye")) {		//equals() : ������ true, �ٸ��� false ��ȯ
					System.out.println("����Ǿ����ϴ�.");
					break;
				}
				*/
				
				if(msg.equalsIgnoreCase("bye")) {	//��ҹ��� ���� ���� ���� ���� �� 
					System.out.println("����Ǿ����ϴ�.");
					break;
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}//try-catch
		}//while
		
	}//main()
}//class
