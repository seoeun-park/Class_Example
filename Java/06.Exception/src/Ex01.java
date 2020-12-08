import java.io.FileInputStream;
import java.io.FileNotFoundException;

public class Ex01 {
	public static void main(String[] args) {
		// 3개의 크기를 갖는 정수형 배열(arr[])을 선언하고 생성한 후, 값을 할당
		int[] arr = new int [3];
		arr[0] = 10;
		arr[1] = 20;
		arr[2] = 30;
		//arr[3] = 40;		
		// → ArrayIndexOutOfBoundsException : 미확인 예외(실행 예외)
		
		System.out.println("arr[0]의 값 : " + arr[0]);
		System.out.println("arr[1]의 값 : " + arr[1]);
		System.out.println("arr[2]의 값 : " + arr[2]);
		//System.out.println("arr[3]의 값 : " + arr[3]);
		// → ArrayIndexOutOfBoundsException : 미확인 예외(실행 예외)
		
		System.out.println("===================================");
		
		//String str1 = 100;		//하드웨어적인 에러(프로그램 자체가 실행 x)
		String str1 = "100";
		System.out.println(str1);
		
		int pstr1 = Integer.parseInt(str1);
		System.out.println(pstr1);
		
		String str2 = "100a";
		System.out.println(str2);
		//int pstr2 = Integer.parseInt(str2);
		//System.out.println(pstr2);
		// → NumberFormatException : 미확인 예외(실행 예외)
		
		System.out.println("===================================");
		
		int x = 10;
		int y = 0;
		System.out.println(y / x);		// 출력값 : 0
		//System.out.println(x / y);		// ArithmeticException : 미확인 예외(실행 예외)
		
		System.out.println("===================================");
		
		//"abc.txt" 파일을 읽어들이시오 : FileInputStream Class ▶ IO Project
		try {
			FileInputStream fis = new FileInputStream("abc.text"); //확인 예외
		} catch (FileNotFoundException e) {				// 확인 예외를 처리하기 위한 블럭
			// TODO Auto-generated catch block
			e.printStackTrace();					// 예외가 발생한 시점을 메모리에서 추적하여 상세하게 출력
			System.out.println(e.getMessage());		// 예외 메세지만 간략하게 출력
			System.out.println("해당되는 파일이 존재하지 않습니다.");	//직접 메시지를 출력
		}
		
		/*
		 try {
		 
		 	예외가 발생할 가능성이 있는 코드
		 	
		 } catch (예외 클래스) {
		 
		 	예외가 발생했을 때 처리할 대안 코드;
		 	
		 } finally {			▶ finally는 생략 가능
		 
		 	예외 실행 여부와 상관없이 무조건 실행하고 싶은 코드;
		 }
		 */
		
	}//main()
}//class

/*
1. 예외(Exception)
 - 실행 중 발생하는 에러는 컴파일러가 알 수 없다.
 - 실행 중 에러 발생 시 예외를 발생시켜 예외 처리함
 - 예외를 처리하지 않으면 예외가 발생한 프로그램은 강제 종료
 
 1) [에러의 종류]
 	① 하드웨어적인 에러 : 치명적인 에러 ▶ 프로그램이 실행 되지 않는다.
 	② 소프트웨어적인 에러 : 가벼운 에러 ▶ 예외(Exception)
 	 - SumMicroSystem(Oracle)에서는 모든 예외들을 클래스로 만들어서 제공한다.
 	 예시) ArrayIndexOutOfBoundException : 첨자(index)가 잘못된 배열을 사용했다
 	 
 2) [예외 클래스 분류]
 ① 미확인 예외(실행 예외)
  - 프로그램을 실행 해봐야 예외가 발생했는 지 알 수 있다.
  - 프로그램의 실수에 의해 발생하는 예외 : 디버깅(오류수정) 작업이 쉽다.
  
 ② 확인 예외(일반 예외)
  - 프로그램 작성 중(코딩 중)에 반드시 예외처리를 해야되는 클래스
  - try { ~~ } catch { ~~ } finally { ~~ } ▶ 예외처리
  
 3) 예외 처리문
 - try-catch-finally문 사용
 - finally는 생략 가능

		 try {
		 
		 	예외가 발생할 가능성이 있는 코드
		 	
		 } catch (예외 클래스) {
		 
		 	예외가 발생했을 때 처리할 대안 코드;
		 	
		 } finally {			▶ finally는 생략 가능
		 
		 	예외 실행 여부와 상관없이 무조건 실행하고 싶은 코드;
		 }

 4) 자주 발생하는 예외
 
	 ArithmeticException	: 정수를 0으로 나눌 때 발생
	 NullPointerException	: Null 레퍼런스 참조할 때 발생
	 ClassCastException		: 변환할 수 없는 타입으로 객체를 변환할 때 발생
	 OutOfMemoryException	: 메모리가 부족한 경우(자바에서는 거의 일어나지 않는 예외)
	 ArrayIndexOutOfBoundsException	: 배열의 범위를 벗어난 접근 시 발생
	 IllegalArgumentException		: 잘못된 인자 전달 시 발생
	 IOException			: 입출력 동작 실패 또는 인터럽트 시 발생
	 NumberFormatException	: 문자열이 나타내는 숫자와 일치하지 않는 타입의 숫자로 변환 시 발생

*/
