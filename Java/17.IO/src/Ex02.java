import java.io.InputStream;

public class Ex02 {
	public static void main(String[] args) {
		//키보드에서 영문자 1글자를 입력받아 출력
		InputStream is = System.in;
		// new 키워드로 생성자를 만들지 않아도 System 클래스에 접근 가능
		// java.lang 패키지 안에 있는 클래스이므로
		System.out.print("영문자 1글자를 입력하세요 : ");
		
		try {
			int data = is.read();
			System.out.println((char)data);		//출력 값 : 입력한 영문자
			
			data = is.read();					//입력한 Enter키 : CR
			System.out.println(data);			//13 : ASCII 코드 값
			System.out.println((char)data);		//빈 줄 : 화면에는 아무 것도 표시되지 않는다.
												//빈 줄 : println에서 ln 출력
			
			data = is.read();					//입력한 Enter키 : LF					
			System.out.println(data);			//10 : ASCII 코드 값
			System.out.println((char)data);		//빈 줄 : 화면에는 아무 것도 표시되지 않는다.
												//빈 줄 : println에서 ln 출력
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}//main()
}//class

/*

- 사용자가 문자를 입력 → Enter 입력
- Enter를 입력하는 것은 프로그램의 종료(Terminate, Ctrl + C, Break 키)가 아니다.
- CR(Carriage Return): 커서를 줄의 맨 앞으로 이동
- LF(Line Feed) : 커서를 한 줄 아래로 이동


 */
