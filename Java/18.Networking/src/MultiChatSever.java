import java.net.ServerSocket;
import java.net.Socket;

public class MultiChatSever {
	public static void main(String[] args) {
		ServerSocket ss = null;
		Socket socket = null;
		
		try {
			ss = new ServerSocket(9999);
			System.out.println("������ �������Դϴ�.");
			while (true) {			//�������� �ټ��� Ŭ���̾�Ʈ�� ����  �� ���ӵ� Ŭ���̾�Ʈ��ŭ Socket�� ����
				socket = ss.accept();
				Thread pt = new MultiChatPersonThread(socket);	//�ټ��� Ŭ���̾�Ʈ���� ���۵Ǵ� ������
				pt.start();
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("MultiChatServer Exception!");
		} 
	/*	
		finally {
			try {
				//socket.close();
				//ss.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	*/	
	}//main()
}//class
