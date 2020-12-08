<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP35</title>
</head>
<body>
<%
String[] fruit = {"사과", "복숭아", "딸기", "자두", "오렌지"};
pageContext.setAttribute("fruit", fruit);
// → 자바코드로 만든 변수를 EL 문법으로 접근하기 위해서
%>

○ JAVA 반복문(배열)<br/>
<ul>
	<%
		for(int i = 0; i < fruit.length; i++) {
			out.println("<li>" + fruit[i] + "</li>");
		}
	%>
</ul>

<%--
○ JSTL 반복문(배열) : <c:forEach>실행문</c:forEach>
	▶  <c:forEach var="반복변수명" items="${배열명 }">실행문</c:forEach>	
--%>
○ JSTL 반복문(배열)
<ul>
	<c:forEach var="i" items="${fruit }">
		<li>${i }</li>
	</c:forEach>	
</ul>

</body>
</html>