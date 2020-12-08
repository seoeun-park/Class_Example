<%@page import="com.hanul.study.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");

// 1. Servlet 방식으로 값 전달받기
MemberDTO dto = new MemberDTO();
dto.setName(request.getParameter("name"));
dto.setId(request.getParameter("id"));
dto.setPwd(request.getParameter("pwd"));
dto.setAge(Integer.parseInt(request.getParameter("age")));
dto.setAddr(request.getParameter("addr"));
dto.setTel(request.getParameter("tel"));

// 현재 페이지에서 사용할 바인딩(연결) 객체 생성 : EL 문법에 사용하기 위해서
pageContext.setAttribute("dto", dto);
// → pageContext : Scope
%>

<!-- 2. Action Tag로 값 전달받기 -->
<jsp:useBean id="actionDTO" class="com.hanul.study.MemberDTO">
	<jsp:setProperty property="*" name="actionDTO"/>
</jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP20</title>
</head>
<body>
○ JSP 기본 출력<br/>
이름 : <%=dto.getName() %><br/>
아이디 : <%=dto.getId() %><br/>
주소 : <%=dto.getAddr() %><br/>
<br/>

○ Action Tag로 출력
이름 : <jsp:getProperty property="name" name="actionDTO"/><br/>
아이디 : <jsp:getProperty property="id" name="actionDTO"/><br/>
주소 : <jsp:getProperty property="addr" name="actionDTO"/><br/>
<br/>

○ EL 출력<br/>
이름 : ${param.name }	(parameter), 
	 ${dto.name } (dto), 
	 ${actionDTO.name } (actionDto)<br/>
	 
아이디 : ${param.id } (parameter), 
	  ${dto.id } (dto), 
	  ${actionDTO.id } (actionDto)<br/>
	 
주소 : ${param.addr } (parameter), 
	 ${dto.addr } (dto), 
	 ${actionDTO.addr } (actionDto)<br/>
<br/>

</body>
</html>