import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.Scanner;

public class CalcClient {
	public static void main(String[] args) {
		Socket socket = null;
		try {
			//Socket 생성 : 서버의 IP 주소와 Port 번호
			socket = new Socket("192.168.0.170", 9999);
			
			//하나의 서버에 여러 클라이언트를 동시에 연결하려면 Thread를 구현해야 한다.
			//num1, num2, opcode를 입력받는다 : Scanner
			Scanner scanner = new Scanner(System.in);
			System.err.print("첫 번째 정수를 입력하세요 : ");
			int num1 = Integer.parseInt(scanner.nextLine());
			System.err.print("두 번째 정수를 입력하세요 : ");
			int num2 = Integer.parseInt(scanner.nextLine());
			System.out.print("연산자를 입력하세요 : ");
			String opCode = scanner.nextLine();
			scanner.close();
			
			//CalcDTO 객체를 생성하고, 서버로 송신(출력)
			//OutputStream > OutputStreamWriter > BufferedWriter
			//				 PrintWriter ▶  ObjectPrintWriter : 객체를 출력(송식)
			CalcDTO dto = new CalcDTO(num1, num2, opCode);
			OutputStream os = socket.getOutputStream();
			ObjectOutputStream oos = new ObjectOutputStream(os);
			oos.writeObject(dto);
			
			//서버에서 전달된 결과를 수신(입력)받아 화면에 출력
			InputStream is = socket.getInputStream();
			InputStreamReader isr = new InputStreamReader(is);
			BufferedReader br = new BufferedReader(isr);
			int result = Integer.parseInt(br.readLine());
			System.out.println("첫 번째 정수 : " + num1);
			System.out.println("두 번째 정수 : " + num2);
			System.out.println("연산자 : " + opCode);
			System.out.println("결과 : " + result);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				socket.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
