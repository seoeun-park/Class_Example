import java.util.Scanner;

public class Ex_scanner {
	public static void main(String[] args) {
		// Ű����κ��� ����(score)�� �Է¹��� ��, �� �Է�(scanner)
		// ������ ����ϴ� ���α׷�  ��  ����(if)
		// �Է� �ޱ� ���ؼ��� Scanner ��ü ���� : new Scanner(System.in);
		// �̶� Scanner()�� ������ �޼����̴�.
		// ex) String str1 = new String("Hello World!");
		// 		-> String str1 = "Hello World!";
		
		Scanner scanner = new Scanner(System.in);	// ��ü ������ �ѹ���!
		
		while(true) {
			// �̷��� while ������ ���ѷ����̹Ƿ� �ݵ�� break�� �ɾ�� �Ѵ�.
			System.out.print("������ �Է��ϼ��� : ");		// ��ŷ ���� : �Է��� ����ϰ� �ִ� ����
			int score = scanner.nextInt();
			System.out.println("�Է��Ͻ� ������ " + score + "�� �Դϴ�.");
			
			
			if (score >= 0 && score <= 100) {
				if(score >= 90) {
					System.out.println("����� ������ A���� �Դϴ�.");
				} else if(score >= 80) {
					System.out.println("����� ������ B���� �Դϴ�.");
				} else if (score >= 70) {
					System.out.println("����� ������ C���� �Դϴ�.");
				} else if (score >= 60) {
					System.out.println("����� ������ D���� �Դϴ�.");
				} else {
					System.out.println("����� ������ F���� �Դϴ�.");
				} //else-if
				break;
			} else {
				System.out.println("������ �߸� �Է��ϼ̽��ϴ�.");
				continue; 			// �ٽ� ���� ù�Ӹ���
			} //if
		}//while
		// close�� while ������ ���� ������ �ۼ��ϴ� ����?
		// �� close�� while ���� �ȿ� �ۼ��ϰ� �ȴٸ� ������ �߸� �Է����� �� continue ��ɾ�� 
		//	 ���� ù�Ӹ��� ���� �����ڰ� �������� ������ ������ �߻��Ѵ�.
		scanner.close();
	} //main()
} //class
