public class Test_for03 {
	// 1부터 100까지의 정수 중에서 3의 배수를 출력하시오.
	// 단, 한 줄에 5개의 값을 출력하시오
	public static void main(String[] args) {
		
		//  3  6  9 12 15 18 21 24 27 30
		// 33 36 39 42 45 48 51 54 57 60
		// ...
		
		int count = 0;		// 출력횟수를 저장할 변수(count)를 초기화
		
		for (int i = 1; i <= 100; i++) {
			if (i % 3 == 0) {
				if (i < 10) {
					System.out.print("0" + i + "\t");
				} else {
					System.out.print(i + "\t");					
				}
				
				count++;	// count 값을 1씩 증가
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
