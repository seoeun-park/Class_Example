import java.util.Scanner;

public class Test_scanner {
	public static void main(String[] args) {
		// �� ���� ������ �Է�(num1, num2) �޾� ��Ģ������ �����ϰ� ����� ����ϼ���.
		Scanner scanner = new Scanner(System.in);
		System.out.print("ù ��° ������ �Է��ϼ��� : ");
		int num1 = Integer.parseInt(scanner.nextLine());
		// ���� �ڿ�  ������ ���͸� �ޱ� ���� nextInt() ��ſ� nextLine()�� ��� 
		// �̶� nextLine�� �ڷ����� String�̱� ������ ��Ģ ������ �Ϸ��� int�� ����ȯ�� ���־�� �Ѵ�.
		// ��  ���� Variable 03
		
		System.out.print("�� ��° ������ �Է��ϼ��� : ");
		int num2 = Integer.parseInt(scanner.nextLine());
		
		scanner.close();
		
		System.out.println("ù ��° ���� : " + num1);
		System.out.println("�� ��° ���� : " + num2);
		System.out.println("������ ��� : " + (num1 + num2));
		System.out.println("������ ��� : " + (num1 - num2));
		System.out.println("������ ��� : " + (num1 * num2));
		System.out.println("�������� ��� : " + ((double)num1 / num2));
		System.out.println("�������� ��� : " + (double)(num1 / num2)); 
		
	} //main()
} //class
