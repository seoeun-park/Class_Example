import java.util.Scanner;

public class SubMenu {
	private Scanner scanner;

	public SubMenu(Scanner scanner) {
		this.scanner = scanner;
	}

	public void playGame(Character character) {
		Scanner scanner = new Scanner(System.in);
		while(true) {
			System.out.println("\n무엇을 할까요?");
			System.out.print("1.먹이주기\t2.잠재우기\t3.놀아주기\t");
			System.out.print("4.운동시키기\t5.종료하기 ▶  ");
			int input = Integer.parseInt(scanner.nextLine());
			
			if (input == 1) {
				character.eat();
			} else if (input == 2) {
				character.sleep();
			} else if (input == 3) {
				character.play();
				if (!character.checkEnergy()) {		//! : 부정(true → false, false → true)
					System.out.println("에너지가 부족해서 캐릭터가 사망했습니다!");
					break;
				}
			} else if (input == 4) {
				character.train();
				if (!character.checkEnergy()) {		//! : 부정(true → false, false → true)
					System.out.println("에너지가 부족해서 캐릭터가 사망했습니다!");
					break;
				}
			} else if(input == 5) {
				System.out.println("게임을 종료합니다.");
				break;
			} else {
				System.err.println("잘못 입력하셨습니다!");
				continue;
			}
			
			character.printInfo();
			
		}//while
		
		scanner.close();
		
	}//playGame()

}//class
