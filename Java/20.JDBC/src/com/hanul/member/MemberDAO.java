package com.hanul.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MemberDAO {
	private Connection conn;		//연결객체
	private PreparedStatement ps;	//전송객체
	private ResultSet rs;			//결과 객체
	
	//DB 접속 메소드
	public Connection getConn() {
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
		// jdbc:oracle:thin: → 프로토콜
		// @ → 구분 기호
		// 127.0.0.1 → 자기 자신을 의미하는 ip
		// 1521 → 포트 번호
		// XE → 서비스 이름
		String user = "hanul";
		String password = "0000";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");	
			//동적로딩 : JAVA와 DB를 연결해주는 driver 호출
			//oracle.jdbc.driver라는 패키지에 OracleDriver라는 클래스 제공
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getConn() Exception!");
		}
		return conn;
	}//getConn()
	
	//DB 종료 메소드 : conn, ps, rs → 역순으로 종료해야 함
	public void dbClose() {
		try {
			if (rs !=  null) rs.close();
			if (ps !=  null) ps.close();
			if (conn !=  null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("dbClose() Exception!");
		}
	}//dbClose()
	
	
	//번호 중복 검사(번호 검색 메소드) 
	public ResultSet checkNum(int num) {
		conn = getConn();	//DB 접속
		//String sql = "select * from tblMember where num = " + num;	//쿼리 작성(Statement)
		String sql = "select * from tblMember where num = ?";	//쿼리 작성(PreparedStatement)
		try {
			ps = conn.prepareStatement(sql);	//전송객체
			ps.setInt(1, num);			
			//매개변수 값을 전달(db는 인덱스가 1부터 시작)
			//여기서 1은 첫번째 ?를 의미
			rs = ps.executeQuery();		//쿼리가 실행 후 결과가 저장된 객체
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("checkNum() Exception!");
		} finally {
			//dbClose();
		}
		return rs;
	}//checkNum()
	
	//회원 등록 메소드
	public int insertMember(MemberDTO dto) {
		conn = getConn();		//DB 접속
		String sql = "insert into tblMember values(?, ?, ?, ?, ?)";		//sql 쿼리 작성
		int succ = 0;		//성공, 실패 여부를 저장할 변수
		try {
			ps = conn.prepareStatement(sql);	//전송객체
			ps.setInt(1, dto.getNum());
			ps.setString(2, dto.getName());
			ps.setInt(3, dto.getAge());
			ps.setString(4, dto.getAddr());
			ps.setString(5, dto.getTel());
			succ = ps.executeUpdate();		//쿼리 실행(성공 시 1 저장)
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insertMember() Exception!");
		} finally {
			dbClose();
		}
		return succ;
	}//insertMember()
	
	
	//전체 회원 검색 메소드
	public ArrayList<MemberDTO> searchAllMember() {
		conn = getConn();
		String sql = "select * from tblMember";
		ArrayList<MemberDTO> list = new ArrayList<>();
		try {
			ps = conn.prepareStatement(sql);	//전송객체
			rs = ps.executeQuery();		
			
			while (rs.next()) {			//rs.next()가 false가 될 때까지 반복
				//columnLabel vs columnIndex 
				// → 테이블 구조가 바뀌면 index 구조도 바뀌므로 columnLabel을 사용해야한다.
				int num = rs.getInt("num");
				String name = rs.getString("name");
				int age = rs.getInt("age");
				String addr = rs.getString("addr");
				String tel = rs.getString("tel");
				MemberDTO dto = new MemberDTO(num, name, age, addr, tel);
				list.add(dto);
			}//while()
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("searchAllMember() Exception!");
		} finally {
			dbClose();
		}
		return list;
	}//searchAllMember()
	
	//출력 메소드
	public void display(ArrayList<MemberDTO> list) {
		if (list.size() == 0) {		//검색 결과가 없을 때
			System.out.println("검색 결과가 없습니다.");
		} else {
			for (MemberDTO dto : list) {
				System.out.print(dto.getNum() + "\t");
				System.out.print(dto.getName() + "\t");
				System.out.print(dto.getAge() + "\t");
				System.out.print(dto.getAddr() + "\t");
				System.out.print(dto.getTel() + "\n");
			}//for-each
		}//if
	}//display()
	
	//회원 정보 삭제 메소드
	public int deleteMember(int num) {
		conn = getConn();
		String sql = "delete from tblMember where num = ?";
		int succ = 0;
		try {
			ps = conn.prepareStatement(sql);	//전송객체
			ps.setInt(1, num);
			succ = ps.executeUpdate();	//업데이트된 데이터의 갯수 반환
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("deleteMember() Exception!");
		} finally {
			dbClose();
		}
		return succ;
	}//deleteMember()
	
	// 주소 검색 메소드
	public ArrayList<MemberDTO> searchAddr(String searchAddr) {
		conn = getConn();
		String sql = "select * from tblMember where addr like ? order by num asc";
		ArrayList<MemberDTO> list = new ArrayList<>();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + searchAddr + "%");
			rs = ps.executeQuery();
			//전체 검색
			while (rs.next()) {			//rs.next()가 false가 될 때까지 반복
				//columnLabel vs columnIndex 
				// → 테이블 구조가 바뀌면 index 구조도 바뀌므로 columnLabel을 사용해야한다.
				int num = rs.getInt("num");
				String name = rs.getString("name");
				int age = rs.getInt("age");
				String addr = rs.getString("addr");
				String tel = rs.getString("tel");
				MemberDTO dto = new MemberDTO(num, name, age, addr, tel);
				list.add(dto);
			}//while()
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("searchAddr() Exception!");
		} finally {
			dbClose();
		}
		return list;
	}//searchAddr()
	
	//이름 검색 메소드
	public ArrayList<MemberDTO> searchName(String searchName) {
		conn = getConn();
		String sql = "select * from tblMember where name like ? order by num asc";
		ArrayList<MemberDTO> list = new ArrayList<>();
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + searchName + "%");
			rs = ps.executeQuery();
			while (rs.next()) {
				MemberDTO dto = new MemberDTO();	//디폴트 생성자 메소드로 값 할당
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setAge(rs.getInt("age"));
				dto.setAddr(rs.getString("addr"));
				dto.setTel(rs.getString("tel"));
				list.add(dto);
			}//while
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("searchName() Exception!");
		} finally {
			dbClose();
		}
		return list;
	}//searchName()
	
	//회원정보 수정 메소드
	public int updateMember(MemberDTO dto) {
		conn = getConn();
		String sql = "update tblMember set name = ?, age = ?, "
				   + "addr = ?, tel = ? where num = ?";
		int succ = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setInt(2, dto.getAge());
			ps.setString(3, dto.getAddr());
			ps.setString(4, dto.getTel());
			ps.setInt(5, dto.getNum());
			
			succ = ps.executeUpdate();		//insert, delete, update
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("updateMember() Exception!");
		} finally {
			dbClose();
		}
		return succ;
	}//updateMember()
	
}//class
