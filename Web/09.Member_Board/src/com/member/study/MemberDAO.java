package com.member.study;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MemberDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	//DB 접속
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
		
	} //getConn()
	
	//DB 종료
	public void dbClose() {
		try {
			if(rs != null) rs.close();
			if(ps != null) ps.close();
			if(conn != null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("dbClose() Exception!");
		}
	} //dbClose()
	
	//회원 가입
	public int joinMember(MemberDTO dto) {
		conn = getConn();
		String sql = "insert into boardMember values(?, ?, ?, ?, ?, ?)";
		int succ = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getMember_id());
			ps.setString(2, dto.getMember_pw());
			ps.setString(3, dto.getMember_name());
			ps.setInt(4, dto.getMember_age());
			ps.setString(5, dto.getMember_gender());
			ps.setString(6, dto.getMember_email());
			succ = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("joinMember()");
		} finally {
			dbClose();
		}
		return succ;
	} //joinMember()
	
	// isMember : 회원 여부
	public int isMember(MemberDTO dto) {
		conn = getConn();
		String sql = "select member_pw from boardMember where member_id = ?";
		int result = -1;
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getMember_id());
			rs = ps.executeQuery();
			
			if (rs.next()) {	//id가 존재할 경우(검색 결과가 존재)
				if (rs.getString("member_pw").equals(dto.getMember_pw())) {
				// → 비밀번호가 일치할 경우
					result = 1;		
				} else {
				// → 아이디는 있지만 비밀번호가 일치하지 않는 경우
					result = 0;		
				}
			} else {			
			// → id가 존재하지 않는 경우
				result = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("isMember() Exception!");
		} finally {
			dbClose();
		}
		return result;
	} //isMember()
	
	//getAllMember() : 전체회원목록검색
	public ArrayList<MemberDTO> getAllMember() {
		conn = getConn();
		String sql = "select * from boardMember";
		ArrayList<MemberDTO> list = new ArrayList<>();
		
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setMember_id(rs.getString("member_id"));
				dto.setMember_pw(rs.getString("member_pw"));
				dto.setMember_name(rs.getString("member_name"));
				dto.setMember_age(rs.getInt("member_age"));
				dto.setMember_gender(rs.getString("member_gender"));
				dto.setMember_email(rs.getString("member_email"));
				list.add(dto);
			}//while
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getAllMember() Exception!");
		} finally {
			dbClose();
		}
		return list;
	} //getAllMember()
	
	// deleteMember() : 회원 정보 삭제
	public int deleteMember(String member_id) {
		conn = getConn();
		String sql = "delete from boardMember where member_id = ?";
		int succ = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, member_id);
			succ = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("deleteMember() Exception!");
		} finally {
			dbClose();
		}
		
		return succ;
	} //deleteMember()
	
	// getDetailMember() : 특정회원 검색
	public MemberDTO getDetailMember(String member_id) {
		conn = getConn();
		String sql = "select * from boardMember where member_id = ?";
		MemberDTO dto = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, member_id);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto = new MemberDTO();
				dto.setMember_id(rs.getString("member_id"));
				dto.setMember_pw(rs.getString("member_pw"));
				dto.setMember_name(rs.getString("member_name"));
				dto.setMember_age(rs.getInt("member_age"));
				dto.setMember_gender(rs.getString("member_gender"));
				dto.setMember_email(rs.getString("member_email"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getDetailMember() Exception!");
		} finally {
			dbClose();
		}
		return dto;
	} //getDetailMember()
	
	// getMember_pw() : 비밀번호 검색
	public String getMember_pw(String id) {
		conn = getConn();
		String sql = "select member_pw from boardMember where member_id = ?";
		String member_pw = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				member_pw = rs.getString("member_pw");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getMember_pw() Exception!");
		} finally {
			dbClose();
		}
		
		return member_pw;
	} //getMember_pw()
	
	// updateMember() : 회원 정보 수정
	public int updateMember(MemberDTO dto) {
		conn = getConn();
		String sql = "update boardMember set member_pw = ?, " +
					 "member_name = ?, member_age = ?, " +
					 "member_gender = ?, member_email = ? where member_id = ?";
		int succ = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getMember_pw());
			ps.setString(2, dto.getMember_name());
			ps.setInt(3, dto.getMember_age());
			ps.setString(4, dto.getMember_gender());
			ps.setString(5, dto.getMember_email());
			ps.setString(6, dto.getMember_id());
			
			succ = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("updateMember() Exception!");
		}
		return succ;
	} //updateMember()
} //class
