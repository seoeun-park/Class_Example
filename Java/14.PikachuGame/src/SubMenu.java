import java.util.Scanner;

public class SubMenu {
	private Scanner scanner;

	public SubMenu(Scanner scanner) {
		this.scanner = scanner;
	}

	public void playGame(Character character) {
		Scanner scanner = new Scanner(System.in);
		while(true) {
			System.out.println("\n������ �ұ��?");
			System.out.print("1.�����ֱ�\t2.������\t3.����ֱ�\t");
			System.out.print("4.���Ű��\t5.�����ϱ� ��  ");
			int input = Integer.parseInt(scanner.nextLine());
			
			if (input == 1) {
				character.eat();
			} else if (input == 2) {
				character.sleep();
			} else if (input == 3) {
				character.play();
				if (!character.checkEnergy()) {		//! : ����(true �� false, false �� true)
					System.out.println("�������� �����ؼ� ĳ���Ͱ� ����߽��ϴ�!");
					break;
				}
			} else if (input == 4) {
				character.train();
				if (!character.checkEnergy()) {		//! : ����(true �� false, false �� true)
					System.out.println("�������� �����ؼ� ĳ���Ͱ� ����߽��ϴ�!");
					break;
				}
			} else if(input == 5) {
				System.out.println("������ �����մϴ�.");
				break;
			} else {
				System.err.println("�߸� �Է��ϼ̽��ϴ�!");
				continue;
			}
			
			character.printInfo();
			
		}//while
		
		scanner.close();
		
	}//playGame()

}//class
