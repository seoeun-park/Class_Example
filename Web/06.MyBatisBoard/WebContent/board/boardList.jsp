<%@page import="com.hanul.dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("utf-8");
List<BoardDTO> list = (List<BoardDTO>) request.getAttribute("list");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardList</title>
</head>
<body>
	<div align="center">
		<h3>[게시판 전체목록 보기]</h3>
		<table border="1" style="width: 80%">
			<tr>
				 <th>번호</th>
				 <th>제목</th>
				 <th>작성자</th>
				 <th>작성일</th>
				 <th>조회수</th>
			</tr>
			<!-- JSTL core 문법을 이용한 출력 : b_num_seq에 의해서 번호의 순서가 안맞다. -->
			<c:if test="${empty list} ">
				<tr align="center">
					<td colspan="5">작성된 글이 없습니다.</td>
				</tr>
			</c:if>
			<%-- 			
			<c:if test="${list ne null }">
				<c:forEach var="i" items="${list }">
					<tr align="center">
						<td>${i.b_num }</td>
						<td>${i.b_subject }</td>
						<td>${i.b_writer }</td>
						<td>${i.b_date }</td>
						<td>${i.b_readcount }</td>
					</tr>
				</c:forEach>
			</c:if> 
			--%>
			
			<!-- 향상된 for문을 이용한 출력 : 번호 순서가 맞지 않다. -->
			<%--
				if(list.size() == 0) {
					out.println("<tr align='center'><td colspan='5'>작성된 글이 없습니다.</td></tr>");
				} else {
					for(BoardDTO dto : list) {
						out.println("<tr align='center'>");
						out.println("<td> " + dto.getB_num() + "</td>");
						out.println("<td> " + dto.getB_subject() + "</td>");
						out.println("<td> " + dto.getB_writer() + "</td>");
						out.println("<td> " + dto.getB_date() + "</td>");
						out.println("<td> " + dto.getB_readcount() + "</td>");
						out.println("</tr>");
					}//for
				}//if-else
			--%>
			
			<%
				if(list.size() == 0) {
					out.println("<tr align='center'><td colspan='5'>작성된 글이 없습니다.</td></tr>");
				} else {
					for(int i = 0; i < list.size(); i++) {
						out.println("<tr align='center'>");
						/* out.println("<td> " + list.get(i).getB_num() + "</td>"); */
						out.println("<td> " + (list.size() - i) + "</td>");
						out.println("<td><a href='boardDetail.do?b_num=" + list.get(i).getB_num() + "'>" 
									+ list.get(i).getB_subject() + "</a></td>");
						out.println("<td> " + list.get(i).getB_writer() + "</td>");
						out.println("<td> " + list.get(i).getB_date() + "</td>");
						out.println("<td> " + list.get(i).getB_readcount() + "</td>");
						out.println("</tr>");
					}//for
				}//if-else				
			%>
			
			<tr align="center">
				<td colspan="5">
					<form action="boardSearch.do" method="post">
						<select name="part">
							<option value="b_subject">제목</option>
							<option value="b_content">내용</option>
							<option value="b_writer">작성자</option>							
						</select>
						<input type="text" name="searchData" required="required" />
						<input type="submit" value="검색하기" />
						<input type="button" value="글쓰기" onclick="location.href='boardInsertForm.do'" />
					</form>
				</td>
			</tr>
		</table>
	</div>

</body>
</html>