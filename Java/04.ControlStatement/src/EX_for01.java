public class EX_for01 {
	public static void main(String[] args) {
		// 0���� 10���� ����Ͻÿ�.
		// System.out.println(0);
		// System.out.println(1);
		// System.out.println(2);
		//...
		// System.out.println(10);
		
		/*
		 �� �ݺ���(��ȯ��, Loop��) : for, while, do-while
		 
		 for(�ʱ갪(���۰�); ���ǽ�(������); �ݺ��� �۾�(������)) {
		 	���๮(�ݺ��� ����);
		 }
		 
		 */
		
		// "�ݺ����� �̿��Ͽ�" 0���� 10���� ����Ͻÿ�.(0���� 10���� 1�� ����(�ݺ�))
		for (int i = 0; i <= 10; i++) {
			System.out.println(i);			// i���� ���
		} //for
		
		System.out.println("---------------------------------");
		
		// "�ݺ����� �̿��Ͽ�" 10���� 0���� ����Ͻÿ�(10���� 0���� 1�� ����(�ݺ�)).
		for (int i = 10; i >= 0; i--) {
			System.out.println(i);			// i���� ���
		} //for
		
		// �� ���⼭ i��� ������ for�� ���ǹ� �ȿ� ����Ǿ� �����Ƿ� for ��� �������� ��ȿ�ϴ� ���������̴�.
		;
		System.out.println("---------------------------------");
		
		// 0���� 10������ ���� �߿��� ¦���� ����Ͻÿ� : for(�ݺ�)
		for (int i = 0; i <= 10; i+=2) {	// i = i + 2;
			System.out.println(i);
		} //for
		
		System.out.println("---------------------------------");
		
		// 0���� 10������ ���� �߿��� ¦���� ����Ͻÿ� : for(�ݺ�), if(�����Ǵ�)
		for (int i = 0; i <= 10; i++) {
			if (i % 2 == 0) {
				System.out.println(i);		// i���� ���
			} //if
		} //for
		
		System.out.println("---------------------------------");
		
		for (int i = 0; i <= 10 && i % 2 == 0; i++) {
			System.out.println(i);
		}
	
	} //main()
} //class
