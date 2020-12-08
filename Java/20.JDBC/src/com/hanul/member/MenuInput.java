package com.hanul.member;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Scanner;

public class MenuInput {
	private Scanner scanner;
	
	public MenuInput(Scanner scanner) {
		this.scanner = scanner;
	}

	//insertInput() : 회원정보 등록 서브화면
	public void insertInput() {
		System.out.println("회원정보 등록 화면 입니다.");
		
		//DAO와 연동하여 DB에 접속한 후 번호의 중복 검사를 수행해야 한다.
		System.out.print("번호를 입력하세요 : ");
		int num = Integer.parseInt(scanner.nextLine());
		
		MemberDAO dao = new MemberDAO();
		ResultSet rs =  dao.checkNum(num);		//중복 검사를 하기 위해 번호검색
		
		//데이터(하나의 레코드)의 유무를 판별하여 true/false를 반환하는 메소드 : next()
		try {
			if (rs.next()) {	//검색 결과가 있다 → 중복된 번호
				System.out.println("입력하신" + num + "번 자료는 이미 존재합니다.");
				System.out.println("다른 번호를 입력하시기 바랍니다.");
			} else {		//검색 결과가 없다 → 사용가능한 번호
				System.out.print("이름을 입력하세요 : ");
				String name = scanner.nextLine();	//db의 변수 이름과 같아야 함
				System.out.print("나이를 입력하세요 : ");
				int age = Integer.parseInt(scanner.nextLine());
				System.out.print("주소를 입력하세요 : ");
				String addr = scanner.nextLine();
				System.out.print("전화번호를 입력하세요 : ");
				String tel = scanner.nextLine();
				
//				System.out.println("num : " + num);
//				System.out.println("name : " + name);
//				System.out.println("age : " + age);
//				System.out.println("addr : " + addr);
//				System.out.println("tel : " + tel);
				MemberDTO dto = new MemberDTO(num, name, age, addr, tel);
				
				int succ = dao.insertMember(dto);
				if (succ > 0) {		//성공
					System.out.println(num + "번 회원님의 정보가 등록되었습니다.");
				} else {
					System.out.println(num + "번 회원님의 정보가 등록되지 않았습니다.");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}//insertInput()
	
	//전체 회원 목록 검색 서브화면
	public void getAllList() {
		System.out.println("전체 회원 목록 검색 화면입니다.");
		MemberDAO dao = new MemberDAO();
		ArrayList<MemberDTO> list = dao.searchAllMember();
		dao.display(list);
	}//getAllList()
	
	//회원 정보 삭제 서브화면
	public void deleteInput() {
		System.out.println("회원 정보 삭제 화면입니다.");
		System.out.print("삭제할 회원번호를 입력하세요 : ");
		int num = Integer.parseInt(scanner.nextLine());
		
		MemberDAO dao = new MemberDAO();
		ResultSet rs = dao.checkNum(num);
		
		try {
			if (!(rs.next())) {		//rs.next() == false(검색 결과가 없음 즉, 삭제할 번호가 없음)
				System.out.println("입력하신 " + num + "번 자료는 없습니다.");
			} else {
				System.out.print("정말 삭제하시겠습니까(y/n)? : ");
				String isDelete = scanner.nextLine();
				if (isDelete.equalsIgnoreCase("y")) {
					int succ = dao.deleteMember(num);
					if (succ > 0) {
						System.out.println(num + "번 회원님의 정보가 삭제되었습니다.");
					} else {
						System.out.println(num + "번 회원님의 정보가 삭제 실패되었습니다.");
					}
				} else if(isDelete.equalsIgnoreCase("n")) {
					System.out.println("취소되었습니다.");
				} else {
					System.out.println("잘못 입력하셨습니다.");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("deleteInput() Exception!");
		}
		
	}//deleteInput()

	//주소 검색 서브화면
	public void addrInput() {
		System.out.println("주소 검색 서브화면입니다.");
		System.out.print("검색할 주소를 입력하세요 : ");
		String searchAddr = scanner.nextLine();
		MemberDAO dao = new MemberDAO();
		ArrayList<MemberDTO> list = dao.searchAddr(searchAddr);
		dao.display(list);
	}//addrInput()
	
	//이름 검색 서브화면
	public void nameInput() {
		System.out.println("이름검색 화면입니다.");
		System.out.print("검색할 이름을 입력하세요 : ");
		String searchName = scanner.nextLine();
		MemberDAO dao = new MemberDAO();
		ArrayList<MemberDTO> list = dao.searchName(searchName);
		dao.display(list);		
	}//nameInput()
	
	// 회원정보 수정 서브화면
	public void updateInput() {
		System.out.println("회원 정보 수정 화면입니다.");
		System.out.print("수정할 회원의 번호를 입력하세요 : ");
		int num = Integer.parseInt(scanner.nextLine());
		MemberDAO dao = new MemberDAO();
		ResultSet rs = dao.checkNum(num);
		try {
			if (!(rs.next())) {
				System.out.println("입력하신 " + num + "번 자료가 없습니다.");
			} else {
				System.out.print(num + "번 회원님의 수정할 이름을 입력하세요 : ");
				String name = scanner.nextLine();
				System.out.print(num + "번 회원님의 수정할 나이를 입력하세요 : ");
				int age = Integer.parseInt(scanner.nextLine());
				System.out.print(num + "번 회원님의 수정할 주소를 입력하세요 : ");
				String addr = scanner.nextLine();
				System.out.print(num + "번 회원님의 수정할 전화번호를 입력하세요 : ");
				String tel = scanner.nextLine();
				
				MemberDTO dto = new MemberDTO(num, name, age, addr, tel);
				int succ = dao.updateMember(dto);
				
				if (succ > 0) {
					System.out.println(num + "번 회원님의 정보가 수정되었습니다.\n");
				} else {
					System.out.println(num + "번 회원님의 정보가 수정 실패되었습니다.\n");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("updateInput() Exception!");
		}
		
	}//updateInput()
	
}//class
