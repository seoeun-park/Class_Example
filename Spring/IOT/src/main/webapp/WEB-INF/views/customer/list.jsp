<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>고객 목록</h3>
	<table border="1" class="w-pct60">
		<tr>
			<th class="w-px80">번호</th>
			<th class="w-px120">성명</th>
			<th class="w-px200">이메일</th>
			<th>전화번호</th>
		</tr>
		<c:forEach items="${list }" var="vo">
			<tr>
				<td>${vo.no }</td>
				<td><a href="detail.cu?id=${vo.id }">${vo.name }</a></td>
				<td>${vo.email }</td>
				<td>${vo.phone }</td>
			</tr>
		</c:forEach>
	</table>
	<br />
	<div class="btnSet">
		<a class="btn-fill" href="new.cu">신규고객</a>
	</div>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>