import java.net.ServerSocket;
import java.net.Socket;

public class MultiChatSever {
	public static void main(String[] args) {
		ServerSocket ss = null;
		Socket socket = null;
		
		try {
			ss = new ServerSocket(9999);
			System.out.println("서버가 구동중입니다.");
			while (true) {			//서버에는 다수의 클라이언트가 접속  → 접속된 클라이언트만큼 Socket을 생성
				socket = ss.accept();
				Thread pt = new MultiChatPersonThread(socket);	//다수의 클라이언트에서 동작되는 스레드
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
