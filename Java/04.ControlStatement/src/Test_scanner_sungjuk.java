import java.util.Scanner;

public class Test_scanner_sungjuk {
	public static void main(String[] args) {
		// ���� ���� : 0 ~ 100
		// ���� ����(���� �̸� : kor)�� �Է��ϼ��� : XX
		// ���� ������ �߸� �Է��ϼ̽��ϴ�!
		// ���� ������ �Է��ϼ��� : XX
		
		// ���� ����(���� �̸� : eng)�� �Է��ϼ��� : XX
		// ���� ������ �߸� �Է��ϼ̽��ϴ�!
		// ���� ������ �Է��ϼ��� : XX
		
		// ���� ����(���� �̸� : mat)�� �Է��ϼ��� : XX
		// ���� ������ �߸� �Է��ϼ̽��ϴ�!
		// ���� ������ �Է��ϼ��� : XX
		
		// ���� ���� : XX
		// ���� ���� : XX
		// ���� ���� : XX
		// ���� : XXX
		// ��� ���� : XX.XX
		
		//=======================
		// Scanner, while, if, break, continue�� �̿��ؼ� �ۼ��Ͻÿ�.
		
		Scanner scanner = new Scanner(System.in);
		// while ���� �ۿ����� ������ Ȱ���ؾ��ϹǷ� ���������� �����ؾ� �Ѵ�.
		int kor = 0, eng = 0, mat = 0;
		
		while(true) {
			System.out.print("���� ������ �Է��ϼ��� : ");
			kor = Integer.parseInt(scanner.nextLine());
				
				if (kor >= 0 && kor <= 100) {
					break;
				} else {
					System.out.println("���� ������ �߸� �Է��ϼ̽��ϴ�!");
					continue;
				}
			}//while1
			
			while(true) {
				System.out.print("���� ������ �Է��ϼ��� : ");
				eng = Integer.parseInt(scanner.nextLine());
				
				if (eng < 0 || eng > 100) {
					System.out.println("���� ������ �߸� �Է��ϼ̽��ϴ�!");
					continue;
				} else {
					break;
				}
			}//while2
			
			while(true) {
				System.out.print("���� ������ �Է��ϼ��� : ");
				mat = Integer.parseInt(scanner.nextLine());
				
				// ���� ������ ���
				if (mat < 0 || mat > 100) {
					System.out.println("���� ������ �߸� �Է��ϼ̽��ϴ�!");
					continue;
				}//if
				break;
			}//while3
			
			scanner.close();
			
			System.out.println("���� ���� : " + kor);
			System.out.println("���� ���� : " + eng);
			System.out.println("���� ���� : " + mat);
			System.out.println("���� : " + (kor + eng + mat));
			System.out.println("��� ���� : " + (double)(kor + eng + mat) / 3);

	}//main()
}//class
