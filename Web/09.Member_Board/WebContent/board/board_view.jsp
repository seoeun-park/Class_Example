<%@page import="com.board.study.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	request.setCharacterEncoding("utf-8");
	BoardDTO dto = (BoardDTO) request.getAttribute("dto");
	
	// 내용 줄바꿈 처리 방법 ①
	// POJO를 이용한 게시판 줄바꿈 처리
	String board_content = dto.getBoard_content();
	String replaceContent = board_content.replace("\r\n", "<br/>");
	
	// 내용 줄바꿈 처리 방법 ②
	// JSTL을 이용한 게시판 줄바꿈 처리
	pageContext.setAttribute("enter", "\r\n");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_view</title>
<script type="text/javascript">
	function fnReply(board_num) {
		//alert(board_num);
		if(confirm("답글을 작성하시겠습니까?")) {
			location.href = "boardReplyView.bo?board_num=" + board_num;
		}
		
	} //fnReply()
	
	function fnUpdate(board_num) {
		//alert(board_num);
		if(confirm("수정하시겠습니까?")) {
			location.href = "boardModifyView.bo?board_num=" + board_num;
		}
		return false;
		
	}//fnUpdate() 
	
	function fnDelete(board_num) {
		//alert(board_num);
		if(confirm("정말 삭제하시겠습니까?")) {
			location.href = "boardDeleteAction.bo?board_num=" + board_num;
		}
		return false;
	}//fnDelete()

</script>
</head>
<body>
	<div align="center">
		<h3>[상세 글 보기]</h3>
		<table border="1">
			<tr>
				<th>제목</th>
				<td>${dto.board_subject }</td>
				<th>조회수</th>
				<td align="center">${dto.board_readcount }</td>
			</tr>
			<tr>
				<th>내용</th>
				<!-- 내용 줄바꿈 처리 방법 ① : POJO -->
				<%-- <td colspan="2" width="500"><%=replaceContent</td> --%>
				
				<!-- 내용 줄바꿈 처리 방법 ② : JSTL -->
				<td colspan="3" width="500">
					${fn:replace(dto.board_content, enter, "<br/>") }
				</td>
			</tr>
			<tr>
				<th>첨부 파일</th>
				<td colspan="3">
					<c:if test="${empty dto.board_file }">
						첨부된 파일이 없습니다.						
					</c:if>
					<c:if test="${not empty dto.board_file }">
						<a href="boardupload/${dto.board_file}">${dto.board_file }</a>					
					</c:if>
				</td>
			</tr>
			<tr align="center">
				<td colspan="4">
					<input type="button" value="답글쓰기" onclick="fnReply('${dto.board_num}')" />
					<input type="button" value="수정하기" onclick="fnUpdate('${dto.board_num}')" />
					<input type="button" value="삭제하기" onclick="fnDelete('${dto.board_num}')" />
					<input type="button" value="목록보기" onclick="location.href='boardList.bo'" />
				</td>
			</tr>
		</table>
	</div>
</body>
</html>