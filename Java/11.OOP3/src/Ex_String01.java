import java.util.Arrays;

public class Ex_String01 {
	// String Class : ���ڿ��� �����ϱ� ���� ����� ��� �ִ� Ŭ����
	// SumMicroSystem(Oracle) ��ü���� �̸��� �����Ͽ� ����  ��  API(Library)
	// API ����(����) : www.oracle.com  ��  Java Downloads ��  Documentation ��  JAVA SE API
	// ��  https://docs.oracle.com/javase/8/docs/api/index.html
	// JRE System Library ��  rt.jar ��  java.lang.package ��  String class 
	public static void main(String[] args) {
		String str1 = "apple";				// apple ���ڿ��� str1 ������ �Ҵ�
		String str2 = new String("APPLE");	// APPLE ���ڿ��� str2 ��ü�� �Ҵ�
		
		
		System.out.println("str1 : " + str1);
		System.out.println("str2 : " + str2);
		
		// ���ڿ��� ���̸� ���ϴ� �޼ҵ� : length()
		System.out.println("str1�� ���� : " + str1.length());
		
		// �빮�ڷ� �����ϴ� �޼ҵ� : toUpperCase()
		System.out.println("str1�� �빮�ڷ� ���� : " + str1.toUpperCase());
		
		// �ҹ��ڷ� �����ϴ� �޼ҵ� : toLowerCase()
		System.out.println("str2�� �ҹ��ڷ� ���� : " + str2.toLowerCase());
		
		// Ư�� ���ڸ� �����ϴ� �޼ҵ� : subString()
		System.out.println(str1.substring(1));		// index 1���� ������ ����
		System.out.println(str1.substring(1, 3));	// index 1���� 3�� �ձ����� ����
		
		// �־��� ���ڿ����� Ư�� ���� �� ���ڸ� �����ϴ� �޼ҵ� : charAt()
		System.out.println(str2.charAt(3));
		System.out.println(str2.substring(3, 4));
		
		// ã���� �ϴ� ���ڰ� �����ϴ� �� ���θ� �Ǵ��� �� ����ϴ� �޼ҵ� : indexOf()
		// �� ������ ��� : index ���� ��ȯ / �������� �ʴ� ��� : -1 ��ȯ
		int index1 = str2.indexOf("P");
		int index2 = str2.indexOf("B");
		System.out.println(index1 + ", " + index2);
		
		// ���ڿ��� �и���ų �� ����ϴ� �޼ҵ� : split() 
		// ��  ������ ��ȣ�� �������� ���ڿ��� �и� : ����� String[] ��ȯ
		String str3 = "����@�ٶ�@����@";
		String[] sp = str3.split("@");
		
		for (int i = 0; i < sp.length; i++) {
			System.out.println(sp[i]);
		}
		
		System.out.println(Arrays.toString(sp));
		
		// ���ڿ��� ġȯ�� ��(ã�� �ٲ� ��) ����ϴ� �޼ҵ� : replaceAll()
		System.out.println(str2.replaceAll("PP", "@@"));
		System.out.println(str2.replaceAll("P", "@@"));
		
		// �¿� ������ ������ �� ����ϴ� �޼ҵ� : trim()
		String str4 = "   abc   def   ";
		System.out.println(str4);
		System.out.println("���� ���� �� ���� : " + str4.length());
		System.out.println(str4.trim());		//�糡 �¿� ���鸸 ����
		System.out.println("���� ���� �� ���� : " + str4.trim().length());
		
		
	}//main()
}//class
