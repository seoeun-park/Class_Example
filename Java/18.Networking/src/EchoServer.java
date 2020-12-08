import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.ServerSocket;
import java.net.Socket;

//EchoServer : ������ ����(Response, ����)
public class EchoServer {
	public static void main(String[] args) {
		//������������ ������ 2���� ������ �� : Server Socket, Socket
		ServerSocket ss = null;
		Socket socket = null;
		try {
			//Server Socket ���� : Port ��ȣ �Ҵ�
			ss = new ServerSocket(9999);
			System.out.println("������ �������Դϴ�.");
			
			//Socket ���� : Ŭ���̾�Ʈ�� ���� ������ ����ִ� Socket
			socket = ss.accept();		//�������� Socket�� �����ϴ� ���
			//socket = new Socket();		//Ŭ���̾�Ʈ���� Socket�� �����ϴ� ���
			
			//Ŭ���̾�Ʈ�� ���� �޼����� ����(�Է�)�ޱ� ���� �غ� �ܰ�
			InputStream is = socket.getInputStream();
			InputStreamReader isr = new InputStreamReader(is);
			BufferedReader br = new BufferedReader(isr);
			// PrintReader�� JAVA���� ���������� X
			
			//Ŭ���̾�Ʈ�� ���� �޼����� ���Ź޾� ȭ�鿡 �������
			String msg = br.readLine();
			System.out.println("Ŭ���̾�Ʈ�κ��� ���� �޼��� : " + msg);
			
			br.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//���ܰ� �߻��ϵ�, ���ܰ� �߻����� �ʵ� �ݴ� �� ������ ������Ѿ� �ϱ� ������ finally �������� �ۼ�
			try {
				socket.close();
				ss.close();
				// �ݴ� ������ ��������
			} catch (Exception e) {
				e.printStackTrace();
			}//try-catch2
		}//try-catch1
	}	
}
