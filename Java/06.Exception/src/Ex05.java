import java.io.FileInputStream;
import java.io.FileNotFoundException;

public class Ex05 {
	public static void main(String[] args) throws FileNotFoundException {
		int result = 10 / 5;		// ��Ȯ�� ���� : ArithmeticException
		System.out.println("����� : " + result);
		
		FileInputStream fis = new FileInputStream("abc.txt");	// Ȯ�� ����
	}//main()
}//class

// throws : ���ܸ� ó���ϴ� ��� �� ���� ȸ��(���� �̷��)    ��  try ~~ catch���� ������� x
// �޼ҵ� ����ο��� ��� 
// ��) public static void xxx() { ~~ } 
// 	��������  public static void xxx() throws XXXException { ~~ }
