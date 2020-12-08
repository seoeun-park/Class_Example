package com.hanul.book;

import java.sql.Connection;
import java.sql.DriverManager;

public class SingleConn {		//Single Ton Class : Ư�� ����(���) �ϳ��� �����ϴ� Ŭ����
	//���� ��ü ����
	private static Connection conn;
	
	//�ʱ�ȭ ��(static block) : ���� ���� �޸𸮿� �ε� �� main �޼ҵ庸�� ���� ����
	static {
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
		String user = "hanul";
		String password = "0000";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, password);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DB Conncection Exception!");
		}
	}
	
	//getConn() �޼ҵ� ���� : static
	public static Connection getConn() {
		return conn;
	}//getConn()
}
