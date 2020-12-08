import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.Socket;
import java.util.ArrayList;

//접속된 다수의 클라이언트에서 동작되는 스레드
//접속된 모든 클라이언트의 접속 정보를 저장하고
//접속된 클라이언트에게 메세지를 전송(송신, 수신)할 수 있도록
//클라이언트의 목록을 저장할 무한 배열을 만들자 → ArrayList<>
//MultiChatServer Class의 main() 메소드와 같이 동작 : static
public class MultiChatPersonThread extends Thread{
	private Socket socket;
	private PrintWriter pw;
	static ArrayList<PrintWriter> list = new ArrayList<>();
	
	public MultiChatPersonThread(Socket socket) {
		this.socket = socket;
		try {
			OutputStream os = socket.getOutputStream();
			pw = new PrintWriter(os);
			list.add(pw);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void run() {
		String name = null;
		InetAddress addr = socket.getInetAddress();
		String comName = addr.getHostName();
		
		try {
			InputStream is = socket.getInputStream();
			InputStreamReader isr = new InputStreamReader(is);
			BufferedReader br = new BufferedReader(isr);
			
			//클라이언트에서 맨 처음에 입력된 메세지(대화명)을 받아
			//접속된 다른 클라이언트 화면에 출력  ▶  sendAll()
			name = br.readLine();
			sendAll("#" + name + "(" + comName + ")님께서 입장하셨습니다!");
			// #홍길동(201-xx)님께서 입장하셨습니다!
			
			//클라이언트에서 보낸 메세지(대화 내용)를 접속된 다른 클라이언트에게 전송
			while (true) {
				String msg = br.readLine();
				if (msg == null) {
					break;
				}//if
				sendAll(name + "(" + comName + ") : " + msg);
				// #홍길동(201-xx) : 안녕하세요
			}//while
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("MultiChatPersonThread Exception");
		} finally {
			try {
				list.remove(pw);	//접속 목록에서 삭제
				sendAll("#" + name + "(" + comName + ")님께서 퇴장하셨습니다!");
				// #홍길동(201-xx)님께서 퇴장하셨습니다!
				socket.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}//try-catch-finally
	}//run()
	
	public void sendAll(String msg) {
		for (PrintWriter pw : list) {
			pw.println(pw);
			pw.flush();
		}//for-each
	}//sendAll()
}//class
