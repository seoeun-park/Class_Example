public class Ex_for02 {
	public static void main(String[] args) {
		// 1���� 10������ ������(sum)�� ���Ͻÿ�.
		
		int sum = 0;		// ������(���)�� ����� ����
							// for���� �ٱ������� Ȱ���� �����̱� ������ ���� ������ ����
		
		for (int i = 0; i <= 10; i++) {		// 1���� 10���� 1�� ����
			sum += i;		// sum = sum + i;
			System.out.println("i = " + i + ", sum = " + sum);
		} //for
		
		System.out.println("�� ������ = " + sum);
		
	} //main()
} //class
