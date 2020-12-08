import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.Scanner;

public class MultiChatSenderThread extends Thread{		//송신, 출력  →PrintWriter
	private Socket socket;
	private String name;
	public MultiChatSenderThread(Socket socket, String name) {
		this.socket = socket;
		this.name = name;
	}
	
	@Override
	public void run() {
		try {
			OutputStream os = socket.getOutputStream();
			PrintWriter pw = new PrintWriter(os);
			pw.println(name);
			pw.flush();
			
			Scanner scanner = new Scanner(System.in);
			while (true) {
				System.out.print("서버로 전송할 메세지를 입력하세요 : ");
				String msg = scanner.nextLine();
				if (msg.equals("bye")) {
					scanner.close();
					pw.close();
					break;
				}//if
				pw.println(msg);
				pw.flush();
			}//while
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("MultiChatSenderThread Exception!");
		} finally {
			try {
				socket.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}//try-catch-finally
	}//run()


}//class
