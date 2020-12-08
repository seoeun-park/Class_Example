package com.hanul.book;

import java.sql.Connection;
import java.sql.DriverManager;

public class SingleConn {		//Single Ton Class : 특정 역할(기능) 하나만 수행하는 클래스
	//연결 객체 선언
	private static Connection conn;
	
	//초기화 블럭(static block) : 가장 먼저 메모리에 로딩 → main 메소드보다 먼저 실행
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
	
	//getConn() 메소드 정의 : static
	public static Connection getConn() {
		return conn;
	}//getConn()
}
