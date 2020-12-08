public class Ex_continue {
	// continue : 반복문에서 continue문 아래의 실행문은 실행하지 않고 
	// 제어권을 반복문의 첫머리로 이동하는 키워드
	public static void main(String[] args) {
		// 1부터 10까지 정수 중에서 홀수의 누적합(oddSum)을 구하시오 : for, if
		int oddSum = 0;
		for (int i = 1; i <= 10; i++) {
			if (i % 2 != 0) {
				oddSum += i;
			}
		}
		
		System.out.println("홀수의 누적합 : " + oddSum);
		
		// 1부터 10까지 정수 중에서 홀수의 누적합을(oddSum)을 구하시오 : for, if, continue
		oddSum = 0;
		
		for (int i = 1; i <= 10; i++) {
			if(i % 2 == 0) {			// 짝수이면
				continue;				// 반복문의 첫머리로 이동
			} else {
				oddSum += i;
			}
		}
		
		System.out.println("홀수의 누적합 : " + oddSum);
		
	} //main()
} //class
