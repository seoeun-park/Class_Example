import java.util.Scanner;

import com.hanul.member.MenuInput;

public class MemberMain {
	public static void menuPrint() {
		System.out.println("====ȸ������====");
		System.out.println("ȸ������ �Է� : I");
		System.out.println("��üȸ�� �˻� : S");
		System.out.println("ȸ������ ���� : D");
		System.out.println("ȸ������ ���� : U");
		
		System.out.println("ȸ���̸� �˻� : N");
		System.out.println("ȸ���ּ� �˻� : A");
		System.out.println("ȸ������ ���� : E");
		System.out.println("=================\n");
	}//menuPrint()
	
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		MenuInput input = new MenuInput(scanner);
		
		while (true) {
			menuPrint();
			System.out.print("�޴��� �Է��ϼ��� : ");
			String menu = scanner.nextLine();
			if (menu.equalsIgnoreCase("i")) {
				//System.out.println("�ű� ȸ�� ���ȭ��");
				input.insertInput();		//ȸ�������� ����ϴ� ����ȭ�� ȣ��
				continue;
			} else if(menu.equalsIgnoreCase("s")) {
				input.getAllList();			//��ü ȸ���� �˻��ϴ� ����ȭ�� ȣ��
				continue;
			} else if(menu.equalsIgnoreCase("d")) {
				input.deleteInput();		//ȸ�������� �����ϴ� ����ȭ�� ȣ��
			} else if(menu.equalsIgnoreCase("u")) {
				input.updateInput();		//ȸ�������� �����ϴ� ����ȭ�� ȣ��
			} else if(menu.equalsIgnoreCase("n")) {
				input.nameInput();			//�̸��˻� ����ȭ�� ȣ��
			} else if(menu.equalsIgnoreCase("a")) {
				input.addrInput();			//�ּҸ� �˻��ϴ� ����ȭ�� ȣ��
			} else if (menu.equalsIgnoreCase("e")) {
				System.out.print("���� �����Ͻðڽ��ϱ�(y/n)?");
				String exit = scanner.nextLine();
				if (exit.equalsIgnoreCase("y")) {
					System.out.println("ȸ������ ���α׷��� �����մϴ�.\n");
					System.exit(0);
					break;
				} else if (exit.equalsIgnoreCase("n")) {
					continue;
				} else {
					System.out.println("�޴��� �߸� �Է��ϼ̽��ϴ�.\n");
					continue;
				}
			} else {
				System.out.println("�޴��� �߸� �Է��ϼ̽��ϴ�.\n");
				continue;
			}
			
		}//while
		scanner.close();
		
	}//main()
}//class
