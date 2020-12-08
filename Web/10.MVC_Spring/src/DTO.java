import java.io.Serializable;

public class DTO implements Serializable{
	private int employee_id;
	private String employee_name;
	private int salary;
	private String department_name;
	private String job_title;
	
	public DTO() {}

	public DTO(int employee_id, String employee_name, int salary, String department_name, String job_title) {
		super();
		this.employee_id = employee_id;
		this.employee_name = employee_name;
		this.salary = salary;
		this.department_name = department_name;
		this.job_title = job_title;
	}

	public int getEmployee_id() {
		return employee_id;
	}

	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}

	public String getEmployee_name() {
		return employee_name;
	}

	public void setEmployee_name(String employee_name) {
		this.employee_name = employee_name;
	}

	public int getSalary() {
		return salary;
	}

	public void setSalary(int salary) {
		this.salary = salary;
	}

	public String getDepartment_name() {
		return department_name;
	}

	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}

	public String getJob_title() {
		return job_title;
	}

	public void setJob_title(String job_title) {
		this.job_title = job_title;
	}
	
}
