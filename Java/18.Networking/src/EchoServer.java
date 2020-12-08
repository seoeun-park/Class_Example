import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.ServerSocket;
import java.net.Socket;

//EchoServer : 정보를 응답(Response, 제공)
public class EchoServer {
	public static void main(String[] args) {
		//서버측에서는 서버를 2개를 만들어야 함 : Server Socket, Socket
		ServerSocket ss = null;
		Socket socket = null;
		try {
			//Server Socket 생성 : Port 번호 할당
			ss = new ServerSocket(9999);
			System.out.println("서버가 구동중입니다.");
			
			//Socket 생성 : 클라이언트의 접속 정보가 들어있는 Socket
			socket = ss.accept();		//서버쪽의 Socket을 생성하는 방법
			//socket = new Socket();		//클라이언트쪽의 Socket을 생성하는 방법
			
			//클라이언트가 보낸 메세지를 수신(입력)받기 위한 준비 단계
			InputStream is = socket.getInputStream();
			InputStreamReader isr = new InputStreamReader(is);
			BufferedReader br = new BufferedReader(isr);
			// PrintReader는 JAVA에서 제공해주지 X
			
			//클라이언트가 보낸 메세지를 수신받아 화면에 출력하자
			String msg = br.readLine();
			System.out.println("클라이언트로부터 받은 메세지 : " + msg);
			
			br.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//예외가 발생하든, 예외가 발생하지 않든 닫는 건 무조건 실행시켜야 하기 때문에 finally 구문에서 작성
			try {
				socket.close();
				ss.close();
				// 닫는 순서는 역순으로
			} catch (Exception e) {
				e.printStackTrace();
			}//try-catch2
		}//try-catch1
	}	
}
