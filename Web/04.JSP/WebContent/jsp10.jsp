<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="dto" class="com.hanul.study.MemberDTO">
	<jsp:setProperty property="*" name="dto"/>
</jsp:useBean>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>[매개변수(Parameter)의 내용(값)을 출력]</h3>
	<!-- JSP 스크립틀릿을 이용한 출력 -->
	이름(JSP) : <%=dto.getName() %>
	<br/>
	
	<!-- Action Tag를 이용한 출력 -->
	아이디(Action Tag) : <jsp:getProperty property="id" name="dto"/>
		<!-- Action Tag를 이용한 출력은 useBean이 작성되어야만 출력 가능 하다 -->
	<br/>
	
	<!-- EL(Expression Language) 문법을 이용한 출력 -->
	주소(EL) : ${dto.addr }
</body>
</html>