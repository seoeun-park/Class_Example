package com.hanul.study;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BookDAO {
	private Connection conn;		//연결 객체입니다.
	private PreparedStatement ps;	//전송 객체입니다.
	private ResultSet rs;			//결과 객체입니다.

	//getConn() : DB 접속	 ▶   ojdbc.jar 등록
	//ojdbc6.jar (C:\oraclexe\app\oracle\product\11.2.0\server\jdbc\lib)
	//ojdbc6.jar 복사  ▶  WebContent > WEB-INF > lib에 붙여넣기
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
	
	//dbClose() : DB 접속 해제
	public void dbClose() {
		try {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (conn != null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("dbClose() Exception!");
		}		
	}
	
	//insert() : 도서정보 등록
	public int insert(BookDTO dto) {
		conn = getConn();
		String sql = "insert into book values(?, ?, ?, ?, ?, ?, ?)";
		int succ = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getTitle());
			ps.setString(2, dto.getAuth());
			ps.setString(3, dto.getIsbn());
			ps.setString(4, dto.getComp());
			ps.setInt(5, dto.getCost());
			ps.setInt(6, dto.getSu());
			ps.setInt(7, dto.getCost() * dto.getSu());
			succ = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insert() Exception!");
		} finally {
			dbClose();
		}
		return succ;
	}//insert

	//getAllList() : 전체도서 목록 조회
	public ArrayList<BookDTO> getAllList() {
		conn = getConn();
		String sql = "select * from book";
		ArrayList<BookDTO> list = new ArrayList<>();
		
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				BookDTO dto = new BookDTO();
				dto.setTitle(rs.getString("title"));
				dto.setAuth(rs.getString("auth"));
				dto.setIsbn(rs.getString("isbn"));
				dto.setComp(rs.getString("comp"));
				dto.setCost(rs.getInt("cost"));
				dto.setSu(rs.getInt("su"));
				dto.setPrice(rs.getInt("price"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getAllList() Exception!");
		} finally {
			dbClose();
		}
		return list;
	}//getAllList()

	//delete() : 도서정보 삭제
	public int delete(String isbn) {
		conn = getConn();
		String sql = "delete from book where isbn = ?";
		int succ = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, isbn);
			succ = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("delete() Exception!");
		} finally {
			dbClose();
		}
		return succ;		
	}
	
	
}//class
