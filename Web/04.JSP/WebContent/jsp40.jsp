<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP40</title>
</head>
<body>
	<!-- fn 태그는 EL 표기법 안에서 작성해야 한다. -->
	<c:set var="hi" value="   How   Are   You?   "/>
	○ 원래 문자열(공백 제거) : ${hi }<br/>
	○ 공백 포함 문자열 : How&nbsp;&nbsp;&nbsp;Are&nbsp;&nbsp;&nbsp;You?<br/>
	○ 모두 대문자로 출력 : ${fn:toUpperCase(hi) }<br/>
	○ 모두 소문자로 출력 : ${fn:toLowerCase(hi) }<br/>
	○ 문자열의 길이(공백 포함) : ${fn:length(hi) }<br/> 
	○ 공백을 제거하여 출력 : ${fn:trim(hi) }<br/>
	○ 공백을 제거한 후 문자열의 길이 : ${fn:length(fn:trim(hi)) }<br/>
	○ Are 문자의 위치는 ? ${fn:indexOf(hi, "Are") }<br/>		<!-- 0부터 시작 -->
	○ Are를 Were로 변경 : ${fn:replace(hi, "Are", "Were") }<br/>
</body>
</html>