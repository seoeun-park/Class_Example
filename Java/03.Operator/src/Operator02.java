public class Operator02 {
	public static void main(String[] args) {
		// ���� ������ : ++(����), --(����)   �� �ݺ������� ���� ���
		// ������ ���� ����� ó������ �ʴ� ������ : ���� ����
		// �������� ��ġ�� ������ ���� �� ���� ���� ���� ����� �ٸ���.
		int a = 0;
		int b = 10;
		
		// a + b 				// ���� : ������ ����� ������ ������ ����.
		// int result = a + b;	// ���� ������
		
		System.out.println(++a);	// ��°� : 1
		System.out.println(a);		// ��°� : 1
		System.out.println(--b);	// ��°� : 9
		System.out.println(b);		// ��°� : 9

		int c = 0;
		int d = 10;
		System.out.println(c++);	// ��°� : 0
		System.out.println(c);		// ��°� : 1
		System.out.println(d--);	// ��°� : 10
		System.out.println(d);		// ��°� : 9
		
		// ���� : x = 5, y = 10�� ���, 'x++ + ++x + y++'�� �����
		// ������ ����� �� 'x + y'�� �����?
		int x = 5, y = 10;
		System.out.println(x++ + ++x + y++);	// ��°� : 22
		// System.out.println(5 + 7 + 10);
		
		System.out.println(x + y);				// ��°� : 18
		// System.out.println(7 + 11);
		
		/*
		 * ����		���		�޸�
		 * x++		5		6
		 * ++x		7		7
		 * y++		10		11
		 */
		
	} //main()
} //class
