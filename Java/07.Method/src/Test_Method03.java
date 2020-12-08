import java.text.DecimalFormat;
import java.util.Scanner;

public class Test_Method03 {
	// ������ ���� �� ���� �Է� �޾�(num1, num2)
	// ��Ģ ������ �����ϴ� �޼ҵ带 ȣ��(add(), sub(), mul(), div())
	// ��� ���� return �޾� ����Ͻÿ�.
	// ��, �������� ����� �Ҽ� ��°�ڸ����� ǥ���Ͻÿ�.  ��  DecimalFormat Class
	// ��� ����
	// ù ��° ������ �Է��ϼ��� : xxx
	// �� ��° ������ �Է��ϼ��� : xxx
	
	// ù��° ���� : xxx
	// �� ��° ���� : xxx
	// ������ ��� : xxx
	// ������ ��� : xxx
	// ������ ��� : xxx
	// �������� ��� : xxx
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		System.out.print("ù ��° ������ �Է��ϼ��� : ");
		int num1 = Integer.parseInt(scanner.nextLine());
		
		System.out.print("�� ��° ������ �Է��ϼ��� : ");
		int num2 = Integer.parseInt(scanner.nextLine());
		
		scanner.close();
		
		System.out.println("ù ��° ���� : " + num1);
		System.out.println("�� ��° ���� : " + num2);
		System.out.println();
		System.out.println("������ ��� : " + add(num1, num2));
		System.out.println("������ ��� : " + sub(num1, num2));
		System.out.println("������ ��� : " + mul(num1, num2));
		System.out.println("�������� ��� : " + div(num1, num2));
		System.out.println("�������� ��� : " + divResult(num1, num2));
	}//main()
	
	// �޼ҵ� ����
	public static int add(int x, int y) {
		return x + y;
	}//add()
	
	public static int sub(int x, int y) {
		return x - y;
	}//sub()
	
	public static int mul(int x, int y) {
		return x * y;
	}//mul()
	
	public static double div(int x, int y) {
		return (double)x / y;		// �������� ����� �Ǽ��� �ڷᰡ ���� �� �ִ�.
	}//div()
	
	public static double divResult(int x, int y) {
		DecimalFormat df = new DecimalFormat("0.00");
		return Double.parseDouble(df.format((double)x / y));
		// DecimalFormat�� ����ϸ� ����� String Type
	}//divResult
	
	/*
	 * 	, : õ ���� ���� ��ȣ
	 * 	. : �Ҽ���
	 * 	# : ��ȿ���� �ʴ� 0���� ȭ��ǥ�� X
	 		ex) 78.53891633 �� 0.###�� ��� 78.54���� ���
	 		ex) 78.53891633 �� 000.000�� ��� 078.540���� ���
	 		ex) 0.14 �� #.#�� ��� .1�� ���
	 * 	0 : ��ȿ���� �ʴ� 0���� ȭ�� ǥ�� O
	 */
}//class
