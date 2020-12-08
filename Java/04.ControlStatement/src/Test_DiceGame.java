import java.util.Random;
import java.util.Scanner;

public class Test_DiceGame {
	public static void main(String[] args) {
		// DiceGame : �ֻ��� ����
		
		// ���ӽ��� : 1, �������� : -1�� �Է�  ��  X
		// 1 �Ǵ� -1 �̿��� ���ڰ� �ԷµǸ� �����޼����� ����ϰ� ���Է�
		// -1�� �ԷµǸ� ������ ����
		
		// 1�� �ԷµǸ� ������ ����
		// ����ڰ� �ֻ����� �����ϴ�.
		// Enter Key�� �Է��ϼ��� ��
		// userNumber : 1 ~ 6 ������ ���� �߿��� �������� ���ڸ� �Ҵ� 
		// ����(0���� 1������ ��)�� �߻���Ű�� ��� 2���� �� 
		// math Ŭ������ random() �޼��� / random Ŭ����
		
		// ��ǻ�Ͱ� �ֻ����� �����ϴ�.
		// Enter Key�� �Է��ϼ��� ��
		// countNumber : 1 ~ 6������ ���� �߿��� �������� ���ڸ� �Ҵ�
		
		// ������� ���� : X
		// ��ǻ���� ���� : X
		
		// You Win!
		// You Lose!
		// Draw!
		
		Scanner scanner = new Scanner(System.in);	// �Է��� �ޱ� ���� ��ü ����
		
		// ������� ���ڸ� �������� �Ҵ�(random Ŭ����)
		// while �� �ȿ� �ۼ��ϸ� while���� ����� ������ ������ �߻��ϹǷ� while�� �ۿ� �ۼ��ؾ��Ѵ�.
		Random random = new Random();		// �������� ���ڸ� �Ҵ��ϱ� ���� ��ü ����
		
		while (true) {
			System.out.print("���� ���� : 1, ���� ���� : -1�� �Է��ϼ��� �� ");
			// int userInput = scanner.nextInt();
			int userInput = Integer.parseInt(scanner.nextLine());
			
			// 1 �Ǵ� -1 �̿��� ���ڰ� �ԷµǸ� �����޼����� ����ϰ� ���Է�
			// ||�� ������ ���, -1�� �� false || true�̹Ƿ� true�� �ǹǷ� "���ڸ� �߸� �Է��ϼ̽��ϴ�!"��� �޽����� ���.
			if (userInput != 1 && userInput != -1) {
				System.out.println("���ڸ� �߸� �Է��ϼ̽��ϴ�!");
				continue;
			}//if
			
			// -1�� �ԷµǸ� ������ ���� : while���� Ż�� �� break
			if (userInput == -1) {
				System.out.println("������ �����մϴ�.");
				break;
			}//if
			
			// ������� ���ڸ� �������� �Ҵ�
			System.out.println("����ڰ� �ֻ����� �����ϴ�.");
			System.out.println("Enter Key�� �Է��ϼ���  ��  ");
			scanner.nextLine();		// ��ŷ �޼��� : ����ڷκ��� �Է��� ����ϰ�, �Է��� �Ǹ� �Է°��� ó��
			// 0���� 6�̸��� ������ 1�� ����
			int userNumber = random.nextInt(6) + 1;
			System.out.println("������� ���ڴ� " + userNumber + "�Դϴ�.\n");
			
			// ��ǻ���� ���ڸ� �������� �Ҵ�
			System.out.println("��ǻ�Ͱ� �ֻ����� �����ϴ�.");
			System.out.println("Enter Key�� �Է��ϼ���  ��  ");
			scanner.nextLine();		// ��ŷ �޼���
			int comNumber = random.nextInt(6) + 1;
			System.out.println("��ǻ���� ���ڴ� " + comNumber + "�Դϴ�.\n");
			
			// userNumber ���� comNumber ���� ���ؼ� ����� ���			
			if (userNumber > comNumber) {
				System.out.println("You Win!\n");
			} else if(userNumber < comNumber) {
				System.out.println("You Lose!\n");
			} else {
				System.out.println("Draw!\n");
			}//if
			System.out.println("===============");
		} //while
		scanner.close();
	}//main()
}//class
