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
	<h3>회원가입 화면</h3>
	<form action="joinRequest" method="post">
		<table border="1" style="width: 60%">
			<tr>
				<th style="width: 160px">성명</th>
				<td><input type="text" name="name" /></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<label><input type="radio" name="gender" checked="checked" value="남" />남</label>
					<label><input type="radio" name="gender" value="여"/>여</label>
				</td>
			</tr>
			<tr>
				<th >이메일</th>
				<td><input type="text" name="email" /></td>
			</tr>
		</table><br/>
		<input type="submit" value="HttpServletRequest" />
		<input type="submit" value="@RequestParam" onclick="action='joinParam'" />
		<input type="submit" value="데이터 객체" onclick="action='joinData'" />
		<input type="submit" value="@PathVariable" onclick="go_submit(this.form)" />
		
		<br/>
		<a href="<c:url value="/"/>" >홈으로</a>
	</form>
	
	<script type="text/javascript">
		function go_submit(f) {
			f.action = "joinPath/" + f.name.value + "/" + f.gender.value + "/" + f.email.value;
			// joinPath/홍길동/남/hongGilDong.com
		}
	</script>
</body>
</html>