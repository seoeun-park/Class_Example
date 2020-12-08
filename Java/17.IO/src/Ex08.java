import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.nio.Buffer;

public class Ex08 {
	public static void main(String[] args) {
		//키보드에서 문자열을 여러 번 입력받아 출력
		//버퍼를 활용 : InputStream → InputStreamReader → BufferedReader
		//단, 'bye'라는 문자열이 입력되면 종료
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		while (true) {
			System.out.print("문자열을 입력하세요 : ");
			try {
				String msg = br.readLine();
				System.out.println("입력하신 문자열은 " + msg + "입니다.");
				//if (msg == "bye") {			//문자열은 비교 연산자를 사용할 수 없다.
				
				/*
				if (msg.compareTo("bye") == 0) {	
					System.out.println("종료되었습니다.");
					break;
				}
				*/
				
				/*
				if(msg.equals("bye")) {		//equals() : 같으면 true, 다르면 false 반환
					System.out.println("종료되었습니다.");
					break;
				}
				*/
				
				if(msg.equalsIgnoreCase("bye")) {	//대소문자 구분 없이 같은 지를 비교 
					System.out.println("종료되었습니다.");
					break;
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}//try-catch
		}//while
		
	}//main()
}//class
