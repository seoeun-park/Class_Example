public class Test_while {
	public static void main(String[] args) {
		// 1���� 100������ ���� �߿��� ¦���� ��(evenSum)�� ���Ͻÿ� : while, if
		int evenSum = 0;		// ¦���� ���� ����� ������ �ʱ�ȭ
		int i = 1;				// �ʱⰪ
		
		while(i <= 100) {		// ���ǽ�(������)
			if (i % 2 == 0) {	// ¦���̸�
				evenSum += i;	// ������ ���
			} //if
			i++;				// ������
		} //while
		
		System.out.println("¦���� �� : " + evenSum);
		
	} //main()
} //class
