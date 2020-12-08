import java.util.Scanner;

public class Test_Method04 {
	// ������ ���� �� ���� �Է� �޾�(num1, num2)
	// ¦���� ��(evenSum)�� Ȧ���� ��(oddSum)�� ���ϴ� �޼ҵ带 ȣ��(evenSum(), oddSum())
	// ��� ���� return �޾� ����Ͻÿ�.
	// ��, ù ��° ������ ���� ���� �Է¹ް� �� ��° ������ ū ���� �Է¹޴´�.
	// scanner, while, break, continue, if
	// ��� ����
	// ù ��° ������ �Է��ϼ��� : xxx
	// �� ��° ������ �Է��ϼ��� : xxx
	
	// ù ��° ������ ���� ��, �� ��° ������ ū ���� �Է��ϼ���!
	
	// ù ��° ���� : xxx
	// �� ��° ���� : xxx
	// ¦���� ��: xxx
	// Ȧ���� �� : xxx
	
	public static void main(String[] args) {
		
		Scanner scanner = new Scanner(System.in);
		
		while(true) {
			
			System.out.print("ù ��° ������ �Է��ϼ��� : ");
			int num1 = Integer.parseInt(scanner.nextLine());
			
			System.out.print("�� ��° ������ �Է��ϼ��� : ");
			int num2 = Integer.parseInt(scanner.nextLine());
			
			if (num1 > num2) {
				System.out.println("ù ��° ������ ���� ��, �� ��° ������ ū ���� �Է��ϼ���!");
				continue;
			} else {
				System.out.println();
				System.out.println("ù ��° ���� : " + num1);
				System.out.println("�� ��° ���� : " + num2);
				System.out.println();
				System.out.println("¦���� �� : " + evenSum(num1, num2));
				System.out.println("Ȧ���� �� : " + oddSum(num1, num2));
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
