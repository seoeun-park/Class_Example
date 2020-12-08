import java.io.BufferedWriter;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.Scanner;

//EchoClient : 정보를 요청(Request, 질의)
//TCP : 오류검사 수행, 속도는 느리지만 신뢰성이 높다.
public class EchoClient {
	public static void main(String[] args) {
		//서버에 접속을 시도하여 접속이 성공하면 Socket 생성
		//Socket : IP Address + Port Number
		Socket socket = null;
		try {
			socket = new Socket("192.168.0.178", 9999); 	//서버 IP주소, Port 번호
			
			//클라이언트에서 송신(출력)하기 위한 준비 단계
			OutputStream os = socket.getOutputStream();		//노드 스트림 : 가장 먼저 연결되는 스트림
			
			//OutputStreamWriter osw = new OutputStreamWriter(os);	//한글
			//BufferedWriter bw = new BufferedWriter(osw);	//속도 향상
			
			PrintWriter pw = new PrintWriter(os);	//OutputStreamWriter + BufferedWriter
			
			//키보드에서 메세지를 입력(Scanner)받아 서버로 보내자(송신)
			Scanner scanner = new Scanner(System.in);
			System.out.print("서버로 보낼 메세지를 입력하세요 : ");
			String msg = scanner.nextLine();
			scanner.close();
			
			pw.println(msg);
			pw.flush();		//강제전송
			pw.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				socket.close();
			} catch (Exception e) {
				e.printStackTrace();
			}//try-catch
		}//try-catch-finally
	}//main()
}//class
