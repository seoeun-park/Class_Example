import java.util.Random;
import java.util.Scanner;

public class DiceGame02 {
	public static void main(String[] args) {
		// 사용자가 일정 승률로 이기는 게임 : 3 게임 중 2 게임 승리
		// 1 게임 : You Win!
		// 2 게임: You Win!
		// 3 게임 : You Lose! or Draw!  
		//========================= 승률 : 67%
		// 4 게임 : You Win!
		// 5 게임 : You Lose! or Draw!
		// 6 게임 : You Win!
		//========================= 승률 : 67%
		// 7 게임 : You Lose! or Draw!
		// 8 게임 : You Win!
		// 9 게임 : You Win!
		// userNum : Random
		// comNum : Random
		// userNum과 comNum을 비교
		// winCnt++ loseCnt++ drawCnt++
		
		Random random = new Random();
		Scanner scanner = new Scanner(System.in);
		
		// 승패의 횟수를 저장하는 변수를 반복문 안에 작성할 경우 반복문이 돌아갈 때마다 
		// 변수가 0으로 초기화되므로 조건문이 제대로 작동되지 않기때문에 반복문 밖에서 작성해야한다.
		int winCnt = 0, loseCnt = 0, drawCnt = 0, totalCnt = 0;
		
		while(true) {
			System.out.print("게임시작 : Y, 게임종료 : N  ▶   ");
			char userInput = scanner.next().charAt(0);
			
			// 사용자가 잘못 입력했을 경우
			if (userInput != 'Y' && userInput != 'y' 
			&& userInput != 'N' && userInput != 'n') {
				System.out.println("잘못 입력하셨습니다.");
				continue;
			}
			
			// 사용자가 게임을 종류할 경우
			if (userInput == 'N' || userInput == 'n') {
				System.out.println("게임을 종료합니다.");
				break;
			}
			
			int userNumber = 0;
			int comNumber = 0;
			
			// 승률 조작 조건문
			if (winCnt == 0 && (loseCnt == 1 || drawCnt == 1)) {
				userNumber = random.nextInt(6) + 1;
				// 사용자가 무조건 이기는 게임
				if (userNumber == 1) {
					comNumber = 0;			//?
				} else {
					comNumber = random.nextInt(userNumber - 1) + 1;				
				}
				
			} else if ((winCnt == 1 && loseCnt == 1) || (winCnt == 1 && drawCnt == 1)) {
				userNumber = random.nextInt(6) + 1;
				// 사용자가 무조건 이기는 게임
				if (userNumber == 1) {
					comNumber = 0;			//?
				} else {
					comNumber = random.nextInt(userNumber - 1) + 1;
				}
				
			} else if (winCnt == 2) {
				// 사용자가 무조건 지는 게임
				int index = userNumber + 1;
				
				if (userNumber == 6) {
					comNumber = 7;			//?
				} else {
					comNumber = random.nextInt(6 - index + 1) + index;				
					// 변수명 = random.nextInt(max - min + 1 ) + min;
					// → 정해진 최소 ~ 최대의 범위안의 난수를 생성하는 공식
				}
				
			} else {
				userNumber = random.nextInt(6) + 1;
				comNumber = random.nextInt(6) + 1;
			}
			
			System.out.print("사용자가 주사위를 굴립니다  ▶   ");
			System.out.println("Enter Key를 입력하세요");
			scanner.nextLine();
			System.out.println("사용자의 숫자는 " + userNumber + "입니다.\n");
			
			System.out.print("컴퓨터가 주사위를 굴립니다  ▶ ");
			System.out.println("Enter Key를 입력하세요");
			scanner.nextLine();
			System.out.println("컴퓨터의 숫자는 " + comNumber + "입니다.\n");
			

			if (userNumber > comNumber) {
				System.out.println("You Win!\n");
				winCnt++;
				totalCnt++;
			} else if (userNumber < comNumber) {
				System.out.println("You Lose!\n");
				loseCnt++;
				totalCnt++;
			} else {
				System.out.println("Draw!\n");
				drawCnt++;
				totalCnt++;
			}
			
			// 승패의 횟수를 저장하는 변수 초기화
			if(totalCnt % 3 == 0) {
				winCnt = 0;
				loseCnt = 0;
				drawCnt = 0;
			}	
		}//while
		scanner.close();
	}//main()
}//class
