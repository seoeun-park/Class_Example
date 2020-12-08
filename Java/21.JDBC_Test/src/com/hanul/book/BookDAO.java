package com.hanul.book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class BookDAO {
	private Connection conn = SingleConn.getConn();
	private PreparedStatement ps;
	private ResultSet rs;
	
	//���� ��� ����
	public ArrayList<BookDTO> selectBookAll() {
		String sql = "select * from newBook order by num asc";
		ArrayList<BookDTO> list = new ArrayList<>();
		
		try {
			//conn = SingleConn.getConn();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				BookDTO dto = new BookDTO();
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setCompany(rs.getString("company"));
				dto.setName(rs.getString("name"));
				dto.setCost(rs.getInt("cost"));
				list.add(dto);
			}//while
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("selectBookAll() Exception!");
		} finally {
			//dbClose();		
			// �� DB ���� ����� �޼ҵ��� ������ ����� �İ� �ƴ�, 
			//	  ���������� ���α׷��� ����Ǿ��� �� DB ���� ���Ḧ �����Ѵ�.
			// �� Connection�� ��������� �����߱⶧���� �޼ҵ忡�� db�� �ݰ� �ȴٸ�
			//   �ѹ� �޼ҵ带 ȣ���� ���ķ� db ������ ���� x			
		}			
		return list;
	}//selectBookAll()
	
	
	//��� �޼ҵ�
	public void display(ArrayList<BookDTO> list) {
		if (list.size() == 0) {
			System.out.println("�˻��� ����� �����ϴ�.");
		} else {
			DecimalFormat df = new DecimalFormat("��#,##0");
			System.out.println("========================================");
			for (BookDTO dto : list) {
				System.out.print(dto.getNum() + "\t");
				System.out.print(dto.getTitle() + "\t");
				System.out.print(dto.getCompany() + "\t");
				System.out.print(dto.getName() + "\t");
				System.out.print(df.format(dto.getCost()) + "\n");
			}//for-each
			System.out.println("========================================\n");
		}
	}//display()
	
	
	//���� ��� �޼ҵ�
	public int insertBook(BookDTO dto) {
		String sql = "insert into newBook values(?, ?, ?, ?, ?)";
		int succ = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getNum());
			ps.setString(2, dto.getTitle());
			ps.setString(3, dto.getCompany());
			ps.setString(4, dto.getName());
			ps.setInt(5, dto.getCost());
			succ = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insertBook() Exception!");
		}
		return succ;
	}//insertBook()
	
	//���� ���� �˻� �޼ҵ�
	public ArrayList<BookDTO> selectBookTitle(String searchTitle) {
		String sql = "select * from newBook where upper(title) like upper(?) order by num asc";
		ArrayList<BookDTO> list = new ArrayList<>();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + searchTitle + "%");
			rs = ps.executeQuery();
			
			while (rs.next()) {
				String num = rs.getString("num");
				String title = rs.getString("title");
				String company = rs.getString("company");
				String name = rs.getString("name");
				int cost = rs.getInt("cost");
				BookDTO dto = new BookDTO(num, title, company, name, cost);
				list.add(dto);
			}//while
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("selectBookTitle() Exception!");
		}
		return list;
	}//selectBookTitle()
	
	//���� ���� ���� �޼ҵ�
	public int deleteBook(String num) {
		String sql = "delete from newBook where num = ?";
		int succ = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, num);
			succ = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("deleteBook() Exception!");
		}
		return succ;
	}//deleteBook()
	
	//���� ���� ���� �޼ҵ�
	public int updateBook(BookDTO dto) {
		String sql = "update newBook set title = ?, company = ?, "
				+ "name = ?, cost = ? where num = ?";
		int succ = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getTitle());
			ps.setString(2, dto.getCompany());
			ps.setString(3, dto.getName());
			ps.setInt(4, dto.getCost());
			ps.setString(5, dto.getNum());
			
			succ = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("updateBook() Exception!");
		}
		return succ;
	}//updateBook()
	
	//���� �ֹ� �޼ҵ�
	public void orderBook(String num, String su) {
		String sql = "select * from newBook where num = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, num);
			rs = ps.executeQuery();
			
			if (!(rs.next())) {
				System.out.println("�Է��Ͻ� " + num + "���� ���������� �������� �ʽ��ϴ�.");
			} else {
				DecimalFormat df = new DecimalFormat("��#,##0");
				System.out.println("�ֹ��Ͻ� �������� " + rs.getString("title") + 
									"�̰�, �ܰ��� " + df.format(rs.getInt("cost")) + 
									"�̸�, �ֹ� ������ " + su + "�� �Դϴ�." +
									"�� �ֹ� �ݾ��� " + df.format((Integer.parseInt(su) * rs.getInt("cost"))) + "�Դϴ�.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("orderBook() Exception!");
		}
	}//orderBook()

	//��ġ �Ǵ�
	public boolean isNumber(String su) {
		boolean result = false;
		try {
			Integer.parseInt(su);
			result = true;
		} catch (Exception e) {
			result = false;			
		}
		return result;
	}//isNumber()
	
	
	
	//��ȣ �ߺ� �˻�(��ȣ �˻� �޼ҵ�)
	public ResultSet checkNum(String num) {
		String sql = "select * from newBook where num = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, num);
			rs = ps.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}//checkNum()
	
	//DB ���� ����
	public void dbClose() {
		try {
			if(rs != null) rs.close();
			if(ps != null) ps.close();
			if(conn != null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("dbClose() Exception!");
		}
	}//dbClose()

	// ���� ��ȣ �Ǻ� �޼ҵ�
	public boolean isNum(String num) {
		Pattern pattern = Pattern.compile("^\\d{3}-\\d{2}-\\d{4}-\\d{3}-\\d{1}$");
		Matcher matcher = pattern.matcher(num);
		
		boolean isNum = false;
		
		if (matcher.find()) {
			isNum = true;
		} else {
			isNum = false;
		}
		return isNum;
	}
}//class
