<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
//바인딩(연결) 객체를 받자 : getAttribute();	▶   Class Type
String pageContextName = (String) pageContext.getAttribute("pageContextName");	
// → scope.jsp 페이지를 닫고 scopeUse.jsp를 새로고침할 경우, null → 현재 페이지에서만 유효하기 때문에 값을 넘길 수 x

String requestName = (String) request.getAttribute("requestName");				
// → scope.jsp 페이지를 닫고 scopeUse.jsp를 새로고침할 경우, null → 동적 페이지 전환이 아니기 때문에

String sessionName = (String) session.getAttribute("sessionName");				
String applicationName = (String) application.getAttribute("applicationName");
// → session과 application 정보는 모든 jsp 파일에 유효하다.
// → 그러나 브라우저를 종료시키면 session 정보는 초기화되어 null값이 뜨게 된다. (application 정보는 브라우저를 종료해도 남아있다.)
// → 그러나 서버를 Restart를 하고 다시 접속하게 되면 application 정보도 초기화된다.
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>scopeUse JSP</title>
</head>
<body>
	<ul>
		<li>pageContext : <%=pageContextName %></li>
		<li>request : <%=requestName %></li>
		<li>session : <%=sessionName %></li>
		<li>application : <%=applicationName %></li>
	</ul>
</body>
</html>