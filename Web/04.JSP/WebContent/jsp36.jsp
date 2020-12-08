<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP36</title>
</head>
<body>
<%
ArrayList<String> list = new ArrayList<>();
list.add("멜론");
list.add("귤");
list.add("망고");
list.add("아보카도");
list.add("토마토");
pageContext.setAttribute("list", list);
%>
○ JAVA for<br/>
<ul>
	<%
		for(int i = 0; i < list.size(); i++) {
			out.println("<li>" + list.get(i) +"</li>");
		}
	%>
</ul>

○ JAVA forEach<br/>
<ul>
	<%
		for(String str : list) {
			out.println("<li>" + str + "</li>");
		}
	%>
</ul>

○ EL 문법(표현법)<br/>
<ul>
	<li>${list[0] }</li>
	<li>${list[1] }</li>
	<li>${list[2] }</li>
	<li>${list[3] }</li>
	<li>${list[4] }</li>
</ul>

○ JSTL core<br/>
<ul>
	<c:forEach var="i" items="${list }">
		<li>${i }</li>
	</c:forEach>
</ul>
</body>
</html>