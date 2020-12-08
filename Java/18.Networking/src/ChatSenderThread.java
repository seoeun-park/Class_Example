import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.Scanner;

//보내는 Thread : 메세지를 송신(출력)    ▶  PrintWriter
public class ChatSenderThread extends Thread{		//Thread Class를 상속
	private Socket socket;
	
	public ChatSenderThread(Socket socket) {
		this.socket = socket;
	}		
	
	@Override
	public void run() {
		try {
			OutputStream os = socket.getOutputStream();
			PrintWriter pw = new PrintWriter(os);
			Scanner scanner = new Scanner(System.in);
			
			while (true) {
				System.out.print("전송할 메세지를 입력하세요 : ");
				String msg = scanner.nextLine();
				
				if (msg.equals("bye")) {
					System.out.println("종료되었습니다.");
					System.exit(0);		//메모리에서 완전히 제거하기 위해서
					break;
				}
				
				pw.println(msg);
				pw.flush();		//강제전송
			}//while
			
			scanner.close();
			pw.close();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ChatSenderThread Exception!");
		} finally {				//Client와 Server에서 닫지 않은 socket을 Thread에서 닫아야한다.		
			try {
				socket.close();
			} catch (Exception e) {
				e.printStackTrace();
			}//try-catch
		}//try-catch-finally
			
	}//run()
	
}//class
