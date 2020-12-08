<%@page import="com.hanul.study.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
MemberDTO dto = (MemberDTO) request.getAttribute("dto");	//바인딩 객체를 받는다.

String ip = request.getParameter("ip");		//매개변수를 받는다.(jsp:param ~~)
pageContext.setAttribute("ip", ip);			//현재 페이지에서 사용할 바인딩 객체를 생성
// → Scope(공유 범위) : pageContext, request, session, application → EL 문법에 사용

%>

<jsp:useBean id="actionDTO" class="com.hanul.study.MemberDTO">
	<jsp:setProperty property="*" name="actionDTO"/>
</jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP12</title>
</head>
<body>
이름(JSP) : <%=dto.getName() %><br/>
이름(Action Tag) : <%=actionDTO.getName() %><br/><br/>

<%-- jsp:getProperty Action Tag는 반드시 
	 jsp:useBean Action Tag로 객체가 생성된 후 사용 가능 --%>
아이디(Action Tag) : <jsp:getProperty property="id" name="actionDTO"/><br/><br/>
주소(EL) : ${dto.addr }<br/>
주소(EL) : ${actionDTO.addr }<br/><br/>

IP 주소(JSP) : <%=ip %><br/>
IP 주소(EL) : ${ip }
</body>
</html>
