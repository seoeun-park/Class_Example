<%@page import="com.hanul.study.ResultDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP04</title>
</head>
<body>
<%
	//jsp03.jsp에서 넘겨준 바인딩(연걸) 객체를 받는다   ▶  항상 클래스 타입으로 받아야 한다.
	ResultDTO dto = (ResultDTO) request.getAttribute("dto");
	// → request.getAttribute("dto")은 Object 타입이므로 형변환을 시켜주어야한다.
%>
첫 번째 정수 : <%=dto.getNum1() %><br/>
두 번째 정수 : <%=dto.getNum2() %><br/>
두 수 사이의 누적합 : <%=dto.getSum() %>
</body>
</html>