<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int num1 = (Integer) request.getAttribute("num1");
int num2 = (Integer) request.getAttribute("num2");
int sum = (Integer) request.getAttribute("sum");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>누적합 결과</title>
</head>
<body>
첫 번째 수 : <%= num1 %> <br/>
두 번째 수 : <%= num2 %> <br/>
누적합 결과 : <%= sum %>
</body>
</html>