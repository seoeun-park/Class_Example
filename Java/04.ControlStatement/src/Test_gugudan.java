public class Test_gugudan {
	// for, while, do-while�� �̿��Ͽ� �������� ����ϴ� ���α׷��� �ϼ��Ͻÿ�.
	public static void main(String[] args) {
		// �� for
		
		for(int i = 1; i <= 9; i++) {
			for (int j = 2; j <= 9; j++) {
				if(i * j < 10) {
					System.out.print(j + " x " + i + " = 0" + (i * j) + "\t");
				} else {
					System.out.print(j + " x " + i + " = " + (i * j) + "\t");
				}
			}//for j
			System.out.println();
		}//for i
		
		System.out.println("==================================");
		
		// �� while
		
		int i = 1;
		
		while(i <= 9) {
			int j = 2;
			while(j <= 9) {
				if(i * j < 10) {
					System.out.print(j + " x " + i + " = 0" + (i * j) + "\t");
				} else {
					System.out.print(j + " x " + i + " = " + (i * j) + "\t");
				}
				j++;
			}
			System.out.println();
			
			i++;
		}
		
		System.out.println("==================================");
		
		// �� do-while
		
		i = 1;
		
		do {
			// �ٱ��� do-while���� ���๮ ó��
			int j = 2;
			do {
				if(i * j < 10) {
					System.out.print(j + " x " + i + " = 0" + (j * i) + "\t");					
				} else {
					System.out.print(j + " x " + i + " = " + (j * i) + "\t");					
				}//if
				j++;
			} while(j <= 9);
			System.out.println();
			// �ٱ��� do-while���� ���๮ ��
			
			i++;	// �ٱ��� do-while���� ������
		} while(i <= 9);

		
	}//main()
}//class
