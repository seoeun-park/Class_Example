import java.util.Scanner;

public class Test_scanner {
	public static void main(String[] args) {
		// 두 개의 정수를 입력(num1, num2) 받아 사칙연산을 수행하고 결과를 출력하세요.
		Scanner scanner = new Scanner(System.in);
		System.out.print("첫 번째 정수를 입력하세요 : ");
		int num1 = Integer.parseInt(scanner.nextLine());
		// 숫자 뒤에  나오는 엔터를 받기 위해 nextInt() 대신에 nextLine()를 사용 
		// 이때 nextLine은 자료형이 String이기 때문에 사칙 연산을 하려면 int로 형변환을 해주어야 한다.
		// ※  참고 Variable 03
		
		System.out.print("두 번째 정수를 입력하세요 : ");
		int num2 = Integer.parseInt(scanner.nextLine());
		
		scanner.close();
		
		System.out.println("첫 번째 정수 : " + num1);
		System.out.println("두 번째 정수 : " + num2);
		System.out.println("덧셈의 결과 : " + (num1 + num2));
		System.out.println("뺄셈의 결과 : " + (num1 - num2));
		System.out.println("곱셈의 결과 : " + (num1 * num2));
		System.out.println("나눗셈의 결과 : " + ((double)num1 / num2));
		System.out.println("나눗셈의 결과 : " + (double)(num1 / num2)); 
		
	} //main()
} //class
