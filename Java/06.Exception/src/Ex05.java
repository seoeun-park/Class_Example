import java.io.FileInputStream;
import java.io.FileNotFoundException;

public class Ex05 {
	public static void main(String[] args) throws FileNotFoundException {
		int result = 10 / 5;		// 미확인 예외 : ArithmeticException
		System.out.println("결과값 : " + result);
		
		FileInputStream fis = new FileInputStream("abc.txt");	// 확인 예외
	}//main()
}//class

// throws : 예외를 처리하는 방법 → 예외 회피(예외 미루기)    ▶  try ~~ catch문을 사용하지 x
// 메소드 선언부에서 사용 
// 예) public static void xxx() { ~~ } 
// 	▶▶▶▶  public static void xxx() throws XXXException { ~~ }
