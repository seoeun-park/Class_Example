import java.util.Scanner;

public class Test_scanner_sungjuk {
	public static void main(String[] args) {
		// 점수 범위 : 0 ~ 100
		// 국어 점수(변수 이름 : kor)를 입력하세요 : XX
		// 국어 점수를 잘못 입력하셨습니다!
		// 국어 점수를 입력하세요 : XX
		
		// 영어 점수(변수 이름 : eng)를 입력하세요 : XX
		// 영어 점수를 잘못 입력하셨습니다!
		// 영어 점수를 입력하세요 : XX
		
		// 수학 점수(변수 이름 : mat)를 입력하세요 : XX
		// 수학 점수를 잘못 입력하셨습니다!
		// 수학 점수를 입력하세요 : XX
		
		// 국어 점수 : XX
		// 영어 점수 : XX
		// 수학 점수 : XX
		// 총점 : XXX
		// 평균 점수 : XX.XX
		
		//=======================
		// Scanner, while, if, break, continue를 이용해서 작성하시오.
		
		Scanner scanner = new Scanner(System.in);
		// while 구문 밖에서도 변수를 활용해야하므로 전역변수로 선언해야 한다.
		int kor = 0, eng = 0, mat = 0;
		
		while(true) {
			System.out.print("국어 점수를 입력하세요 : ");
			kor = Integer.parseInt(scanner.nextLine());
				
				if (kor >= 0 && kor <= 100) {
					break;
				} else {
					System.out.println("국어 점수를 잘못 입력하셨습니다!");
					continue;
				}
			}//while1
			
			while(true) {
				System.out.print("영어 점수를 입력하세요 : ");
				eng = Integer.parseInt(scanner.nextLine());
				
				if (eng < 0 || eng > 100) {
					System.out.println("영어 점수를 잘못 입력하셨습니다!");
					continue;
				} else {
					break;
				}
			}//while2
			
			while(true) {
				System.out.print("수학 점수를 입력하세요 : ");
				mat = Integer.parseInt(scanner.nextLine());
				
				// 가장 간편한 방법
				if (mat < 0 || mat > 100) {
					System.out.println("수학 점수를 잘못 입력하셨습니다!");
					continue;
				}//if
				break;
			}//while3
			
			scanner.close();
			
			System.out.println("국어 점수 : " + kor);
			System.out.println("영어 점수 : " + eng);
			System.out.println("수학 점수 : " + mat);
			System.out.println("총점 : " + (kor + eng + mat));
			System.out.println("평균 점수 : " + (double)(kor + eng + mat) / 3);

	}//main()
}//class
