public class Test_for02 {
	public static void main(String[] args) {
		// 1���� 100������ ���� �߿��� Ȧ���� ������(oddSum)�� ���Ͽ� ����Ͻÿ�. : for, if
		int oddSum = 0;
		
		for (int i = 1; i <= 100; i++) {		// 1���� 100���� 1�� ����
			if (i % 2 != 0) {					// Ȧ���̸�(i % 2 == 1)
				oddSum += i;
				//System.out.println("i = " + i + ", oddSum = " + oddSum);
			} //if
		} //for
		
		System.out.println("Ȧ���� �� ������ = " + oddSum);
		
	} //main()
} //class
