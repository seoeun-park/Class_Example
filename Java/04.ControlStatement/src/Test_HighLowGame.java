import java.util.Random;
import java.util.Scanner;

public class Test_HighLowGame {
	public static void main(String[] args) {
		// HighLowGame : 숫자 맞추기 게임
		// 1 ~ 100 사이의 임의의 정수값을 comNumber에 할당 : 70
		
		// 메시지 : 1부터 100사이의 정수값을 입력하세요 : 50
		// 더 큰 수를 입력하세요!
		
		// 메시지 : 1부터 100사이의 정수값을 입력하세요 : 80
		// 더 작은 수를 입력하세요!
		
		// 메시지 : 1부터 100사이의 정수값을 입력하세요 : 70
		// 맞췄습니다!
		// 시도 횟수는 3번 입니다.
		
		// do-while(최소 한번은 실행해야 하기 때문에), scanner, random, if를 사용하시오.
		
		Random random = new Random();		// random 객체 생성
		int comNumber = random.nextInt(100) + 1;		// 1~100 사이의 임의의 정수 값을 할당
		// 이 문제에서 하나의 난수만 할당받으면 되기 때문에 do-while문 밖에서 난수를 생성해야 한다.
		
		// 사용자로부터 숫자를 입력받기 위한 준비  ▶ Scanner
		Scanner scanner = new Scanner(System.in);		// scanner 객체 생성
		int userNumber = 0;		// 사용자가 입력한 값을 저장할 변수를 초기화
		int count = 0;			// 시도 횟수를 저장할 변수를 초기화
		
		do {
			System.out.print("1부터 100사이의 정수값을 입력하세요  ▶   ");
			userNumber = Integer.parseInt(scanner.nextLine());
			
			if (userNumber < 1 || userNumber > 100) {
				System.out.println("숫자를 잘못 입력하셨습니다!");
				continue;
			}//if
			
			count++;
			
			if (comNumber > userNumber) {
				System.out.println("더 큰 수를 입력하세요!\n");
				continue;
			} else if (comNumber < userNumber) {
				System.out.println("더 작은 수를 입력하세요!\n");
			} else {
				System.out.println("맞췄습니다!\n");
				System.out.println("시도 횟수는 " + count + "입니다.");
				break;
			}
		} while(true);
		
		scanner.close();
		
	}//main()
}//class
