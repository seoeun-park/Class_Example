import java.io.InputStream;
import java.io.InputStreamReader;

public class Ex04 {
	public static void main(String[] args) {
		//키보드에서 한글 1글자를 입력받아 출력
		InputStream is = System.in;		
		// → 바이트 스트림(1 byte 데이터를 전송하는 스트림) : ASCII 코드, 이미지, 영상, 음원
		
		InputStreamReader isr = new InputStreamReader(is);		
		// → 문자 스트림(2 byte 데이터를 전송하는 스트림) : UniCode, 텍스트
		//InputStreamReader isr = new InputStreamReader(System.in);
		
		// 한글뿐만 아니라 영문도 출력가능 : UniCode는 ASCII 코드를 확장한 개념이기 때문에
		System.out.print("한글 1글자를 입력하세요 : ");
		try {
			int data = isr.read();
			System.out.println("입력하신 글자는 " + data + "입니다.");		//UniCode
			System.out.println("입력하신 글자는 " + (char)data + "입니다.");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}//main()
}//class
