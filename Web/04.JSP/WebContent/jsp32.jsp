<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP32</title>
</head>
<body>
<!-- jsp32.jsp?num1=100&num2=50 -->
<!-- 매개변수 값의 자릿수가 같은 경우에만 정확한 결과가 출력 -->
<!-- 자릿수가 다를 경우에 잘못된 결과가 출력된다. -->
첫 번째 정수 : ${param.num1 }<br/>
두 번째 정수 : ${param.num2 }<br/>
<br/>

<%--
	JSTL 단일 조건문 : <c:if test="조건식">실행문</c:if>
--%>
최대값 : <c:if test="${param.num1 - param.num2 > 0 }">${param.num1 }</c:if>
	  <c:if test="${param.num1 - param.num2 < 0}">${param.num2 }</c:if>
	  <c:if test="${param.num1 - param.num2 == 0}">${param.num1 }</c:if>
<br/>	  
최소값 : <c:if test="${param.num1 gt param.num2 }">${param.num2 }</c:if>
	  <c:if test="${param.num1 lt param.num2 }">${param.num1 }</c:if>
	  <c:if test="${param.num1 eq param.num2 }">${param.num1 }</c:if>
<!-- 최대값 예제처럼 산술연산을 수행하고 비교연산을 수행하므로 결과가 정확 -->
<!-- 최소값 예제처럼 비교연산만 수행할 경우에는
	 매개변수 값의 자릿수가 같을 경우에만 정확한 결과가 출력
	 자릿수가 다를 경우에는 왼쪽 자리에 0을 넣어서 자릿수를 맟춰준다. -->	  
</body>
</html>