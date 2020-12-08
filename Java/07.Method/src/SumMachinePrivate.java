import java.util.Scanner;

public class SumMachinePrivate {
	// ���� ��(startNum)�� ���� ��(endNum)�� �Է¹��� ��
	// makeSum() �޼ҵ� ȣ���ϰ� �����(sum)�� ���
	// makeSum() �޼ҵ�� SumMachine.java, SumMachineReturn.java Ŭ���� Ȱ��
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
			
			SumMachine sm = new SumMachine(); 	// SumMachine Ŭ������ ����
			sm.makeSum(startNum, endNum);		// makeSum() �޼ҵ� ȣ��
			// public �� makeSum() : ���������ڰ� public ����  ��  �ܺο����� ��� ����
			
			SumMachineReturn smr = new SumMachineReturn();	// SumMacineReturn ��ü ����
			//smr.makeSum(startNum, endNum);		// makeSum() �޼ҵ� ȣ��
			// private �� makeSum() : ���������ڰ� private ����  ��  ���ο����� ��� ����(��������)
			
			break;
		}//while
		scanner.close();
	}//main()
}//class
