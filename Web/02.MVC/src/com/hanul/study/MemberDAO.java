package com.hanul.study;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.print.DocFlavor.STRING;

public class MemberDAO {
	private Connection conn;		//연결객체
	private PreparedStatement ps;	//전송객체
	private ResultSet rs;			//결과객체
	
	//DB접속 : 정적로딩(ojdbc6.jar 복사  ▶  WebContent > WEB-INF > lib에 붙여넣기)
	// → ojdbc6.jar (C:\oraclexe\app\oracle\product\11.2.0\server\jdbc\lib)
	public Connection getConn() {
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
		String user = "hanul";
		String password = "0000";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");	//동적로딩
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getConn() Exception!");
		}
		return conn;
	}//getConn()
	
	//DB접속 종료
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
	
	//회원가입 처리
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
				String pwd = rs.getString("pwd");
				int age = rs.getInt("age");
				String addr = rs.getString("addr");
				String tel = rs.getString("tel");
				MemberDTO dto = new MemberDTO(name, id, pwd, age, addr, tel);*/
				
				MemberDTO dto = new MemberDTO();
				dto.setName(rs.getString("name"));
				dto.setId(rs.getString("id"));
				dto.setPwd(rs.getString("pw"));
				dto.setAge(rs.getInt("age"));
				dto.setAddr(rs.getString("addr"));
				dto.setTel(rs.getString("tel"));

				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("memberSearchAll() Exception!");
		} finally {
			dbClose();
		}
		return list;
		
	}//memberSearchAll()
	
	//회원정보 삭제
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
}//class
