<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>[${vo.name }]고객 상세 정보</h3>
	<table class="w-pct160">
		<tr class="w-px160">
			<th>성별</th>
			<td>${vo.gender }</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${vo.email }</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>${vo.phone }</td>
		</tr>
	</table>
	<div class="btnSet">
		<a class="btn-fill" href="list.cu">고객 목록</a> <a class="btn-fill"
			href="new.cu">신규</a> <a class="btn-fill"
			href="modify.cu?id=${vo.id }">수정</a> <a class="btn-fill"
			onclick="if( confirm('정말 삭제?') ) { href='delete.cu?id=${vo.id }'}">삭제</a>
	</div>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</body>
</html>