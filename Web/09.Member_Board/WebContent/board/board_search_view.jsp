<%@page import="com.board.study.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	ArrayList<BoardDTO> list = new ArrayList<>();
	list = (ArrayList<BoardDTO>) request.getAttribute("list");
	
	pageContext.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board search view</title>
</head>
<body>
	<div align="center">
		<h3>[글 검색 화면]</h3>
		<table border="1">
			<tr>
				<th>번호</th>
				<th width="200">제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<c:if test="${empty list }">
				<tr><td colspan="5" align="center">검색된 글이 없습니다.</td></tr>
			</c:if>
			
			<c:forEach var="i" items="${list }">
				<tr align="center">
					<td>${i.board_num }</td>
					<td align="left">
						<a href="boardDetailAction.bo?board_num=${i.board_num }">
							${i.board_subject }
						</a>
					</td>
					<td>${i.board_id }</td>
					<td>${fn:substring(i.board_date, 0, 10) }</td>
					<td>${i.board_readcount }</td>
				</tr>
			</c:forEach>

			<tr align="center">
				<td colspan="5">
					<input type="button" value="로그아웃" onclick="location.href='memberLogout.me'" />
					<input type="button" value="목록보기" onclick="location.href='boardList.bo'" />
				</td>
			</tr>				
		</table>
	</div>
</body>
</html>