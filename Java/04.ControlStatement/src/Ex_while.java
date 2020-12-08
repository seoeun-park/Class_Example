public class Ex_while {
	public static void main(String[] args) {
		/*
		   ★  while : 반복횟수를 모를 경우 사용(선조건 → 후처리)
		   
		   초기값;
		   
		 while (조건식) {
		   	조건식이 참일 때 실행되는 문장(실행문);
		   	증감값;
		 }
		 		 
		*/
		
		// 1부터 10까지의 누적합(forSum)을 구하시오 : for
		
		int forSum = 0;
		for (int i = 1; i <= 10; i++) {
			forSum += i;
		}
		System.out.println("for 누적합 : " + forSum);
		
		// 1부터 10까지의 누적합(whileSum)을 구하시오 : while
		
		int whileSum = 0;
		int i = 1;
		while(i <= 10) {
			whileSum += i;
			i++;
		}
		System.out.println("while 누적합 : " + whileSum);
	
	} //main()
} //class
