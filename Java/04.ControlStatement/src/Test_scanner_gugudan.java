import java.util.Scanner;

public class Test_scanner_gugudan {
	public static void main(String[] args) {
		// ����ڷκ��� ����ϰ� ���� �������� �ܼ��� �Է�(danNumber) �� Scanner
		// �Է¹��� �ܼ��� �������� ����Ѵ�  ��  �ݺ��� (for)
		// ��, �Է¹��� �ܼ��� ������ 2�ܺ��� 9�ܱ����̸�  �� if, break 
		// �� ���� �ܼ��� �ԷµǸ� �����޽����� ����ϰ� ���Է��� �޴´�. �� while, continue
		Scanner scanner = new Scanner(System.in);
		
		while(true) {
			System.out.print("����ϰ� ���� �ܼ��� �Է��ϼ��� : ");
			int danNumber = Integer.parseInt(scanner.nextLine());
			
			if(danNumber < 2 || danNumber > 9) {
				System.out.println("�ܼ��� �߸� �Է��ϼ̽��ϴ�!");
				System.out.println("2 ~ 9 ������ �ܼ��� �Է��ϼ���!");
				System.out.println();
				continue;
			} else {
				System.out.println(danNumber + "���� ����մϴ�.");
				
				for (int i = 1; i <= 9; i++) {
					System.out.println(danNumber + " x " + i + " = " + (danNumber * i));
				} //for
				break;
			} //if
		} //while
		
		scanner.close();
		
	}//main()
}//class
