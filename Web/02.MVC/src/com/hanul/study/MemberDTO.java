package com.hanul.study;

import java.io.Serializable;

public class MemberDTO implements Serializable{
	private String name;
	private String id;
	private String pwd;
	private int age;
	private String addr;
	private String tel;
	
	public MemberDTO() {}

	public MemberDTO(String name, String id, String pwd, int age, String addr, String tel) {
		super();
		this.name = name;
		this.id = id;
		this.pwd = pwd;
		this.age = age;
		this.addr = addr;
		this.tel = tel;
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

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
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
	
}//class
