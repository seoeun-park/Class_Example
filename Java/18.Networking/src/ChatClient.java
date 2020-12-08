import java.net.Socket;

public class ChatClient {
	public static void main(String[] args) {
		Socket socket = null;
		try {
			socket = new Socket("192.168.0.170", 9999);
			
			//키보드에서 메세지를 입력받아 서버로 보내는 작업(송신, 출력)   ▶  보내는 Thread
			Thread st = new ChatSenderThread(socket);
			st.start();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		/*
		finally {
			try {
				//socket.close();
				// ▶ 여러번 전송해야하기 때문에 finally 구문에서 socket을 close하면 한번 이상 전송이 안된다.
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		*/
	}//main()
}//class
