import java.net.Socket;

public class MultiChatClient {
	public static void main(String[] args) {
		Socket socket = null;
		
		try {
			socket = new Socket("192.168.0.200", 9999);
			
			//Ŭ���̾�Ʈ ���α׷� ���� �� ��ȭ���� ���Է� �Ǿ��� ��
			//������ �ȳ��ϴ� �޼��� ���
			if (args.length != 1) {
				System.out.println("���α׷� ���� �� ��ȭ���� �Է����ּ���!");
				System.out.println("���� �� : java MultiChatClient ��ȭ��");
			}
			
			//�޼����� �Է¹޾� ������ ������ �۾�(�۽�, ���)  ��  MultiChatSenderThread
			Thread st = new MultiChatSenderThread(socket, args[0]);
			st.start();
			
			//�޼����� ����(�Է�)�޾� ȭ�鿡 ����ϴ� �۾�  ��  MultiChatReceiverThread
			Thread rt = new MultiChatReceiverThread(socket);
			rt.start();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("MultiChatClient Exception!");
		} /*finally {
			try {
				socket.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}*/
	}//main()
}//class
