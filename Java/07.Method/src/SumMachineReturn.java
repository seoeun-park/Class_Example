import java.util.Scanner;

public class SumMachineReturn {
	// ���� ��(startNum)�� ���� ��(endNum)�� �Է¹��� ��
	// makeSum() �޼ҵ� ȣ���ϰ� �����(sum)�� return �޾� ���
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
			
			System.out.println();
			System.out.println("���� �� : " + startNum + ", ���� �� : " + endNum);
			//System.out.println("���� ���� ���� �������� ������ : " + makeSum(startNum, endNum));
			
			SumMachineReturn smr = new SumMachineReturn(); 	// makeSum �޼ҵ尡 �ִ� Ŭ������ ����
			System.out.println("���� ���� ���� �������� ������ : " + smr.makeSum(startNum, endNum));
			break;
		}//while
		
		scanner.close();	

	}//main()
	
	// ���� ���� ���� ������ ������(sum)�� ���ϰ� ����� return �޼ҵ�(makeSum())�� ����
	private int makeSum(int startNum, int endNum) {
		int sum = 0;

		for (int i = startNum; i <= endNum; i++) {
			sum += i;
		}//for
		return sum;
	}//makeSum()
}//class
