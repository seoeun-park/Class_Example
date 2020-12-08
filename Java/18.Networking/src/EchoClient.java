import java.io.BufferedWriter;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.Scanner;

//EchoClient : ������ ��û(Request, ����)
//TCP : �����˻� ����, �ӵ��� �������� �ŷڼ��� ����.
public class EchoClient {
	public static void main(String[] args) {
		//������ ������ �õ��Ͽ� ������ �����ϸ� Socket ����
		//Socket : IP Address + Port Number
		Socket socket = null;
		try {
			socket = new Socket("192.168.0.178", 9999); 	//���� IP�ּ�, Port ��ȣ
			
			//Ŭ���̾�Ʈ���� �۽�(���)�ϱ� ���� �غ� �ܰ�
			OutputStream os = socket.getOutputStream();		//��� ��Ʈ�� : ���� ���� ����Ǵ� ��Ʈ��
			
			//OutputStreamWriter osw = new OutputStreamWriter(os);	//�ѱ�
			//BufferedWriter bw = new BufferedWriter(osw);	//�ӵ� ���
			
			PrintWriter pw = new PrintWriter(os);	//OutputStreamWriter + BufferedWriter
			
			//Ű���忡�� �޼����� �Է�(Scanner)�޾� ������ ������(�۽�)
			Scanner scanner = new Scanner(System.in);
			System.out.print("������ ���� �޼����� �Է��ϼ��� : ");
			String msg = scanner.nextLine();
			scanner.close();
			
			pw.println(msg);
			pw.flush();		//��������
			pw.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				socket.close();
			} catch (Exception e) {
				e.printStackTrace();
			}//try-catch
		}//try-catch-finally
	}//main()
}//class
