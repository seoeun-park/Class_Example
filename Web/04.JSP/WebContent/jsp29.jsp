<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- JSTL core문을 사용하기 위해서는 반드시 문서 상단에 기술-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 --%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP29</title>
</head>
<body>
1. 기본 프로그래밍 Tag : 변수, 배열, if, for, switch ~ case 등) ▶   core<br/>
<%
//JAVA 변수 선언 및 할당 : 초기화		
int num1 = 100;	
%>
JAVA num1 : <%=num1 %><br/>

<%-- JSTL 변수 선언 : <c:set ~~> --%>
<c:set var="num2" value="200"/>
JSTL num2 : ${num2 }<br/>

<%-- JAVA num1 값을 JSTL num3 할당 --%>
<c:set var="num3" value="<%=num1 %>"/>
JSTL num3 : ${num3 }<br/>

<%-- JSTL num2 값과 num3 값을 더한 값 : JSTL result 할당--%>
<c:set var="result" value="${num2 + num3 }"></c:set>
JSTL result : ${result }<br/>
</body>
</html>
