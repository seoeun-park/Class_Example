import java.text.DecimalFormat;
import java.util.Scanner;

public class Test_Method03 {
	// 임의의 정수 두 개를 입력 받아(num1, num2)
	// 사칙 연산을 수행하는 메소드를 호출(add(), sub(), mul(), div())
	// 결과 값은 return 받아 출력하시오.
	// 단, 나눗셈의 결과는 소수 둘째자리까지 표시하시오.  ▶  DecimalFormat Class
	// 출력 예시
	// 첫 번째 정수를 입력하세요 : xxx
	// 두 번째 정수를 입력하세요 : xxx
	
	// 첫번째 정수 : xxx
	// 두 번째 정수 : xxx
	// 덧셈의 결과 : xxx
	// 뺄셈의 결과 : xxx
	// 곱셈의 결과 : xxx
	// 나눗셈의 결과 : xxx
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		System.out.print("첫 번째 정수를 입력하세요 : ");
		int num1 = Integer.parseInt(scanner.nextLine());
		
		System.out.print("두 번째 정수를 입력하세요 : ");
		int num2 = Integer.parseInt(scanner.nextLine());
		
		scanner.close();
		
		System.out.println("첫 번째 정수 : " + num1);
		System.out.println("두 번째 정수 : " + num2);
		System.out.println();
		System.out.println("덧셈의 결과 : " + add(num1, num2));
		System.out.println("뺄셈의 결과 : " + sub(num1, num2));
		System.out.println("곱셈의 결과 : " + mul(num1, num2));
		System.out.println("나눗셈의 결과 : " + div(num1, num2));
		System.out.println("나눗셈의 결과 : " + divResult(num1, num2));
	}//main()
	
	// 메소드 구현
	public static int add(int x, int y) {
		return x + y;
	}//add()
	
	public static int sub(int x, int y) {
		return x - y;
	}//sub()
	
	public static int mul(int x, int y) {
		return x * y;
	}//mul()
	
	public static double div(int x, int y) {
		return (double)x / y;		// 나눗셈의 결과는 실수형 자료가 나올 수 있다.
	}//div()
	
	public static double divResult(int x, int y) {
		DecimalFormat df = new DecimalFormat("0.00");
		return Double.parseDouble(df.format((double)x / y));
		// DecimalFormat을 사용하면 결과는 String Type
	}//divResult
	
	/*
	 * 	, : 천 단위 구분 기호
	 * 	. : 소수점
	 * 	# : 유효하지 않는 0값은 화면표시 X
	 		ex) 78.53891633 → 0.###일 경우 78.54으로 출력
	 		ex) 78.53891633 → 000.000일 경우 078.540으로 출력
	 		ex) 0.14 → #.#일 경우 .1로 출력
	 * 	0 : 유효하지 않는 0값도 화면 표시 O
	 */
}//class
