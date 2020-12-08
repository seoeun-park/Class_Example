package member;

import java.util.Date;

public class MemberVO {
	private String name, id, pw, gender, email, post, addr, tel, admin;
	private String birth;	
	//null이 있을 수도 있기 때문에 Date 타입보다는 String으로 선언해야 편하다
	
	public MemberVO(String name, String id, String pw, String gender, 
					String email, String post, String addr, 
					String tel, String admin, String birth) {
		super();
		this.name = name;
		this.id = id;
		this.pw = pw;
		this.gender = gender;
		this.email = email;
		this.post = post;
		this.addr = addr;
		this.tel = tel;
		this.admin = admin;
		this.birth = birth;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	
	
	
}
