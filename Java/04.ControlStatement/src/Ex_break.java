public class Ex_break {
	// break : 반복문을 탈출하는 명령어
	public static void main(String[] args) {
		int i = 1;
		
		while(true) {		// 무한루프
			if (i == 10) {
				System.out.println("i의 값이 10이므로 반복문을 종료합니다.");
				break;
			}//if
			System.out.println("i의 값 : " + i);
			i++;
		}//while
	} //main()
} //class
