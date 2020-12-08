import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.Socket;

public class MultiChatReceiverThread extends Thread{	//수신, 입력  → BufferedReader
	private Socket socket;
	public MultiChatReceiverThread(Socket socket) {
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
					br.close();
					break;
				}
				System.out.println(msg);
			}//while
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("MultiChatReceiverThread Exception!");
		} finally {
			try {
				socket.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}//run()
}//class
