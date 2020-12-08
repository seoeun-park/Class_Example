<%@page import="com.hanul.study.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- jsp19.jsp : jsp18.jsp에서 요청한 페이지 -->
<%
request.setCharacterEncoding("utf-8");
MemberDTO dto = (MemberDTO) request.getAttribute("dto");
%>

<jsp:useBean id="actionDTO" class="com.hanul.study.MemberDTO">
	<jsp:setProperty property="*" name="actionDTO"/>
</jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP19</title>
</head>
<body>
○ 이름<br/>
	- JS : <%=dto.getName() %><br/>		
	- Action Tag : <jsp:getProperty property="name" name="actionDTO"/><br/>
	- EL : ${dto.name }, ${actionDTO.name }
		<!-- ${dto.name } → jsp18.jsp에서 요청한 페이지이므로 setAttribute를 사용하지 않아도 출력 가능 -->
</body>
</html>