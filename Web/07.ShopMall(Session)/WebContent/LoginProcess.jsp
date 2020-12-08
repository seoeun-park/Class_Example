<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");

// id 존재 유무, pwd 일치성  ▶  DB와 연동해서 이상이 없으면
session.setAttribute("id", id);		//세션 바인딩(연결) 객체 생성
session.setMaxInactiveInterval(60);	//세션의 유지시간(초단위)

// Cookie(쿠키) 설정 : 사용자쪽(Client)에 쿠키를 넣어준다.
Cookie ck = new Cookie("id", id);
// → 입력한 id값을 기억해준다.

ck.setMaxAge(60 * 60 * 24 * 365);
// → 쿠키가 존재하는 시간(유효 시간) : 1년

response.addCookie(ck);
// → 설정한 쿠기를 사용자에게 전달

response.sendRedirect("LoginMain.jsp");
%>
