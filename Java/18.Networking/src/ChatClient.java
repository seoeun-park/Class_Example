import java.net.Socket;

public class ChatClient {
	public static void main(String[] args) {
		Socket socket = null;
		try {
			socket = new Socket("192.168.0.170", 9999);
			
			//Ű���忡�� �޼����� �Է¹޾� ������ ������ �۾�(�۽�, ���)   ��  ������ Thread
			Thread st = new ChatSenderThread(socket);
			st.start();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		/*
		finally {
			try {
				//socket.close();
				// �� ������ �����ؾ��ϱ� ������ finally �������� socket�� close�ϸ� �ѹ� �̻� ������ �ȵȴ�.
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		*/
	}//main()
}//class
