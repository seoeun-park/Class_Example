import java.util.Scanner;

import com.hanul.book.BookDAO;
import com.hanul.book.BookInput;

import oracle.jdbc.driver.DBConversion;

public class BookMain {
	public static void menuPrint() {
		System.out.println("====��������====");
		System.out.println("����������� : I");
		System.out.println("������Ϻ��� : A");
		System.out.println("��������˻� : S");
		System.out.println("������������ : D");
		System.out.println("������������ : U");
		System.out.println("�����ֹ��ϱ� : O");
		System.out.println("������������ : E");
		System.out.println("================\n");
	}//menuPrint()
	
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		BookInput input = new BookInput(scanner);
		
		while (true) {
			menuPrint();
			System.out.print("�޴��� �Է��ϼ���  �� ");
			String menu = scanner.nextLine();
			
			if (menu.equalsIgnoreCase("i")) {			//�����������
				input.insertBookInput();
				continue;
			} else if(menu.equalsIgnoreCase("a")) {		//��ü��ϰ˻�
				input.selectBookAllInput();
				continue;
			} else if(menu.equalsIgnoreCase("s")) {		//��������˻�
				input.selectBookTitleInput();
				continue;
			} else if(menu.equalsIgnoreCase("d")) {		//������������
				input.deleteBookInput();
				continue;
			} else if(menu.equalsIgnoreCase("u")) {		//������������
				input.updateBookInput();
				continue;
			} else if(menu.equalsIgnoreCase("o")) {		//�����ֹ��ϱ�
				input.orderBookInput();
				continue;
			} else if(menu.equalsIgnoreCase("e")) {		//������������
				System.out.print("���� �����Ͻðڽ��ϱ�(y/n)? �� ");
				String exit = scanner.nextLine();
				if (exit.equalsIgnoreCase("y")) {
					System.out.println("�������� ���α׷��� �����մϴ�.");
					BookDAO dao = new BookDAO();
					dao.dbClose();
					System.exit(0);		//���õ� �ٸ� Ŭ������ �޸𸮿��� �Բ� ����
					break;
				} else if (exit.equalsIgnoreCase("n")) {
					System.out.println("����ϼ̽��ϴ�.");
					continue;
				} else {
					System.out.println("�߸� �Է��ϼ̽��ϴ�!");
					continue;
				}
			} else {
				System.out.println("�޴��� �߸� �Է��ϼ̽��ϴ�.");
				continue;
			}
		}//while
		scanner.close();
	}//main()
}//class
