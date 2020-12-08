public class Test_while {
	public static void main(String[] args) {
		// 1부터 100까지의 정수 중에서 짝수의 합(evenSum)을 구하시오 : while, if
		int evenSum = 0;		// 짝수의 합이 저장될 변수를 초기화
		int i = 1;				// 초기값
		
		while(i <= 100) {		// 조건식(최종값)
			if (i % 2 == 0) {	// 짝수이면
				evenSum += i;	// 누적합 계산
			} //if
			i++;				// 증감값
		} //while
		
		System.out.println("짝수의 합 : " + evenSum);
		
	} //main()
} //class
