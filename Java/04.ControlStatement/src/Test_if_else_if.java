public class Test_if_else_if {
	public static void main(String[] args) {
		// ���� �ڵ�(code)�� 1�̸� '����', 2�̸� '����', 3�̸� '����', 4�̸� '����'
		// �� �ܿ��� �����޽���('���� �ڵ尡 �߸� �ԷµǾ����ϴ�') ���
		int code = 2;
		
		if (code == 1 || code == 3) {
			System.out.println("�����Դϴ�.");
		} else if (code == 2 || code == 4) {
			System.out.println("�����Դϴ�.");
		} else {
			System.out.println("���� �ڵ尡 �߸� �ԷµǾ����ϴ�.");
		} //if
	} //main()
} //class
