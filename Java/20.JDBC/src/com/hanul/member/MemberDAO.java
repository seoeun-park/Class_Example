package com.hanul.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MemberDAO {
	private Connection conn;		//���ᰴü
	private PreparedStatement ps;	//���۰�ü
	private ResultSet rs;			//��� ��ü
	
	//DB ���� �޼ҵ�
	public Connection getConn() {
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
		// jdbc:oracle:thin: �� ��������
		// @ �� ���� ��ȣ
		// 127.0.0.1 �� �ڱ� �ڽ��� �ǹ��ϴ� ip
		// 1521 �� ��Ʈ ��ȣ
		// XE �� ���� �̸�
		String user = "hanul";
		String password = "0000";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");	
			//�����ε� : JAVA�� DB�� �������ִ� driver ȣ��
			//oracle.jdbc.driver��� ��Ű���� OracleDriver��� Ŭ���� ����
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getConn() Exception!");
		}
		return conn;
	}//getConn()
	
	//DB ���� �޼ҵ� : conn, ps, rs �� �������� �����ؾ� ��
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
	
	
	//��ȣ �ߺ� �˻�(��ȣ �˻� �޼ҵ�) 
	public ResultSet checkNum(int num) {
		conn = getConn();	//DB ����
		//String sql = "select * from tblMember where num = " + num;	//���� �ۼ�(Statement)
		String sql = "select * from tblMember where num = ?";	//���� �ۼ�(PreparedStatement)
		try {
			ps = conn.prepareStatement(sql);	//���۰�ü
			ps.setInt(1, num);			
			//�Ű����� ���� ����(db�� �ε����� 1���� ����)
			//���⼭ 1�� ù��° ?�� �ǹ�
			rs = ps.executeQuery();		//������ ���� �� ����� ����� ��ü
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("checkNum() Exception!");
		} finally {
			//dbClose();
		}
		return rs;
	}//checkNum()
	
	//ȸ�� ��� �޼ҵ�
	public int insertMember(MemberDTO dto) {
		conn = getConn();		//DB ����
		String sql = "insert into tblMember values(?, ?, ?, ?, ?)";		//sql ���� �ۼ�
		int succ = 0;		//����, ���� ���θ� ������ ����
		try {
			ps = conn.prepareStatement(sql);	//���۰�ü
			ps.setInt(1, dto.getNum());
			ps.setString(2, dto.getName());
			ps.setInt(3, dto.getAge());
			ps.setString(4, dto.getAddr());
			ps.setString(5, dto.getTel());
			succ = ps.executeUpdate();		//���� ����(���� �� 1 ����)
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insertMember() Exception!");
		} finally {
			dbClose();
		}
		return succ;
	}//insertMember()
	
	
	//��ü ȸ�� �˻� �޼ҵ�
	public ArrayList<MemberDTO> searchAllMember() {
		conn = getConn();
		String sql = "select * from tblMember";
		ArrayList<MemberDTO> list = new ArrayList<>();
		try {
			ps = conn.prepareStatement(sql);	//���۰�ü
			rs = ps.executeQuery();		
			
			while (rs.next()) {			//rs.next()�� false�� �� ������ �ݺ�
				//columnLabel vs columnIndex 
				// �� ���̺� ������ �ٲ�� index ������ �ٲ�Ƿ� columnLabel�� ����ؾ��Ѵ�.
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
	
	//��� �޼ҵ�
	public void display(ArrayList<MemberDTO> list) {
		if (list.size() == 0) {		//�˻� ����� ���� ��
			System.out.println("�˻� ����� �����ϴ�.");
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
	
	//ȸ�� ���� ���� �޼ҵ�
	public int deleteMember(int num) {
		conn = getConn();
		String sql = "delete from tblMember where num = ?";
		int succ = 0;
		try {
			ps = conn.prepareStatement(sql);	//���۰�ü
			ps.setInt(1, num);
			succ = ps.executeUpdate();	//������Ʈ�� �������� ���� ��ȯ
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("deleteMember() Exception!");
		} finally {
			dbClose();
		}
		return succ;
	}//deleteMember()
	
	// �ּ� �˻� �޼ҵ�
	public ArrayList<MemberDTO> searchAddr(String searchAddr) {
		conn = getConn();
		String sql = "select * from tblMember where addr like ? order by num asc";
		ArrayList<MemberDTO> list = new ArrayList<>();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + searchAddr + "%");
			rs = ps.executeQuery();
			//��ü �˻�
			while (rs.next()) {			//rs.next()�� false�� �� ������ �ݺ�
				//columnLabel vs columnIndex 
				// �� ���̺� ������ �ٲ�� index ������ �ٲ�Ƿ� columnLabel�� ����ؾ��Ѵ�.
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
	
	//�̸� �˻� �޼ҵ�
	public ArrayList<MemberDTO> searchName(String searchName) {
		conn = getConn();
		String sql = "select * from tblMember where name like ? order by num asc";
		ArrayList<MemberDTO> list = new ArrayList<>();
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + searchName + "%");
			rs = ps.executeQuery();
			while (rs.next()) {
				MemberDTO dto = new MemberDTO();	//����Ʈ ������ �޼ҵ�� �� �Ҵ�
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
	
	//ȸ������ ���� �޼ҵ�
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
