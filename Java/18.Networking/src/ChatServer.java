import java.net.ServerSocket;
import java.net.Socket;

public class ChatServer {
	public static void main(String[] args) {
		ServerSocket ss = null;
		Socket socket = null;
		try {
			//ServerSocket : Port 생성
			ss = new ServerSocket(9999);
			System.out.println("서버가 구동중입니다.");
			
			//Socket 생성 : Client의 접속정보를 가져온다
			socket = ss.accept();
			
			//클라이언트에서 보낸 메세지를 받는 작업(수신, 입력)   ▶  받는 Thread
			Thread rt = new ChatReceiverThread(socket);
			rt.start();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				//socket.close();	
				//▶ 여러번 전송해야하기 때문에 finally 구문에서 socket을 close하면 한번 이상 전송이 안된다.
				ss.close();
			} catch (Exception e) {
				e.printStackTrace(); 
			}
		}//try-catch-finally
	}//main()
}//class
