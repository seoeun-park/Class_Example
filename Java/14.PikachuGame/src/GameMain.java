import java.util.Scanner;

public class GameMain {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.println("���ϴ� ĳ���͸� �����ϼ���!");
		System.out.print("1. ��ī��\t2.�̻��ؾ�\t3.���α�  �� ");
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
			System.out.println("\n�߸� �����ϼ̽��ϴ�.");
		}
	}//main()
}//class
