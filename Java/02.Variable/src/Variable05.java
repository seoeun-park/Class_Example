public class Variable05 {
	public static void main(String[] args) {
		// ���� ������ Ÿ�� : char(2byte) �� �ϳ��� ���ڸ� ���� : UniCode(�����ڵ�)
		
		// ���� �ڵ�
		// - BCD(2��ȭ 10�� �ڵ�) : 6bit �� 64����
		// - ASCII(�̱� ǥ�� �ڵ�) : 7bit �� 128����
		// - EBCDIC(Ȯ���� BCD) : 8bit �� 256����
		// �� UniCode : 2Byte(18bit) �� �� ������ ��� ����
		
		// char �ڷ����� ���� ������ ���� �Ҵ��� ���� ���� ����ǥ�� ����Ѵ�.
		char a = 'A';
		char b = '��';
		char c = '��';
		
		System.out.println("���� a�� �� : " + a);
		System.out.println("���� b�� �� : " + b);
		System.out.println("���� c�� �� : " + c);
		
		// String : ����� ���� �ڷ���(������ �ڷ���)�� Ŭ���� Ÿ��(JAVA���� �⺻������ �������ִ� �ڷ���)
		// ����, ���ڿ��� ������ �� �ִ� Ŭ����
		// ���� �Ҵ��� ���� �ֵ���ǥ�� ����Ѵ�.
		String str1 = "ABCD";
		String str2 = "�����ٶ�";
		System.out.println("���� str1�� �� : " + str1);
		System.out.println("���� str2�� �� : " + str2);
		
	} //main()
} //class
