package com.hanul.study;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MemberDAO {
	//DB와 관련된 멤버변수 선언
	private Connection conn;		//연결 객체
	private PreparedStatement ps;	//전송 객체
	private ResultSet rs;			//결과 객체
	
	//DB 연결(접속) : ojdbc6.jar ▶   WEB-INF > lib : 복붙
	public Connection getConn() {
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
		String user = "hanul";
		String password = "0000";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getConn() Exception!");
		}
		return conn;
	}//getConn()
	
	//DB 접속 종료
	public void dbClose() {
		try {
			if (rs != null) rs.close(); 
			if (ps != null) ps.close();
			if (conn != null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("dbClose() Exception!");
		}
	}//dbClose()
	
	public int memberInsert(MemberDTO dto) {
		conn = getConn();
		String sql = "insert into member values(?, ?, ?, ?, ?, ?)";
		int succ = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getId());
			ps.setString(3, dto.getPwd());
			ps.setInt(4, dto.getAge());
			ps.setString(5, dto.getAddr());
			ps.setString(6, dto.getTel());
			succ = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("memberInsert() Exception!");
		} finally {
			dbClose();
		}
		return succ;
	}//memberInsert()
	
	//전체 회원 목록 검색
	public ArrayList<MemberDTO> memberSearchAll() {
		conn = getConn();
		String sql = "select * from member";
		ArrayList<MemberDTO> list = new ArrayList<>();
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				/*String name = rs.getString("name");
				String id = rs.getString("id");
				String pwd = rs.getString("pw");
				int age = rs.getInt("age");
				String addr = rs.getString("addr");
				String tel = rs.getString("tel");
				MemberDTO dto = new MemberDTO(name, id, pwd, age, addr, tel);
				list.add(dto);*/
				
				MemberDTO dto = new MemberDTO();
				dto.setName(rs.getString("name"));
				dto.setId(rs.getString("id"));
				dto.setPwd(rs.getString("pw"));
				dto.setAge(rs.getInt("age"));
				dto.setAddr(rs.getString("addr"));
				dto.setTel(rs.getString("tel"));
				list.add(dto);
			}//while
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("memberSearchAll() Exception!");
		} finally {
			dbClose();
		}
		return list;
	}//memberSearchAll()
	
	// 회원정보 삭제
	public int memberDelete(String id) {
		conn = getConn();
		String sql = "delete from member where id = ?";
		int succ = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			succ = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("memberDelete() Exception!");
		} finally {
			dbClose();
		}
		return succ;
	}//memberDelete()
	
	//회원의 ID를 검색
	public MemberDTO getById(String id) {
		conn = getConn();
		String sql = "select * from member where id = ?";
		MemberDTO dto = null;
		// → 아이디는 딱 한 개의 데이터만 가져오므로 ArrayList로 받을 필요가 x
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			// ArrayList가 아니므로 while이 아닌 조건식 if를 쓴다.
			if(rs.next()) {
				dto = new MemberDTO();
				dto.setName(rs.getString("name"));
				dto.setId(rs.getString("id"));
				dto.setPwd(rs.getString("pw"));
				dto.setAge(rs.getInt("age"));
				dto.setAddr(rs.getString("addr"));
				dto.setTel(rs.getString("tel"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getById() Exception!");
		} finally {
			dbClose();
		}
		return dto;
	}//getById()
	
	//회원정보 수정
	public int memberUpdate(MemberDTO dto) {
		conn = getConn();
		String sql = "update member set name = ?, pw = ?, age = ?, "
				+ "addr = ?, tel = ? where id = ?";
		int succ = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getPwd());
			ps.setInt(3, dto.getAge());
			ps.setString(4, dto.getAddr());
			ps.setString(5, dto.getTel());
			ps.setString(6, dto.getId());
			succ = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("memberUpdate() Exception!");
		} finally {
			dbClose();
		}
		return succ;
	}//memberUpdate()
}//class
