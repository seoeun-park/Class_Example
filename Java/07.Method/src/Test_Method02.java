import java.util.Scanner;

public class Test_Method02 {
	public static void main(String[] args) {
		// ������ �Ǽ� 2���� �Է¹޾� (num1, num2)   ��  Scanner
		// �� �Ǽ��� ���� ���Ͽ� return�ϴ� �޼ҵ�(getSum())�� ȣ��
		Scanner scanner = new Scanner(System.in);
		
		System.out.print("ù ��° �Ǽ��� �Է��Ͻÿ� : ");
		double num1 = Double.parseDouble(scanner.nextLine());
		
		System.out.print("�� ��° �Ǽ��� �Է��Ͻÿ� : ");
		double num2 = Double.parseDouble(scanner.nextLine());
		System.out.println();
		scanner.close();
		
		System.out.println("ù ��° �Ǽ� : " + num1);
		System.out.println("�� ��° �Ǽ� : " + num2);
		System.out.println("�� �Ǽ��� �� : " + getSum(num1, num2));
		
	}//main()
	
	// ������ �Ǽ� 2���� ���޹޾� �� �Ǽ��� ��(sum)�� ���Ͽ� return�ϴ� �޼ҵ�(getSum())�� ����
	public static double getSum(double x, double y)	{
		//double sum = x + y;
		//return sum;
		return x + y;
	}//getSum()
}//class
