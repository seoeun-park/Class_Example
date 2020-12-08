import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	//DB 접속
	public Connection getConn() {
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
		String user = "hr";
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
	
	public ArrayList<DTO> print() {
		conn = getConn();
		String sql = "select e.employee_id, e.last_name, e.first_name, e.salary," + 
					 "d.department_name, j.job_title" + 
					 "from employees e, jobs j, departments d" + 
					 "where e.job_id = j.job_id" + 
					 "and e.department_id = d.department_id";
		ArrayList<DTO> list = new ArrayList<>();
		
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				DTO dto = new DTO();
				dto.setEmployee_id(rs.getInt("employee_id"));
				dto.setEmployee_name(rs.getString("last_name") + " " + rs.getString("first_name"));
				dto.setSalary(rs.getInt("salary"));
				dto.setDepartment_name(rs.getString("department_name"));
				dto.setJob_title(rs.getString("job_title"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("print() Exception!");
		} finally {
			dbClose();
		}
		return list;
	}
	
}//class
