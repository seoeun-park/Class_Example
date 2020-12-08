import java.util.Scanner;

public class Question07Main {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("출력하고 싶은 단을 입력하세요 : ");
		int input = Integer.parseInt(scanner.nextLine());
		scanner.close();
		
		System.out.println("\n" + input + "단을 출력합니다.");
		for(int i = 1; i < 10; i++) {
			System.out.println(input + " X " + i + " = " + (input * i));
		}//for
	}//main()
}//class
