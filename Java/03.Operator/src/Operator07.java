public class Operator07 {
	public static void main(String[] args) {
		int a = 10;
		String result1 = a == 10 ? "�´�" : "Ʋ����";
		String result2 = a != 10 ? "�´�" : "Ʋ����";
		System.out.println(result1);
		System.out.println(result2);
		System.out.println(a == 10 ? "�´�" : "Ʋ����");
		
		System.out.println("=======");
		
		int b = 10;
		if(b == 10) {
			System.out.println("�´�");
		}
		else {
			System.out.println("Ʋ����");
		}
		
		
	} //main()
} //class

/*
 * ���� ������
 * - 3���� ������ �����ȴ�
 * - ������ ���ǽ��� �ۼ��� ���
 * - ���ǽ� ? ���ǽ��� ���� �� ������ �� : ���ǽ��� ������ �� ������ ��;
 * - if-else �������� ���ǽİ� if ���� �ȿ� ���� ���� ������ ��� ���� �����ڸ� Ȱ���Ѵ�
 */
