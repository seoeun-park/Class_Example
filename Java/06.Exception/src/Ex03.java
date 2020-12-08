import java.io.FileInputStream;
import java.io.FileNotFoundException;

public class Ex03 {
	public static void main(String[] args) {
		try {
			int result = 10 / 5;		// ��Ȯ�� ���� : ArithmeticException
			System.out.println("��°� : " + result);
			
			int[] arr = new int[3];
			arr[0] = 10;				// ��Ȯ�� ���� : ArrayIndexOutOfBoundsException
			System.out.println("�迭 ������ �� : " + arr[0]);
			
			String str = "100a";		// ��Ȯ�� ���� : NumberFormatException
			int pstr = Integer.parseInt(str);
			System.out.println(pstr);
			
			FileInputStream fis = new FileInputStream("abc.txt");
			// Ȯ�� ����(�ݵ�� try-catch �������� ������� �ϹǷ� 
			// �Ǵٸ� try-catch ������ ������ �ϴµ� ������ ��ø�ǹǷ� catch ���� ����� �ȴ�.)
		} catch (ArithmeticException e) {
			System.out.println("�Է°��� �߸� �Ǿ����ϴ�.");
		} catch (ArrayIndexOutOfBoundsException e) {
			System.out.println("�迭�� index ���� �߸� �Ǿ����ϴ�.");
		} catch (FileNotFoundException e) {
			System.out.println("�ش� ������ �������� �ʽ��ϴ�.");
		} catch (Exception e) {			// Exception : ��� ���� Ŭ������ ���� Ŭ����
			e.printStackTrace();		// �߻��� ���ܸ� ���ϰ� ���
		}
		
	}//main()
}//class

/*
 	try {
		���� �ڵ�;
		���� �ڵ�;
	} catch (Exception e) {
		e.printStackTrace();
		���� ó�� �ڵ�;
	} finally {
		������ ������ �ڵ�
	}
 */


