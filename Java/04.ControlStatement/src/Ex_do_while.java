public class Ex_do_while {
	public static void main(String[] args) {
		/*
		 ○ do-while : 선처리 → 후조건
		 	※ 조건이 처음부터 거짓이더라도 실행문은 최소 1번은 실행된다.
		 	
		 초기값;
		 
		 do {
		 	실행문;
		 	증감값;
		 } while(조건식);
		 
		 */
		
		// 1부터 10까지의 누적합(doWhileSum)을 구하시오 : do-while
		int doWhileSum = 0;
		int	i = 0;
		
		do {
			doWhileSum += i;
			i++;
		} while(i <= 10);
		
		System.out.println("do-while의 누적합 : " + doWhileSum);
	} //main()
} //class
