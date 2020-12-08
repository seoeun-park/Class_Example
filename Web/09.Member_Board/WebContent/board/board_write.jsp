<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("id");
	if (id == null) {
		response.sendRedirect("memberLogin.me");
		// 로그인이 안되어있을 경우, 로그인 화면으로 이동
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_write</title>
<script type="text/javascript">
	function fnSubmit() {
		if (confirm("작성하신 글을 등록하시겠습니까?")) {
			return true;
		}
		return false;
	}
</script>
</head>
<body>
	<div align="center">
		<h3>[게시판 글쓰기]</h3>
		<form action="boardAddAction.bo" method="post" 
			  enctype="multipart/form-data" onsubmit="return fnSubmit()">
		<!-- enctype="multipart/form-data" → core 라이브러리 활용 -->
			<input type="hidden" name="board_id" value="${id }" />
			<table border="1">
				<tr>
					<th>작성자</th>
					<td>${id }</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="board_subject" maxlength="50" required="required" /></td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea rows="15" cols="50" name="board_content" required="required"></textarea>
					</td>
				</tr>
				<tr>
					<th>파일 첨부</th>
					<td><input type="file" name="board_file" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="글 등록" />
						<input type="reset" value="다시 작성" />
						<input type="button" value="목록보기" onclick="location.href='boardList.bo'" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>