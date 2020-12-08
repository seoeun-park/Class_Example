import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.ObjectInputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;

public class CalcServer {
	public static void main(String[] args) {
		ServerSocket ss = null;
		Socket socket = null;
		
		try {
			//ServerSocket 생성 : Port 번호 할당(Port 번호 충돌시 catch 블록으로 넘어감)
			ss = new ServerSocket(9999);
			System.out.println("서버가 구동중입니다.");
			
			//Socket 생성 : 클라이언트의 접속정보를 가져온다
			socket = ss.accept();
			
			//클라이언트에서 전송한 객체를 수신(입력)
			//InputStream > InputStreamReader > BufferedReader
			//InputStream > ObjectInputStream
			InputStream is = socket.getInputStream();
			ObjectInputStream ois = new ObjectInputStream(is);
			CalcDTO dto = (CalcDTO)ois.readObject();		//객체의 역직렬화
			
			//수신받은 DTO 객체의 멤버변수를 이용하여 사칙연산을 수행하고 결과를 리턴하는 메소드 호출
			CalcDAO dao = new CalcDAO();
			int result = dao.getResult(dto);
			
			//결과를 서버측 화면에 출력
			System.out.println("첫 번째 정수 : " + dto.getNum1());
			System.out.println("두 번째 정수 : " + dto.getNum2());
			System.out.println("연산자 : " + dto.getOpCode());
			System.out.println("결과 : " + result);
			
			//결과를 클라이언트에게 송신(출력)
			OutputStream os = socket.getOutputStream();
			PrintWriter pw = new PrintWriter(os);
			pw.println(result);
			pw.flush();
			pw.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				socket.close();
				ss.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
	}//main()
}//class
