import java.util.Random;
import java.util.Scanner;

public class Test_DiceGame {
	public static void main(String[] args) {
		// DiceGame : 주사위 게임
		
		// 게임시작 : 1, 게임종료 : -1을 입력  ▶  X
		// 1 또는 -1 이외의 숫자가 입력되면 오류메세지를 출력하고 재입력
		// -1이 입력되면 게임을 종료
		
		// 1이 입력되면 게임을 시작
		// 사용자가 주사위를 굴립니다.
		// Enter Key를 입력하세요 ▶
		// userNumber : 1 ~ 6 사이의 정수 중에서 무작위로 숫자를 할당 
		// 난수(0부터 1까지의 수)를 발생시키는 방법 2가지 ▶ 
		// math 클래스의 random() 메서드 / random 클래스
		
		// 컴퓨터가 주사위를 굴립니다.
		// Enter Key를 입력하세요 ▶
		// countNumber : 1 ~ 6사이의 정수 중에서 무작위로 숫자를 할당
		
		// 사용자의 숫자 : X
		// 컴퓨터의 숫자 : X
		
		// You Win!
		// You Lose!
		// Draw!
		
		Scanner scanner = new Scanner(System.in);	// 입력을 받기 위한 객체 생성
		
		// 사용자의 숫자를 무작위로 할당(random 클래스)
		// while 문 안에 작성하면 while문이 실행될 때마다 난수가 발생하므로 while문 밖에 작성해야한다.
		Random random = new Random();		// 무작위로 숫자를 할당하기 위한 객체 생성
		
		while (true) {
			System.out.print("게임 시작 : 1, 게임 종료 : -1을 입력하세요 ▶ ");
			// int userInput = scanner.nextInt();
			int userInput = Integer.parseInt(scanner.nextLine());
			
			// 1 또는 -1 이외의 숫자가 입력되면 오류메세지를 출력하고 재입력
			// ||로 결합할 경우, -1일 때 false || true이므로 true가 되므로 "숫자를 잘못 입력하셨습니다!"라는 메시지가 뜬다.
			if (userInput != 1 && userInput != -1) {
				System.out.println("숫자를 잘못 입력하셨습니다!");
				continue;
			}//if
			
			// -1이 입력되면 게임을 종료 : while문을 탈출 ▶ break
			if (userInput == -1) {
				System.out.println("게임을 종료합니다.");
				break;
			}//if
			
			// 사용자의 숫자를 무작위로 할당
			System.out.println("사용자가 주사위를 굴립니다.");
			System.out.println("Enter Key를 입력하세요  ▶  ");
			scanner.nextLine();		// 블럭킹 메서드 : 사용자로부터 입력을 대기하고, 입력이 되면 입력값을 처리
			// 0부터 6미만의 난수에 1를 더함
			int userNumber = random.nextInt(6) + 1;
			System.out.println("사용자의 숫자는 " + userNumber + "입니다.\n");
			
			// 컴퓨터의 숫자를 무작위로 할당
			System.out.println("컴퓨터가 주사위를 굴립니다.");
			System.out.println("Enter Key를 입력하세요  ▶  ");
			scanner.nextLine();		// 블럭킹 메서드
			int comNumber = random.nextInt(6) + 1;
			System.out.println("컴퓨터의 숫자는 " + comNumber + "입니다.\n");
			
			// userNumber 값과 comNumber 값을 비교해서 결과를 출력			
			if (userNumber > comNumber) {
				System.out.println("You Win!\n");
			} else if(userNumber < comNumber) {
				System.out.println("You Lose!\n");
			} else {
				System.out.println("Draw!\n");
			}//if
			System.out.println("===============");
		} //while
		scanner.close();
	}//main()
}//class
