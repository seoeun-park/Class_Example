import java.net.ServerSocket;
import java.net.Socket;

public class ChatServer {
	public static void main(String[] args) {
		ServerSocket ss = null;
		Socket socket = null;
		try {
			//ServerSocket : Port ����
			ss = new ServerSocket(9999);
			System.out.println("������ �������Դϴ�.");
			
			//Socket ���� : Client�� ���������� �����´�
			socket = ss.accept();
			
			//Ŭ���̾�Ʈ���� ���� �޼����� �޴� �۾�(����, �Է�)   ��  �޴� Thread
			Thread rt = new ChatReceiverThread(socket);
			rt.start();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				//socket.close();	
				//�� ������ �����ؾ��ϱ� ������ finally �������� socket�� close�ϸ� �ѹ� �̻� ������ �ȵȴ�.
				ss.close();
			} catch (Exception e) {
				e.printStackTrace(); 
			}
		}//try-catch-finally
	}//main()
}//class
