public class Operator03 {
	public static void main(String[] args) {
		// ��Ʈ������ : �������� ���忡�� ��Ʈ�� ���� ������ �����ϴ� �� �ϵ���� ������ ��
		// ������ JAVA������ ���� ������� �ʴ´�.
		// �� & (AND) : ��� 1�� �� �� 1�� ���
		// �� | (OR) : �ϳ��� 1�� �� �� 1�� ���
		// �� ^ (XOR) : ���� �ٸ� ��(������ 0���� ���) �� 1�� ���
		int x = 3;		// 2���� : 11
		int y = 2;		// 2���� : 10
		
		System.out.println(x & y);		// ��°� : 2(10)
		System.out.println(x | y);		// ��°� : 3(11)
		System.out.println(x ^ y);		// ��°� : 1(01)
		
	} //main()
} //class
