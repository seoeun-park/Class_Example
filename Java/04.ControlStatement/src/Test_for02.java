public class Test_for02 {
	public static void main(String[] args) {
		// 1부터 100까지의 정수 중에서 홀수의 누적합(oddSum)을 구하여 출력하시오. : for, if
		int oddSum = 0;
		
		for (int i = 1; i <= 100; i++) {		// 1부터 100까지 1씩 증가
			if (i % 2 != 0) {					// 홀수이면(i % 2 == 1)
				oddSum += i;
				//System.out.println("i = " + i + ", oddSum = " + oddSum);
			} //if
		} //for
		
		System.out.println("홀수의 총 누적합 = " + oddSum);
		
	} //main()
} //class
