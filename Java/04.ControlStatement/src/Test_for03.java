public class Test_for03 {
	// 1���� 100������ ���� �߿��� 3�� ����� ����Ͻÿ�.
	// ��, �� �ٿ� 5���� ���� ����Ͻÿ�
	public static void main(String[] args) {
		
		//  3  6  9 12 15 18 21 24 27 30
		// 33 36 39 42 45 48 51 54 57 60
		// ...
		
		int count = 0;		// ���Ƚ���� ������ ����(count)�� �ʱ�ȭ
		
		for (int i = 1; i <= 100; i++) {
			if (i % 3 == 0) {
				if (i < 10) {
					System.out.print("0" + i + "\t");
				} else {
					System.out.print(i + "\t");					
				}
				
				count++;	// count ���� 1�� ����
				if (count % 5 == 0) {
					System.out.print("\n");
				}//if
			} //if
		} //for
		
		/*
		for (int i = 1; i <= 100; i++) {
			if (i % 3 == 0) {
				System.out.print(i + "\t");
				if (i % 15 == 0) {
					System.out.print("\n");
				}
			}
		}
		*/
			
		
	} //main()
} //class
