import java.util.Random;
import java.util.Scanner;

public class DiceGame02 {
	public static void main(String[] args) {
		// ����ڰ� ���� �·��� �̱�� ���� : 3 ���� �� 2 ���� �¸�
		// 1 ���� : You Win!
		// 2 ����: You Win!
		// 3 ���� : You Lose! or Draw!  
		//========================= �·� : 67%
		// 4 ���� : You Win!
		// 5 ���� : You Lose! or Draw!
		// 6 ���� : You Win!
		//========================= �·� : 67%
		// 7 ���� : You Lose! or Draw!
		// 8 ���� : You Win!
		// 9 ���� : You Win!
		// userNum : Random
		// comNum : Random
		// userNum�� comNum�� ��
		// winCnt++ loseCnt++ drawCnt++
		
		Random random = new Random();
		Scanner scanner = new Scanner(System.in);
		
		// ������ Ƚ���� �����ϴ� ������ �ݺ��� �ȿ� �ۼ��� ��� �ݺ����� ���ư� ������ 
		// ������ 0���� �ʱ�ȭ�ǹǷ� ���ǹ��� ����� �۵����� �ʱ⶧���� �ݺ��� �ۿ��� �ۼ��ؾ��Ѵ�.
		int winCnt = 0, loseCnt = 0, drawCnt = 0, totalCnt = 0;
		
		while(true) {
			System.out.print("���ӽ��� : Y, �������� : N  ��   ");
			char userInput = scanner.next().charAt(0);
			
			// ����ڰ� �߸� �Է����� ���
			if (userInput != 'Y' && userInput != 'y' 
			&& userInput != 'N' && userInput != 'n') {
				System.out.println("�߸� �Է��ϼ̽��ϴ�.");
				continue;
			}
			
			// ����ڰ� ������ ������ ���
			if (userInput == 'N' || userInput == 'n') {
				System.out.println("������ �����մϴ�.");
				break;
			}
			
			int userNumber = 0;
			int comNumber = 0;
			
			// �·� ���� ���ǹ�
			if (winCnt == 0 && (loseCnt == 1 || drawCnt == 1)) {
				userNumber = random.nextInt(6) + 1;
				// ����ڰ� ������ �̱�� ����
				if (userNumber == 1) {
					comNumber = 0;			//?
				} else {
					comNumber = random.nextInt(userNumber - 1) + 1;				
				}
				
			} else if ((winCnt == 1 && loseCnt == 1) || (winCnt == 1 && drawCnt == 1)) {
				userNumber = random.nextInt(6) + 1;
				// ����ڰ� ������ �̱�� ����
				if (userNumber == 1) {
					comNumber = 0;			//?
				} else {
					comNumber = random.nextInt(userNumber - 1) + 1;
				}
				
			} else if (winCnt == 2) {
				// ����ڰ� ������ ���� ����
				int index = userNumber + 1;
				
				if (userNumber == 6) {
					comNumber = 7;			//?
				} else {
					comNumber = random.nextInt(6 - index + 1) + index;				
					// ������ = random.nextInt(max - min + 1 ) + min;
					// �� ������ �ּ� ~ �ִ��� �������� ������ �����ϴ� ����
				}
				
			} else {
				userNumber = random.nextInt(6) + 1;
				comNumber = random.nextInt(6) + 1;
			}
			
			System.out.print("����ڰ� �ֻ����� �����ϴ�  ��   ");
			System.out.println("Enter Key�� �Է��ϼ���");
			scanner.nextLine();
			System.out.println("������� ���ڴ� " + userNumber + "�Դϴ�.\n");
			
			System.out.print("��ǻ�Ͱ� �ֻ����� �����ϴ�  �� ");
			System.out.println("Enter Key�� �Է��ϼ���");
			scanner.nextLine();
			System.out.println("��ǻ���� ���ڴ� " + comNumber + "�Դϴ�.\n");
			

			if (userNumber > comNumber) {
				System.out.println("You Win!\n");
				winCnt++;
				totalCnt++;
			} else if (userNumber < comNumber) {
				System.out.println("You Lose!\n");
				loseCnt++;
				totalCnt++;
			} else {
				System.out.println("Draw!\n");
				drawCnt++;
				totalCnt++;
			}
			
			// ������ Ƚ���� �����ϴ� ���� �ʱ�ȭ
			if(totalCnt % 3 == 0) {
				winCnt = 0;
				loseCnt = 0;
				drawCnt = 0;
			}	
		}//while
		scanner.close();
	}//main()
}//class
