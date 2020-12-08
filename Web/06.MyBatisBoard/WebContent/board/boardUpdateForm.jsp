<%@page import="com.hanul.dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
BoardDTO dto = (BoardDTO) request.getAttribute("dto");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardUpdateForm</title>
<script type="text/javascript">
	function fnSubmit() {
		if (confirm("정말 수정하시겠습니까?")) {
			return true;
		} else {
			return false
		}
		
	}//fnSubmit()
	
	function fnReset() {
		if (confirm("정말 초기화하시겠습니까?")) {
			return true;
		} else {
			return false
		}
	}//fnReset()
</script>
</head>
<body>
	<div align="center">
		<h3>[글 수정하기]</h3>
		<form action="boardUpdate.do" method="post" onsubmit="return fnSubmit();" onreset="return fnReset();">
		<input type="hidden" name="b_num" value="${dto.b_num }" />
			<table border="1" style="width: 80%">
				<tr>
					<th>작성자</th>
					<td><input type="text" name="b_writer" value="${dto.b_writer }" /></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="b_subject" value="${dto.b_subject }" /></td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea rows="10" cols="50" name="b_content">${dto.b_content }</textarea>
					</td>
				</tr>
				<tr>
					<th>수정할 비밀번호</th>
					<td>
						<input type="password" name="b_pwd" value="${dto.b_pwd }" />
						<input type="submit" value="수정하기" />
						<input type="reset" value="초기화하기" />
						<input type="button" value="목록보기" onclick="location.href='boardList.do'" />
					</td>
				</tr>
				
			</table>
		</form>
	</div>
</body>
</html>