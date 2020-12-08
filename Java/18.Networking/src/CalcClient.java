import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.Scanner;

public class CalcClient {
	public static void main(String[] args) {
		Socket socket = null;
		try {
			//Socket ���� : ������ IP �ּҿ� Port ��ȣ
			socket = new Socket("192.168.0.170", 9999);
			
			//�ϳ��� ������ ���� Ŭ���̾�Ʈ�� ���ÿ� �����Ϸ��� Thread�� �����ؾ� �Ѵ�.
			//num1, num2, opcode�� �Է¹޴´� : Scanner
			Scanner scanner = new Scanner(System.in);
			System.err.print("ù ��° ������ �Է��ϼ��� : ");
			int num1 = Integer.parseInt(scanner.nextLine());
			System.err.print("�� ��° ������ �Է��ϼ��� : ");
			int num2 = Integer.parseInt(scanner.nextLine());
			System.out.print("�����ڸ� �Է��ϼ��� : ");
			String opCode = scanner.nextLine();
			scanner.close();
			
			//CalcDTO ��ü�� �����ϰ�, ������ �۽�(���)
			//OutputStream > OutputStreamWriter > BufferedWriter
			//				 PrintWriter ��  ObjectPrintWriter : ��ü�� ���(�۽�)
			CalcDTO dto = new CalcDTO(num1, num2, opCode);
			OutputStream os = socket.getOutputStream();
			ObjectOutputStream oos = new ObjectOutputStream(os);
			oos.writeObject(dto);
			
			//�������� ���޵� ����� ����(�Է�)�޾� ȭ�鿡 ���
			InputStream is = socket.getInputStream();
			InputStreamReader isr = new InputStreamReader(is);
			BufferedReader br = new BufferedReader(isr);
			int result = Integer.parseInt(br.readLine());
			System.out.println("ù ��° ���� : " + num1);
			System.out.println("�� ��° ���� : " + num2);
			System.out.println("������ : " + opCode);
			System.out.println("��� : " + result);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				socket.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
