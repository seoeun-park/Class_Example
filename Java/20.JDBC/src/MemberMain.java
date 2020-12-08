import java.util.Scanner;

import com.hanul.member.MenuInput;

public class MemberMain {
	public static void menuPrint() {
		System.out.println("====회원관리====");
		System.out.println("회원관리 입력 : I");
		System.out.println("전체회원 검색 : S");
		System.out.println("회원정보 삭제 : D");
		System.out.println("회원정보 수정 : U");
		
		System.out.println("회원이름 검색 : N");
		System.out.println("회원주소 검색 : A");
		System.out.println("회원관리 종료 : E");
		System.out.println("=================\n");
	}//menuPrint()
	
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		MenuInput input = new MenuInput(scanner);
		
		while (true) {
			menuPrint();
			System.out.print("메뉴를 입력하세요 : ");
			String menu = scanner.nextLine();
			if (menu.equalsIgnoreCase("i")) {
				//System.out.println("신규 회원 등록화면");
				input.insertInput();		//회원정보를 등록하는 서브화면 호출
				continue;
			} else if(menu.equalsIgnoreCase("s")) {
				input.getAllList();			//전체 회원을 검색하는 서브화면 호출
				continue;
			} else if(menu.equalsIgnoreCase("d")) {
				input.deleteInput();		//회원정보를 삭제하는 서브화면 호출
			} else if(menu.equalsIgnoreCase("u")) {
				input.updateInput();		//회원정보를 수정하는 서브화면 호출
			} else if(menu.equalsIgnoreCase("n")) {
				input.nameInput();			//이름검색 서브화면 호출
			} else if(menu.equalsIgnoreCase("a")) {
				input.addrInput();			//주소를 검색하는 서브화면 호출
			} else if (menu.equalsIgnoreCase("e")) {
				System.out.print("정말 종료하시겠습니까(y/n)?");
				String exit = scanner.nextLine();
				if (exit.equalsIgnoreCase("y")) {
					System.out.println("회원관리 프로그램을 종료합니다.\n");
					System.exit(0);
					break;
				} else if (exit.equalsIgnoreCase("n")) {
					continue;
				} else {
					System.out.println("메뉴를 잘못 입력하셨습니다.\n");
					continue;
				}
			} else {
				System.out.println("메뉴를 잘못 입력하셨습니다.\n");
				continue;
			}
			
		}//while
		scanner.close();
		
	}//main()
}//class
