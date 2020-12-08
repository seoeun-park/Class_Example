<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>[${method }] 회원가입 결과</h3>
	<table border="1">
		<tr>
			<th>성명</th>
			<td>${name }</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>${gender }</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${email }</td>
		</tr>
	</table><br/>	
	<br/>
	
	<table border="1">
		<tr>
			<th>성명</th>
			<td>${vo.name }</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>${vo.gender }</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${vo.email }</td>
		</tr>
	</table><br/>
	<a href="<c:url value='/member'/>">회원가입으로</a>
</body>
</html>