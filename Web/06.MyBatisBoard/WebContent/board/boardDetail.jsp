<%@page import="com.hanul.dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
request.setCharacterEncoding("utf-8");
BoardDTO dto = (BoardDTO) request.getAttribute("dto");
pageContext.setAttribute("enter", "\r\n");	
// → JSTL 줄바꿈 처리를 위한 현재 페이지용 객체
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardDetail</title>
<script type="text/javascript">
	function fnDelete(b_pwd) {
		var user_pwd = document.detailForm.user_pwd.value;
		//alert("User Pw : " + user_pwd + "\nDB Pw : " + b_pwd);
		
		if(user_pwd.trim() == "") {		//비밀번호 미입력
			alert("비밀번호를 입력하세요!");
			document.detailForm.user_pwd.value = "";
			document.detailForm.user_pwd.focus();
		} else if(user_pwd != b_pwd) {	//비밀번호 불일치
			alert("비밀번호를 잘못 입력되었습니다!");
			document.detailForm.user_pwd.value = "";
			document.detailForm.user_pwd.focus();
		} else {	//비밀번호 일치 → confirm 창
			if(confirm("정말 삭제하시겠습니까?")) {
				location.href="boardDelete.do?b_num=" + ${dto.b_num };
			} else {
				document.detailForm.user_pwd.value = "";
				document.detailForm.user_pwd.focus();
			}
		}
	}//fnDelete()
	
	function fnUpdate(b_pwd) {
		var user_pwd = document.detailForm.user_pwd.value;
		
		if(user_pwd.trim() == "") {		//비밀번호 미입력
			alert("비밀번호를 입력하세요!");
			document.detailForm.user_pwd.value = "";
			document.detailForm.user_pwd.focus();
		} else if(user_pwd != b_pwd) {	//비밀번호 불일치
			alert("비밀번호를 잘못 입력되었습니다!");
			document.detailForm.user_pwd.value = "";
			document.detailForm.user_pwd.focus();
		} else {	//비밀번호 일치 → confirm 창
			location.href="boardUpdateForm.do?b_num=" + ${dto.b_num };
		}	
	}//fnUpdate()
	
</script>
</head>
<body>
	<div align="center">
		<h3>[글 상세보기]</h3>
		<table border="1" style="width: 80%">
			<tr>
				<th>작성자</th>
				<td align="center">${dto.b_writer }</td>
				<th>조회수</th>
				<td align="center">${dto.b_readcount }</td> 
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3">${dto.b_subject }</td>
			</tr>
			<tr>
				<th>내용</th>
				<%-- <td colspan="3">${dto.b_content }</td><!-- 줄바꿈 처리 문제 --> --%>
				<td colspan="3">
					<%-- dto.getB_content().replace("\r\n", "<br/>") --%>
					${fn:replace(dto.b_content, enter, "<br/>") }
				</td>
			</tr>
			<tr align="center">
				<th>비밀번호</th>
				<td colspan="3">
					<!-- script에서 user_pwd에 접근하기 위한 폼 -->
					<form name="detailForm" onsubmit="return false;">
					<!-- onsubmit="return false;" → enter키를 눌러도 submit이 안되게 하기 위해 -->
						<input type="password" name="user_pwd" />
						<input type="button" value="삭제" onclick="fnDelete('${dto.b_pwd}');" />
						<input type="button" value="수정" onclick="fnUpdate('${dto.b_pwd}');" />
						<input type="button" value="목록보기" onclick="location.href='boardList.do'" />
					</form>	
				</td>
			</tr>
		</table>
	</div>
</body>
</html>