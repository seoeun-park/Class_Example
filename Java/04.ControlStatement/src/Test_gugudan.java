public class Test_gugudan {
	// for, while, do-while을 이용하여 구구단을 출력하는 프로그램을 완성하시오.
	public static void main(String[] args) {
		// ① for
		
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
		
		// ② while
		
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
		
		// ③ do-while
		
		i = 1;
		
		do {
			// 바깥쪽 do-while문의 실행문 처음
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
			// 바깥쪽 do-while문의 실행문 끝
			
			i++;	// 바깥쪽 do-while문의 증감값
		} while(i <= 9);

		
	}//main()
}//class
