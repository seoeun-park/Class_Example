import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.Socket;

//�޴� Thread : �޼����� �ҽ�(�Է�)  ��  BufferedReader
public class ChatReceiverThread extends Thread{
	private Socket socket;
	public ChatReceiverThread(Socket socket) {
		this.socket = socket;
	}
	
	@Override
	public void run() {
		try {
			InputStream is = socket.getInputStream();
			InputStreamReader isr = new InputStreamReader(is);
			BufferedReader br = new BufferedReader(isr);
			
			while (true) {
				String msg = br.readLine();
				if (msg == null) {
					System.exit(0);		//�޸� ����
					break;
				}
				System.out.println("���� �޼��� : " + msg);
			}//while
			br.close();
		} catch (Exception e) {
			//e.printStackTrace();
			//System.out.println("ChatReceiverThread Exception!");
			System.out.println("����Ǿ����ϴ�.");
		} finally {
			try {
				socket.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}//run()
	
 }//class
