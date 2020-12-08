<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--
request.setCharacterEncoding("utf-8");
String code = (String) request.getAttribute("code");
String name = (String) request.getAttribute("name");
Integer price = (Integer) request.getAttribute("price");
--%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP31</title>
</head>
<body>
<%--
코드 : <%=code %>
제품명 : <%=name %>
가격 : <%=price %>
--%>
코드 : ${code }<br/> 
제품명 : ${name }<br/> 
코가격드 : ${price }<br/> 
</body>
</html>