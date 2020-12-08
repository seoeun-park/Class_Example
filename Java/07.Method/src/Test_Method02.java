import java.util.Scanner;

public class Test_Method02 {
	public static void main(String[] args) {
		// 임의의 실수 2개를 입력받아 (num1, num2)   ▶  Scanner
		// 두 실수의 합을 구하여 return하는 메소드(getSum())를 호출
		Scanner scanner = new Scanner(System.in);
		
		System.out.print("첫 번째 실수를 입력하시오 : ");
		double num1 = Double.parseDouble(scanner.nextLine());
		
		System.out.print("두 번째 실수를 입력하시오 : ");
		double num2 = Double.parseDouble(scanner.nextLine());
		System.out.println();
		scanner.close();
		
		System.out.println("첫 번째 실수 : " + num1);
		System.out.println("두 번째 실수 : " + num2);
		System.out.println("두 실수의 합 : " + getSum(num1, num2));
		
	}//main()
	
	// 임의의 실수 2개를 전달받아 두 실수의 합(sum)을 구하여 return하는 메소드(getSum())를 정의
	public static double getSum(double x, double y)	{
		//double sum = x + y;
		//return sum;
		return x + y;
	}//getSum()
}//class
