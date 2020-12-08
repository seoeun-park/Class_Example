
import java.util.Random;
import java.util.Scanner;

public class DiceGame02_solution {

	public static void main(String[] args) {

		Random random = new Random();
		Scanner scanner = new Scanner(System.in);

		START:	// 게임을 계속 하기위한 반복문 START라는 LABEL 지정

			while (true) { 
				System.out.println("게임시작 : 1");
				System.out.println("사용자가 안지는 게임 : 2");
				System.out.println("사용자가 확률로 이기는 게임 : 3");
				System.out.println("게임종료 : 4\n");
				System.out.print("원하시는 게임 숫자를 입력하세요 :  ");

				int userInput = Integer.parseInt(scanner.nextLine()); // 게임을 정하는 숫자
				int comNum = random.nextInt(6) + 1; 	// 컴퓨터 숫자 랜덤 1~6
				int userNum = random.nextInt(6) + 1; 	// 사용자 숫자 랜덤 1~6

				if (userInput == 4) { // 게임종료
					System.out.println("게임을 종료합니다.");
					break;

				} else if (userInput == 1) { // 정상적인 게임

					System.out.println("\n주사위 게임을 시작합니다.\n");
					System.out.println("사용자가 주사위를 굴립니다.");
					System.out.print("주사위를 던질려면 Enter키를 누르세요");
					scanner.nextLine();

					System.out.println("★사용자 주사위 값 : " + userNum);
					System.out.println("\n컴퓨터가 주사위를 굴립니다.");
					System.out.print("주사위를 던질려면 Enter키를 누르세요");
					scanner.nextLine();

					System.out.println("☆컴퓨터 주사위 값 : " + comNum);

					if (userNum > comNum) { // 값 비교하여 승부결과 출력
						System.out.println("\n사용자가 이겼습니다\n");
					} else if (userNum == comNum) {
						System.out.println("\n비겼습니다\n");
					} else {
						System.out.println("\n컴퓨터가 이겼습니다\n");
					}//if

					System.out.println("------------------------------------------");

					continue; // 게임이 끝나서 반복문 처음으로 돌아감

				} else if (userInput == 2) { // 사용자가 무조건 안지는 게임
					System.out.println("\n주사위 게임을 시작합니다.\n");
					System.out.println("사용자가 주사위를 굴립니다.");
					System.out.print("주사위를 던질려면 Enter키를 누르세요");
					scanner.nextLine();

					while (true) {
						if (comNum <= userNum) { // 사용자 숫자가 컴퓨터 숫자보다 같거나 높으면 값 반복문 탈출
							break;
						} else { // 사용자 숫자가 컴퓨터 숫자와 같거나 높을때까지 사용자 숫자 재할당
							
							// ○ 사용자 숫자, 컴퓨터 숫자 둘다 재할당해도되고 둘중 하나만 재할당해도됨
							userNum = random.nextInt(6) + 1;
							// comNum = random.nextInt(6) + 1;

							continue; // 게임이 끝나서 반복문 처음으로 돌아감
						}//if
					}//while

					System.out.println("★사용자 주사위 값 : " + userNum);
					System.out.println("\n컴퓨터가 주사위를 굴립니다.");
					System.out.print("주사위를 던질려면 Enter키를 누르세요");
					scanner.nextLine();

					System.out.println("☆컴퓨터 주사위 값 : " + comNum);

					if (userNum > comNum) { // 값 비교하여 승부결과 출력
						System.out.println("\n사용자가 이겼습니다\n");
					} 
					/*
					 * 사실상 절대 안지니깐 밑에 "컴퓨터가 이겼습니다"까지 다지우고 이렇게 수정가능함 else{
					 * System.out.println("\n비겼습니다\n"); }
					 */

					else if (userNum == comNum) {
						System.out.println("\n비겼습니다\n");
					} else {
						System.out.println("\n컴퓨터가 이겼습니다\n");
					}//if

					System.out.println("------------------------------------------");
					continue;

				} else if (userInput == 3) { // 사용자가 퍼센트로 이기는 게임
					int winPct; // 확률을 위한 변수

					while (true) { // 0부터 100까지의 확률중 원하는 확률을 입력
						System.out.print("확률을 입력해주세요 : ");
						winPct = Integer.parseInt(scanner.nextLine());
						
						if (winPct < 0 || winPct > 100) { // 나올수 없는 확률 방지
							System.out.println("확률을 잘못 입력하셨습니다");
							continue;
						}
						break;
					}//while

					while (true) {
						int pct = random.nextInt(100) + 1; // 1~100 까지 중 랜덤하게 하나의 값 생성

						System.out.println("\n주사위 게임을 시작합니다.\n");
						System.out.println("사용자가 주사위를 굴립니다.");
						System.out.print("주사위를 던질려면 Enter키를 누르세요");
						scanner.nextLine();

						if (pct <= winPct) { // 입력한 확률 숫자보다 랜덤으로 생성된 숫자가 작거나 같으면 게임 승리
							while (true) { // 사용자숫자가 컴퓨터 숫자보다 낮거나 같으면 무조건
								
								// 사용자 숫자가 컴퓨터 숫자보다 높을때까지 사용자 숫자 재할당
								if (comNum < userNum) {
									break;
								} else {
								/*
								* ○ 위 안지는 게임과 다르게 여기선 둘다 재할당 해야함 
								* 	- 컴퓨터 숫자만 재할당 할 경우 : 사용자 숫자가 1일 경우 컴퓨터 숫자가 더 낮은
								* 수가 나올수 없어서 무한루프 
								* 	- 사용자 숫자만 재할당 할 경우 : 컴퓨터 숫자가 6일 경우 사용자 숫자가 더 큰 수가 나올수 없어서 무한루프
								*/
									userNum = random.nextInt(6) + 1;
									comNum = random.nextInt(6) + 1;
									continue;
								}
							}
						} else { // 입력한 확률 숫자보다 랜덤으로 생성된 숫자가 높으면 게임은 무승부 또는 패배
							while (true) {
								if (comNum >= userNum) { // 컴퓨터 숫자가 사용자 숫자보다 같거나 높으면
									// 값 반복문 탈출
									break;
								} else {
									// ○ 사용자 숫자, 컴퓨터 숫자 둘다 재할당해도되고 둘중 하나만 재할당해도됨
									comNum = random.nextInt(6) + 1;
									// userNum = random.nextInt(6) + 1;

									continue;
								}//if
							}//while
						}//if

						System.out.println("★사용자 주사위 값 : " + userNum);
						System.out.println("\n컴퓨터가 주사위를 굴립니다.");
						System.out.print("주사위를 던질려면 Enter키를 누르세요");
						scanner.nextLine();

						System.out.println("☆컴퓨터 주사위 값 : " + comNum);

						if (userNum > comNum) {
							System.out.println("\n사용자가 이겼습니다\n");
						} else if (userNum == comNum) {
							System.out.println("\n비겼습니다\n");
						} else {
							System.out.println("\n컴퓨터가 이겼습니다\n");
						}//if

						System.out.println("------------------------------------------");

						System.out.println("사용자가 확률로 이기는 게임");

						System.out.println("계속 : 1 확률 변경 : 2  종료 : 3");

						while (true) { // 확률로 이기는 게임 1과 2 값 이외는 다시 숫자 입력 받음
							userInput = Integer.parseInt(scanner.nextLine());

							if (userInput == 3) {
								continue START; // 게임을 정하는 화면 (LABEL명 START로 지정된)
								// 반복문으로 다시 돌아감
							} else if (userInput == 1) { // 주사위 값 재 할당하고 지금 반복문만 탈출하여 게임을 다시 반복
								userNum = random.nextInt(6) + 1; // 게임을 다시하기위해 주사위 값 재 할당
								comNum = random.nextInt(6) + 1;

								break;
							} else if (userInput == 2) { // 확률 값을 새로 입력하고 지금 반복문만 탈출하여 게임을 다시 반복
								System.out.print("확률을 입력해주세요 : ");
								winPct = Integer.parseInt(scanner.nextLine()); // 확률 값 새로 입력 받음
								userNum = random.nextInt(6) + 1; // 게임을 다시하기위해 주사위 값 재할당함
								comNum = random.nextInt(6) + 1;

								break;

							} else { // 숫자 범위 값 이외에 입력받아서 다시 입력을 요구함
								System.out.println("숫자를 잘못 입력하셨습니다!");
								continue;
							}//if
						}//while
						continue; // 게임이 끝나서 확률로 이기는 게임 반복문 처음으로 돌아감
					}//while

				} else { // 처음 게임 정하는 숫자 1~4 이 외의 다른 숫자를 입력시 다시 처음으로 돌아감

					System.out.println("숫자를 잘못 입력하셨습니다!");
					continue;
				}//if
			}//while

		scanner.close();

	}//main()

}//class