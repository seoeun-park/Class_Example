import java.util.Scanner;

public class GameMain {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.println("원하는 캐릭터를 선택하세요!");
		System.out.print("1. 피카츄\t2.이상해씨\t3.꼬부기  ▶ ");
		int input = Integer.parseInt(scanner.nextLine());
		
		Character character = null;
		SubMenu sm = new SubMenu(scanner);
		
		if (input == 1) {
			//Character character = new Pikachu();
			character = new Pikachu();
			sm.playGame(character);
		} else if (input == 2) {
			//Character character = new Lee();
			character = new Lee();
			sm.playGame(character);
		} else if(input == 3) {
			//Character character = new Gobook();
			character = new Gobook();
			sm.playGame(character);
		} else {
			System.out.println("\n잘못 선택하셨습니다.");
		}
	}//main()
}//class
