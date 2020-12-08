import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.Socket;

//받는 Thread : 메세지를 소신(입력)  ▶  BufferedReader
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
					System.exit(0);		//메모리 정리
					break;
				}
				System.out.println("수신 메세지 : " + msg);
			}//while
			br.close();
		} catch (Exception e) {
			//e.printStackTrace();
			//System.out.println("ChatReceiverThread Exception!");
			System.out.println("종료되었습니다.");
		} finally {
			try {
				socket.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}//run()
	
 }//class
