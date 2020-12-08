import java.util.Scanner;

public class SumMachine {
	// ���� ��(startNum)�� ���� ��(endNum)�� �Է¹��� �� makeSum() �޼ҵ� ȣ��
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);

		while(true) {
			System.out.print("���� ���� �Է��ϼ��� : ");
			int startNum = Integer.parseInt(scanner.nextLine());
			
			System.out.print("���� ���� �Է��ϼ��� : ");
			int endNum = Integer.parseInt(scanner.nextLine());
			
			if (startNum > endNum) {
				System.out.println("���� ���� ���� ��, ���� ���� ū ���� �Է��ϼ���!");
				continue;
			}
			//makeSum(startNum, endNum);		//���� : makeSum() �޼ҵ忡 static�� ����.
			SumMachine sm = new SumMachine();	// makeSum �޼ҵ尡 ����ִ� Ŭ������ ��ü�� ����
			sm.makeSum(startNum, endNum);		// ������ ��ü �ȿ� �ִ� �޼ҵ带 ȣ��
			break;
		}//while
		
		scanner.close();	
			
	}//main()
	
	// ���� ���� ���� ������ ������(sum)�� ���ϰ� ����ϴ� �޼ҵ�(makeSum())�� ����
	public void makeSum(int x, int y) {			//static ����
		int sum = 0;

		for (int i = x; i <= y; i++) {
			sum += i;
		}//for			

		System.out.println();
		System.out.println("���� �� : " + x + ", ���� �� : " + y);
		System.out.println("���� ���� ���� �������� ������ : " + sum);
	}//makeSum()
}//class
