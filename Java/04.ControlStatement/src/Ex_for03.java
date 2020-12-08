public class Ex_for03 {
	public static void main(String[] args) {
		// 1부터 100까지의 정수 중에서 홀수의 합(oddSum)과 짝수의 합(evenSum)을 출력
		
		int oddSum = 0, evenSum = 0;
		
		for (int i = 1; i <= 100; i++) {
			if (i % 2 == 0) {
				evenSum += i;
			} else {
				oddSum += i;
			}
		} //for
		
		System.out.println("홀수의 합 : " + oddSum + 
				", 짝수의 합 : " + evenSum + 
				", 총합 : " + (oddSum + evenSum));
			
	} //main()
} //class
