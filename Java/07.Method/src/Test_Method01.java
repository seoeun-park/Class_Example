public class Test_Method01 {
	public static void main(String[] args) {
		/*	   
 		// 1���� 50������ ���� ��(sum)�� ���Ͻÿ�. : a ~ b������ ���� ���Ͻÿ�
		int a = 1, b = 50;
		int sum = 0;
		
		for (int i = a; i <= b; i++) {
			sum += i;
		}
		
		System.out.println(a + "���� " + b + "������ ������ : "  + sum);
		
		// 51���� 100������ ������(sum) : c ~ d������ ���� ���Ͻÿ�.
		int c = 51, d = 100;
		sum = 0;
		
		for (int i = c; i <= d; i++) {
			sum += i;
		}
		
		System.out.println(c + "���� " + d + "������ ������ : "  + sum);
		*/
		
		int a = 1, b = 50, c = 51, d = 100;		//�Ű����� ���� �ʱ�ȭ
		getSum(a, b);			// 1~50 �������� ���ϴ� �޼ҵ�(getSum())�� ȣ��  ��  ���μ�
		getSum(c, d);			// 51~100 �������� ���ϴ� �޼ҵ�(getSum())�� ȣ��  ��  ���μ�
		getSum(a, d);			// 1~100 �������� ���ϴ� �޼ҵ�(getSum())�� ȣ��  ��  ���μ�
		getSum(30, 50);
	}//main()
	
	// �� ���� ������ ���޹޾� ���� ��(sum)�� ���ϰ� ����ϴ� �޼ҵ�(getSum())�� ����
	public static void getSum(int x, int y) {			//getSum() �޼ҵ带 ����  ��  ���μ�
		int sum = 0;
		for(int i = x; i <= y; i++) {
			sum += i;
		}
		System.out.println(x + "���� " + y + "������ ������ : " + sum);
	}//getSum()
}//class
