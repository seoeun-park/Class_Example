import java.util.Random;
import java.util.Scanner;

public class Test_HighLowGame {
	public static void main(String[] args) {
		// HighLowGame : ���� ���߱� ����
		// 1 ~ 100 ������ ������ �������� comNumber�� �Ҵ� : 70
		
		// �޽��� : 1���� 100������ �������� �Է��ϼ��� : 50
		// �� ū ���� �Է��ϼ���!
		
		// �޽��� : 1���� 100������ �������� �Է��ϼ��� : 80
		// �� ���� ���� �Է��ϼ���!
		
		// �޽��� : 1���� 100������ �������� �Է��ϼ��� : 70
		// ������ϴ�!
		// �õ� Ƚ���� 3�� �Դϴ�.
		
		// do-while(�ּ� �ѹ��� �����ؾ� �ϱ� ������), scanner, random, if�� ����Ͻÿ�.
		
		Random random = new Random();		// random ��ü ����
		int comNumber = random.nextInt(100) + 1;		// 1~100 ������ ������ ���� ���� �Ҵ�
		// �� �������� �ϳ��� ������ �Ҵ������ �Ǳ� ������ do-while�� �ۿ��� ������ �����ؾ� �Ѵ�.
		
		// ����ڷκ��� ���ڸ� �Է¹ޱ� ���� �غ�  �� Scanner
		Scanner scanner = new Scanner(System.in);		// scanner ��ü ����
		int userNumber = 0;		// ����ڰ� �Է��� ���� ������ ������ �ʱ�ȭ
		int count = 0;			// �õ� Ƚ���� ������ ������ �ʱ�ȭ
		
		do {
			System.out.print("1���� 100������ �������� �Է��ϼ���  ��   ");
			userNumber = Integer.parseInt(scanner.nextLine());
			
			if (userNumber < 1 || userNumber > 100) {
				System.out.println("���ڸ� �߸� �Է��ϼ̽��ϴ�!");
				continue;
			}//if
			
			count++;
			
			if (comNumber > userNumber) {
				System.out.println("�� ū ���� �Է��ϼ���!\n");
				continue;
			} else if (comNumber < userNumber) {
				System.out.println("�� ���� ���� �Է��ϼ���!\n");
			} else {
				System.out.println("������ϴ�!\n");
				System.out.println("�õ� Ƚ���� " + count + "�Դϴ�.");
				break;
			}
		} while(true);
		
		scanner.close();
		
	}//main()
}//class
