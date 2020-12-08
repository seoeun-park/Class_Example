import java.net.Socket;

public class MultiChatClient {
	public static void main(String[] args) {
		Socket socket = null;
		
		try {
			socket = new Socket("192.168.0.200", 9999);
			
			//클라이언트 프로그램 실행 시 대화명이 미입력 되었을 때
			//사용법을 안내하는 메세지 출력
			if (args.length != 1) {
				System.out.println("프로그램 실행 시 대화명을 입력해주세요!");
				System.out.println("실행 예 : java MultiChatClient 대화명");
			}
			
			//메세지를 입력받아 서버로 보내는 작업(송신, 출력)  ▶  MultiChatSenderThread
			Thread st = new MultiChatSenderThread(socket, args[0]);
			st.start();
			
			//메세지를 수신(입력)받아 화면에 출력하는 작업  ▶  MultiChatReceiverThread
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
