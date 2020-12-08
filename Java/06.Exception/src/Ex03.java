import java.io.FileInputStream;
import java.io.FileNotFoundException;

public class Ex03 {
	public static void main(String[] args) {
		try {
			int result = 10 / 5;		// 미확인 예외 : ArithmeticException
			System.out.println("출력값 : " + result);
			
			int[] arr = new int[3];
			arr[0] = 10;				// 미확인 예외 : ArrayIndexOutOfBoundsException
			System.out.println("배열 원소의 값 : " + arr[0]);
			
			String str = "100a";		// 미확인 예외 : NumberFormatException
			int pstr = Integer.parseInt(str);
			System.out.println(pstr);
			
			FileInputStream fis = new FileInputStream("abc.txt");
			// 확인 예외(반드시 try-catch 구문으로 묶어줘야 하므로 
			// 또다른 try-catch 구문을 만들어야 하는데 구문이 중첩되므로 catch 블럭만 만들면 된다.)
		} catch (ArithmeticException e) {
			System.out.println("입력값이 잘못 되었습니다.");
		} catch (ArrayIndexOutOfBoundsException e) {
			System.out.println("배열의 index 값이 잘못 되었습니다.");
		} catch (FileNotFoundException e) {
			System.out.println("해당 파일이 존재하지 않습니다.");
		} catch (Exception e) {			// Exception : 모든 예외 클래스의 상위 클래스
			e.printStackTrace();		// 발생한 예외를 상세하게 출력
		}
		
	}//main()
}//class

/*
 	try {
		정상 코드;
		예외 코드;
	} catch (Exception e) {
		e.printStackTrace();
		예외 처리 코드;
	} finally {
		무조건 실행할 코드
	}
 */


