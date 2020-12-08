<%@page import="com.hanul.study.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="dto" class="com.hanul.study.MemberDTO">
	<jsp:setProperty property="*" name="dto"/>
</jsp:useBean>
<%
MemberDAO dao = new MemberDAO();
int succ = dao.memberUpdate(dto);

if (succ > 0) {
	out.write("<script>alert('수정 성공!');");
	out.write("location.href='jsp06.jsp';</script>");
} else {
	out.write("<script>alert('수정 실패!');");
	out.write("location.href='jsp06.jsp';</script>");	
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP09</title>
</head>
<body>

</body>
</html>