import java.util.Scanner;

public class Question07Main {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("����ϰ� ���� ���� �Է��ϼ��� : ");
		int input = Integer.parseInt(scanner.nextLine());
		scanner.close();
		
		System.out.println("\n" + input + "���� ����մϴ�.");
		for(int i = 1; i < 10; i++) {
			System.out.println(input + " X " + i + " = " + (input * i));
		}//for
	}//main()
}//class
