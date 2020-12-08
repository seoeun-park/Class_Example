import java.io.FileInputStream;
import java.io.FileNotFoundException;

public class Ex01 {
	public static void main(String[] args) {
		// 3���� ũ�⸦ ���� ������ �迭(arr[])�� �����ϰ� ������ ��, ���� �Ҵ�
		int[] arr = new int [3];
		arr[0] = 10;
		arr[1] = 20;
		arr[2] = 30;
		//arr[3] = 40;		
		// �� ArrayIndexOutOfBoundsException : ��Ȯ�� ����(���� ����)
		
		System.out.println("arr[0]�� �� : " + arr[0]);
		System.out.println("arr[1]�� �� : " + arr[1]);
		System.out.println("arr[2]�� �� : " + arr[2]);
		//System.out.println("arr[3]�� �� : " + arr[3]);
		// �� ArrayIndexOutOfBoundsException : ��Ȯ�� ����(���� ����)
		
		System.out.println("===================================");
		
		//String str1 = 100;		//�ϵ�������� ����(���α׷� ��ü�� ���� x)
		String str1 = "100";
		System.out.println(str1);
		
		int pstr1 = Integer.parseInt(str1);
		System.out.println(pstr1);
		
		String str2 = "100a";
		System.out.println(str2);
		//int pstr2 = Integer.parseInt(str2);
		//System.out.println(pstr2);
		// �� NumberFormatException : ��Ȯ�� ����(���� ����)
		
		System.out.println("===================================");
		
		int x = 10;
		int y = 0;
		System.out.println(y / x);		// ��°� : 0
		//System.out.println(x / y);		// ArithmeticException : ��Ȯ�� ����(���� ����)
		
		System.out.println("===================================");
		
		//"abc.txt" ������ �о���̽ÿ� : FileInputStream Class �� IO Project
		try {
			FileInputStream fis = new FileInputStream("abc.text"); //Ȯ�� ����
		} catch (FileNotFoundException e) {				// Ȯ�� ���ܸ� ó���ϱ� ���� ��
			// TODO Auto-generated catch block
			e.printStackTrace();					// ���ܰ� �߻��� ������ �޸𸮿��� �����Ͽ� ���ϰ� ���
			System.out.println(e.getMessage());		// ���� �޼����� �����ϰ� ���
			System.out.println("�ش�Ǵ� ������ �������� �ʽ��ϴ�.");	//���� �޽����� ���
		}
		
		/*
		 try {
		 
		 	���ܰ� �߻��� ���ɼ��� �ִ� �ڵ�
		 	
		 } catch (���� Ŭ����) {
		 
		 	���ܰ� �߻����� �� ó���� ��� �ڵ�;
		 	
		 } finally {			�� finally�� ���� ����
		 
		 	���� ���� ���ο� ������� ������ �����ϰ� ���� �ڵ�;
		 }
		 */
		
	}//main()
}//class

/*
1. ����(Exception)
 - ���� �� �߻��ϴ� ������ �����Ϸ��� �� �� ����.
 - ���� �� ���� �߻� �� ���ܸ� �߻����� ���� ó����
 - ���ܸ� ó������ ������ ���ܰ� �߻��� ���α׷��� ���� ����
 
 1) [������ ����]
 	�� �ϵ�������� ���� : ġ������ ���� �� ���α׷��� ���� ���� �ʴ´�.
 	�� ����Ʈ�������� ���� : ������ ���� �� ����(Exception)
 	 - SumMicroSystem(Oracle)������ ��� ���ܵ��� Ŭ������ ���� �����Ѵ�.
 	 ����) ArrayIndexOutOfBoundException : ÷��(index)�� �߸��� �迭�� ����ߴ�
 	 
 2) [���� Ŭ���� �з�]
 �� ��Ȯ�� ����(���� ����)
  - ���α׷��� ���� �غ��� ���ܰ� �߻��ߴ� �� �� �� �ִ�.
  - ���α׷��� �Ǽ��� ���� �߻��ϴ� ���� : �����(��������) �۾��� ����.
  
 �� Ȯ�� ����(�Ϲ� ����)
  - ���α׷� �ۼ� ��(�ڵ� ��)�� �ݵ�� ����ó���� �ؾߵǴ� Ŭ����
  - try { ~~ } catch { ~~ } finally { ~~ } �� ����ó��
  
 3) ���� ó����
 - try-catch-finally�� ���
 - finally�� ���� ����

		 try {
		 
		 	���ܰ� �߻��� ���ɼ��� �ִ� �ڵ�
		 	
		 } catch (���� Ŭ����) {
		 
		 	���ܰ� �߻����� �� ó���� ��� �ڵ�;
		 	
		 } finally {			�� finally�� ���� ����
		 
		 	���� ���� ���ο� ������� ������ �����ϰ� ���� �ڵ�;
		 }

 4) ���� �߻��ϴ� ����
 
	 ArithmeticException	: ������ 0���� ���� �� �߻�
	 NullPointerException	: Null ���۷��� ������ �� �߻�
	 ClassCastException		: ��ȯ�� �� ���� Ÿ������ ��ü�� ��ȯ�� �� �߻�
	 OutOfMemoryException	: �޸𸮰� ������ ���(�ڹٿ����� ���� �Ͼ�� �ʴ� ����)
	 ArrayIndexOutOfBoundsException	: �迭�� ������ ��� ���� �� �߻�
	 IllegalArgumentException		: �߸��� ���� ���� �� �߻�
	 IOException			: ����� ���� ���� �Ǵ� ���ͷ�Ʈ �� �߻�
	 NumberFormatException	: ���ڿ��� ��Ÿ���� ���ڿ� ��ġ���� �ʴ� Ÿ���� ���ڷ� ��ȯ �� �߻�

*/
