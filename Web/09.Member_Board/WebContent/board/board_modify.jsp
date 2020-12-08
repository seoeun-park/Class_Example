<%@page import="com.board.study.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	BoardDTO dto = (BoardDTO) request.getAttribute("dto");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_modify</title>
<script type="text/javascript">
	function fnSubmit() {
		
	}//fnSubmit()
</script>
</head>
<body>
	<div align="center">
		<h3>[글 수정 하기]</h3>
		<form action="boardModifyAction.bo" method="post" onsubmit="return fnSubmit()">
			<input type="hidden" name="board_num" value="${dto.board_num }" />
			<table border="1">
				<tr>
					<th>제목</th>
					<td>
						<input type="text" value="${dto.getBoard_subject() }" 
							   name="board_subject" maxlength="50" required="required" />
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea rows="15" cols="50" name="board_content">
							${dto.board_content }
						</textarea>		  
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="수정하기" />
						<input type="reset" value="초기화하기" />
						<input type="button" value="목록보기" onclick="location.href='boardList.bo'" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>