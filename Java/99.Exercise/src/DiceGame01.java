import java.util.Random;
import java.util.Scanner;

public class DiceGame01 {
	public static void main(String[] args) {
		// DiceGame : �ֻ��� ���� �� ����ڰ� ������ �̱�� ����
		
		// ������� ���ڰ� 6�� ������ ���, ��ǻ���� ���ڴ� 1���� 5���� ������ ��
		// ������� ���ڰ� 5�� ������ ���, ��ǻ���� ���ڴ� 1���� 4���� ������ ��
		// ������� ���ڰ� 4�� ������ ���, ��ǻ���� ���ڴ� 1���� 3���� ������ ��
		//...
		
		// ���ӽ��� : Y, �������� : N �� 
		
		// �߸� �Է��ϼ̽��ϴ�!
		// ���ӽ��� : Y, �������� : N �� N
		// ������ �����մϴ�.
		
		// ���ӽ��� : Y, �������� : N �� Y
		// ����ڰ� �ֻ����� �����ϴ�. Enter Key�� �Է��ϼ���!
		// ��ǻ�Ͱ� �ֻ����� �����ϴ�. Enter Key�� �Է��ϼ���!
		
		// ������� ���� : X
		// ��ǻ���� ���� : X
		// ���� ��� : You Win! // Draw
		
		Scanner scanner = new Scanner(System.in);
		Random random = new Random();
		
		while(true) {
			System.out.print("���ӽ��� : Y, �������� : N  �� ");
			char userInput = scanner.next().charAt(0);
			
			if(userInput != 'N' && userInput != 'n' && 
				userInput != 'Y' && userInput != 'y') {
				System.out.println("���ڸ� �߸� �Է��ϼ̽��ϴ�!");
				continue;
			}
			
			if(userInput == 'N' || userInput == 'n') {
				System.out.println("������ �����մϴ�.");
				break;
			}
			
			System.out.print("����ڰ� �ֻ����� �����ϴ�. ");
			System.out.println("Enter Key�� �Է��ϼ���!");
			scanner.nextLine();
			int userNumber = random.nextInt(6) + 1;
			System.out.println("������� ���ڴ� " + userNumber + "�Դϴ�.\n");
			
			System.out.print("��ǻ�Ͱ� �ֻ����� �����ϴ�. ");
			System.out.println("Enter Key�� �Է��ϼ���!");
			scanner.nextLine();
			int comNumber = 0;
			
			if (userNumber == 1) {
				comNumber = 1;
			} else {
				comNumber = random.nextInt(userNumber - 1) + 1;				
				// 6�� ������ ���, (0 ~ 5) + 1 = 1 ~ 5
			}
			System.out.println("��ǻ���� ���ڴ� " + comNumber + "�Դϴ�.\n");
			
			// int comNumber = random.nextInt(userNumber - 1) + 1;
			// �̷��� �ۼ��ϸ� userNumber�� 1�϶� nextInt���� ���ڴ� 0�� �����Ƿ� ������ ����!
			// nextInt���� ���ڴ� 1�̻��� ����, ����� ���;� �Ѵ�.
			// ���ǽ��� �̿��ؼ� �ۼ��ؾ� �Ѵ�!(�̶� comNumber�� ���ǽ� �ۿ��� ���������� �����ؾ� �Ѵ�.)
			
			if (comNumber < userNumber) {
				System.out.println("You Win!\n");
			} else {
				System.out.println("Draw!\n");
			}
			System.out.println("============");	
		}//while
		scanner.close();
		// �迭�� ���� : int[] arr;
		// �迭�� ���� : arr = new int[10];
		// �迭�� ����� ���� : int[] arr = new int[10];
		// �迭�� ����� ���� �ڷ������� ������ �����̰� ����� ���� �ڷ��� �߿� �迭 Ÿ���̴�.
		// �迭�� �ε����� 0���� �����ϸ� ������ �ε����� (�迭�� ũ�� -1)�̴�.
		// �迭�� ũ��� �迭 ���� �ÿ� �����Ǹ�, ���߿� �ٲ� �� ����.
	}//main()
}//class
