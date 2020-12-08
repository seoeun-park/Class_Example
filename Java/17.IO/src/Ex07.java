import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;

public class Ex07 {
	public static void main(String[] args) {
		//키보드에서 한글 여러 글자를 입력받아 출력 : 버퍼(Buffer)를 활용
		InputStream is = System.in;							//바이트 스트림
		InputStreamReader isr = new InputStreamReader(is);	//문자 스트림	
		//InputStreamReader isr = new InputStreamReader(System.in);
		
		BufferedReader br = new BufferedReader(isr);		//버퍼 활용
		//BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("한글 여러 글자를 입력하세요 : ");
		try {
			String msg = br.readLine();		
			System.out.println("입력하신 글자는 " + msg + "입니다.");
			// readLine() : Enter앞까지의 모든 문자를 한번에 입력
			// readLine()의 반환값 : String
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}//main()
}//class

/*
○ 버퍼(Buffer)의 필요성
- 주기억장치(DRAM)과 입출력 장치의 속도 차이를 완충시켜주는 역할을 수행한다.

- 일반적인 입출력은 여러 글자를 입력한다 하더라도 실제 처리될 때는 한 글자씩 입출력된다.
- 입력된 글자의 개수만큼 접근이 이루어진다. ▶  속도 저하의 원인
- 이와 같은 비효율성을 개선하고자 여러 글자를 입력한다 하더라도 버퍼(Buffer)를 이용하여
- 입력한 글자를 한번에 입출력할 수 있도록 지원해준다.
- 버퍼의 기본 크기 : 1024 Byte
- 버퍼 사용 방법 : BufferedReader Class 객체 생성 → readLine() 메소드 활용

 */
