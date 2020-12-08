import java.util.Random;
import java.util.Scanner;

public class DiceGame01 {
	public static void main(String[] args) {
		// DiceGame : 주사위 게임 ▶ 사용자가 무조건 이기는 게임
		
		// 사용자의 숫자가 6이 나왔을 경우, 컴퓨터의 숫자는 1부터 5까지 나오면 됨
		// 사용자의 숫자가 5이 나왔을 경우, 컴퓨터의 숫자는 1부터 4까지 나오면 됨
		// 사용자의 숫자가 4이 나왔을 경우, 컴퓨터의 숫자는 1부터 3까지 나오면 됨
		//...
		
		// 게임시작 : Y, 게임종료 : N ▶ 
		
		// 잘못 입력하셨습니다!
		// 게임시작 : Y, 게임종료 : N ▶ N
		// 게임을 종료합니다.
		
		// 게임시작 : Y, 게임종료 : N ▶ Y
		// 사용자가 주사위를 굴립니다. Enter Key를 입력하세요!
		// 컴퓨터가 주사위를 굴립니다. Enter Key를 입력하세요!
		
		// 사용자의 숫자 : X
		// 컴퓨터의 숫자 : X
		// 게임 결과 : You Win! // Draw
		
		Scanner scanner = new Scanner(System.in);
		Random random = new Random();
		
		while(true) {
			System.out.print("게임시작 : Y, 게임종료 : N  ▶ ");
			char userInput = scanner.next().charAt(0);
			
			if(userInput != 'N' && userInput != 'n' && 
				userInput != 'Y' && userInput != 'y') {
				System.out.println("숫자를 잘못 입력하셨습니다!");
				continue;
			}
			
			if(userInput == 'N' || userInput == 'n') {
				System.out.println("게임을 종료합니다.");
				break;
			}
			
			System.out.print("사용자가 주사위를 굴립니다. ");
			System.out.println("Enter Key를 입력하세요!");
			scanner.nextLine();
			int userNumber = random.nextInt(6) + 1;
			System.out.println("사용자의 숫자는 " + userNumber + "입니다.\n");
			
			System.out.print("컴퓨터가 주사위를 굴립니다. ");
			System.out.println("Enter Key를 입력하세요!");
			scanner.nextLine();
			int comNumber = 0;
			
			if (userNumber == 1) {
				comNumber = 1;
			} else {
				comNumber = random.nextInt(userNumber - 1) + 1;				
				// 6이 나왔을 경우, (0 ~ 5) + 1 = 1 ~ 5
			}
			System.out.println("컴퓨터의 숫자는 " + comNumber + "입니다.\n");
			
			// int comNumber = random.nextInt(userNumber - 1) + 1;
			// 이렇게 작성하면 userNumber가 1일때 nextInt안의 숫자는 0이 나오므로 컴파일 오류!
			// nextInt안의 숫자는 1이상의 숫자, 양수만 나와야 한다.
			// 조건식을 이용해서 작성해야 한다!(이때 comNumber는 조건식 밖에서 전역변수로 선언해야 한다.)
			
			if (comNumber < userNumber) {
				System.out.println("You Win!\n");
			} else {
				System.out.println("Draw!\n");
			}
			System.out.println("============");	
		}//while
		scanner.close();
		// 배열의 선언 : int[] arr;
		// 배열의 생성 : arr = new int[10];
		// 배열의 선언과 생성 : int[] arr = new int[10];
		// 배열은 사용자 정의 자료형이자 참조형 변수이고 사용자 정의 자료형 중에 배열 타입이다.
		// 배열의 인덱스는 0부터 시작하며 마지막 인덱스는 (배열의 크기 -1)이다.
		// 배열의 크기는 배열 생성 시에 결정되며, 나중에 바꿀 수 없다.
	}//main()
}//class
