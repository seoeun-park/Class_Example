public class Ex_for_for {
	public static void main(String[] args) {
		for (int i = 1; i <= 5; i++) {			// for i : 1q���� 5���� �ݺ�
			for (int j = 1; j <= i; j++) {		// for j : 1���� i���� �ݺ�
				System.out.println("i�� : " + i + ", j�� : " + j);
				
			} //for j
		} //for i
		
		System.out.println("===============");
		
		for (int i = 1; i <= 5; i++) {
			for (int j = 1; j <= i; j++) {
				System.out.print("��");
			} //for j
			System.out.println();
		} //for i
				
	} //main()
} //class
