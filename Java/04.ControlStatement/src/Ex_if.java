public class Ex_if {
	public static void main(String[] args) {
		/*
		   �� �ܼ� if�� : ������ �Ǵ��Ͽ� ���� ��쿡�� ����
		 
		 if(���ǽ�) {
		 	���๮;
		 }
		 
		   �� ���๮�� �ϳ��̸� {}(��ŷ)�� �����ص� �ȴ�(���� x).
		   ��  if(���ǽ�) ���๮
		 */
		
		int a = 10;
		
		if(a % 2 == 0) {		// a�� 2�� ���� ������ ���� 0�� ���� : ¦��
			System.out.println("�Է°��� " + a + "�Դϴ�.");
			System.out.println(a + "�� ¦���Դϴ�.");
		} //if
		
		int b = 9;
		if(b % 2 != 0) {		// b�� 2�� ���� ������ ���� 0�� ���� �ʴ� : Ȧ��
			System.out.println("�Է°��� " + b + "�Դϴ�.\n" + b + "�� Ȧ���Դϴ�.");
		} //if
		
		// if ���Ϲ��� ���� �����ڷ�  ǥ���� ���
		int c = 7;
		System.out.println(c % 2 == 0 ? "¦��" : "");
		
	} //main()
} //class
