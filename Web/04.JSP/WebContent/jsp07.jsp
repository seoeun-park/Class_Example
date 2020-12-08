<%@ page import="com.hanul.study.MemberDAO"%>
<%@ page import="com.hanul.study.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
MemberDAO dao = new MemberDAO();
int succ = dao.memberDelete(id);

if (succ > 0) {
	out.write("<script>alert('삭제 성공!');");
	out.write("location.href='jsp06.jsp';</script>");
} else {
	out.write("<script>alert('삭제 실패!');");
	out.write("location.href='jsp06.jsp';</script>");	
}
%>
