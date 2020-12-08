<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>신규 고객 등록</h3>
	<form action="insert.cu" method="post">
		<table border="1" style="width: 60%">
			<tr>
				<th style="width: 160px">성명</th>
				<td><input type="text" name="name" /></td>
			</tr>
			<tr>
				<th>성별</th>
				<td><label><input type="radio" name="gender" value="남" />남</label>
					<label><input type="radio" name="gender" value="여"
						checked="checked" />여</label></td>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email" /></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="phone" /></td>
			</tr>
		</table>
		<br />
	</form>
	<div class="btnSet">
		<a class="btn-fill" onclick='$("form").submit()'>저장</a> <a
			class="btn-empty" href="list.cu">취소</a>
	</div>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />

</body>
</html>