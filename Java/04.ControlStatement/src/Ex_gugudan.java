public class Ex_gugudan {
	public static void main(String[] args) {
		// �������� ���η� ���
		
		for (int i = 2; i <= 9; i++) {
			for (int j = 1; j <= 9; j++) {
				if (i * j < 10) {
					System.out.print(i + " x " + j + " = 0" + (i * j) + "\t");
				} else {
					System.out.print(i + " x " + j + " = " + (i * j) + "\t");
				}
			}//for j
			System.out.println();
		} //for i
		
		System.out.println("========================");
		
		// �������� ���η� ���
		
		for (int i = 1; i <= 9; i++) {
			for (int j = 2; j <= 9; j++) {
				if (i * j < 10) {
					System.out.print(j + " x " + i + " = 0" + (i * j) + "\t");
				} else {
					System.out.print(j + " x " + i + " = " + (i * j) + "\t");
				}
			}
			System.out.println();
		}
		
	} //main()
} //class
