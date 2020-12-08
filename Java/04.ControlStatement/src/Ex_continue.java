public class Ex_continue {
	// continue : �ݺ������� continue�� �Ʒ��� ���๮�� �������� �ʰ� 
	// ������� �ݺ����� ù�Ӹ��� �̵��ϴ� Ű����
	public static void main(String[] args) {
		// 1���� 10���� ���� �߿��� Ȧ���� ������(oddSum)�� ���Ͻÿ� : for, if
		int oddSum = 0;
		for (int i = 1; i <= 10; i++) {
			if (i % 2 != 0) {
				oddSum += i;
			}
		}
		
		System.out.println("Ȧ���� ������ : " + oddSum);
		
		// 1���� 10���� ���� �߿��� Ȧ���� ��������(oddSum)�� ���Ͻÿ� : for, if, continue
		oddSum = 0;
		
		for (int i = 1; i <= 10; i++) {
			if(i % 2 == 0) {			// ¦���̸�
				continue;				// �ݺ����� ù�Ӹ��� �̵�
			} else {
				oddSum += i;
			}
		}
		
		System.out.println("Ȧ���� ������ : " + oddSum);
		
	} //main()
} //class
