public class Ex_for03 {
	public static void main(String[] args) {
		// 1���� 100������ ���� �߿��� Ȧ���� ��(oddSum)�� ¦���� ��(evenSum)�� ���
		
		int oddSum = 0, evenSum = 0;
		
		for (int i = 1; i <= 100; i++) {
			if (i % 2 == 0) {
				evenSum += i;
			} else {
				oddSum += i;
			}
		} //for
		
		System.out.println("Ȧ���� �� : " + oddSum + 
				", ¦���� �� : " + evenSum + 
				", ���� : " + (oddSum + evenSum));
			
	} //main()
} //class
