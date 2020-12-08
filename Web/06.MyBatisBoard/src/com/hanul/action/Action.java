// Action.java : Servlet 역할을 수행하는 파일들의 공통적인 코드의 집합
package com.hanul.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	public abstract ActionForward excute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException;
	// 접근제어자 protected : 같은 패키지 안에 있는 파일안에서만 접근 가능
	// abstract : 추상 메소드(구현부는 없고 선언부만 작성, 해당 class를 상속받으면 무조건 오버라이드 해야하는 메소드)	
}
