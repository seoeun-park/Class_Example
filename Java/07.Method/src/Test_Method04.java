import java.util.Scanner;

public class Test_Method04 {
	// 임의의 정수 두 개를 입력 받아(num1, num2)
	// 짝수의 합(evenSum)과 홀수의 합(oddSum)을 구하는 메소드를 호출(evenSum(), oddSum())
	// 결과 값은 return 받아 출력하시오.
	// 단, 첫 번째 정수는 작은 수를 입력받고 두 번째 정수는 큰 수를 입력받는다.
	// scanner, while, break, continue, if
	// 출력 예시
	// 첫 번째 정수를 입력하세요 : xxx
	// 두 번째 정수를 입력하세요 : xxx
	
	// 첫 번째 정수는 작은 수, 두 번째 정수는 큰 수를 입력하세요!
	
	// 첫 번째 정수 : xxx
	// 두 번째 정수 : xxx
	// 짝수의 합: xxx
	// 홀수의 합 : xxx
	
	public static void main(String[] args) {
		
		Scanner scanner = new Scanner(System.in);
		
		while(true) {
			
			System.out.print("첫 번째 정수를 입력하세요 : ");
			int num1 = Integer.parseInt(scanner.nextLine());
			
			System.out.print("두 번째 정수를 입력하세요 : ");
			int num2 = Integer.parseInt(scanner.nextLine());
			
			if (num1 > num2) {
				System.out.println("첫 번째 정수는 작은 수, 두 번째 정수는 큰 수를 입력하세요!");
				continue;
			} else {
				System.out.println();
				System.out.println("첫 번째 정수 : " + num1);
				System.out.println("두 번째 정수 : " + num2);
				System.out.println();
				System.out.println("짝수의 합 : " + evenSum(num1, num2));
				System.out.println("홀수의 합 : " + oddSum(num1, num2));
				break;				
			}
			
		}//while
		
		scanner.close();
		
	}//main()
	
	public static int evenSum(int x, int y) {
		int evenSum = 0;
		
		for (int i = x; i <= y; i++) {
			if(i % 2 == 0) {
				evenSum += i;
			}//if
		}//for
		
		return evenSum;
		
	}//evenSum()
	
	public static int oddSum(int x, int y) {
		int oddSum = 0;
		
		for(int i = x; i <= y; i++) {
			if(i % 2 == 1) {
				oddSum += i;
			}//if
		}//for
		
		return oddSum;
		
	}//oddSum()
	
}//class
