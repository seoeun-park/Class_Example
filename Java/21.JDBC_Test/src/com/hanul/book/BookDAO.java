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
	
	//도서 목록 보기
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
			// → DB 접속 종료는 메소드의 동작이 종료된 후가 아닌, 
			//	  최종적으로 프로그램이 종료되었을 때 DB 접속 종료를 수행한다.
			// → Connection을 멤버변수로 선언했기때문에 메소드에서 db를 닫게 된다면
			//   한번 메소드를 호출한 이후로 db 연결이 되지 x			
		}			
		return list;
	}//selectBookAll()
	
	
	//출력 메소드
	public void display(ArrayList<BookDTO> list) {
		if (list.size() == 0) {
			System.out.println("검색된 결과가 없습니다.");
		} else {
			DecimalFormat df = new DecimalFormat("￦#,##0");
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
	
	
	//도서 등록 메소드
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
	
	//도서 제목 검색 메소드
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
	
	//도서 정보 삭제 메소드
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
	
	//도서 정보 수정 메소드
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
	
	//도서 주문 메소드
	public void orderBook(String num, String su) {
		String sql = "select * from newBook where num = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, num);
			rs = ps.executeQuery();
			
			if (!(rs.next())) {
				System.out.println("입력하신 " + num + "번의 도서정보가 존재하지 않습니다.");
			} else {
				DecimalFormat df = new DecimalFormat("￦#,##0");
				System.out.println("주문하신 도서명은 " + rs.getString("title") + 
									"이고, 단가는 " + df.format(rs.getInt("cost")) + 
									"이며, 주문 수량은 " + su + "권 입니다." +
									"총 주문 금액은 " + df.format((Integer.parseInt(su) * rs.getInt("cost"))) + "입니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("orderBook() Exception!");
		}
	}//orderBook()

	//수치 판단
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
	
	
	
	//번호 중복 검사(번호 검색 메소드)
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
	
	//DB 접속 종료
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

	// 도서 번호 판별 메소드
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
