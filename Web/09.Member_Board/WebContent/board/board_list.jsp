<%@page import="com.board.study.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.member.study.MemberDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("id");
	MemberDAO dao = new MemberDAO();
	String member_pw = dao.getMember_pw(id);
	
	Integer nowPage = (int) request.getAttribute("page");
	Integer maxPage = (int) request.getAttribute("maxPage");
	Integer startPage = (int) request.getAttribute("startPage");
	Integer endPage = (int) request.getAttribute("endPage");
	Integer listCount = (int) request.getAttribute("listCount");
	ArrayList<BoardDTO> list = new ArrayList<>();
	list = (ArrayList<BoardDTO>) request.getAttribute("list");
	
	pageContext.setAttribute("nowPage", nowPage);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_list</title>
<script type="text/javascript">
	function fnModify(id, member_pw) {
		//alert("id : " + id + "\npw : " + member_pw);
		var pw = prompt("비밀번호를 입력하세요", "");
		//alert("pw : " + pw);
		
		if(member_pw == pw) {
			location.href = "memberDetailAction.me?member_id=" + id;
		} else {
			alert("비밀번호가 일치하지 않습니다!");
		}
	}
	
</script>
</head>
<body>
<div align="center">
	<h3>[자유 게시판]</h3>
		<table border="1">
			<tr>
				<th>번호</th>
				<th width="200">제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<!-- 글 목록 표시 및 페이징처리 -->
			<%
			if(list.size() == 0) {
				out.println("<tr><td>");
				out.println("작성된 글이 없습니다.</td><tr>");
			}
			for(int i = 0; i < list.size(); i ++) {
				BoardDTO dto = list.get(i);
				pageContext.setAttribute("dto", dto);
			%>
				<tr align="center">
					<td><%=dto.getBoard_num() %></td>
					<td align="left">
						<%-- <%if (dto.getBoard_re_lev() != 0) { %>
							<%for(int j = 1; j <= dto.getBoard_re_lev() * 2; j++) {%>&nbsp;<%} %>
							┕ RE:	
						<%} %>	 --%>
						<c:if test="${dto.board_re_lev ne 0 }">
							<c:forEach var="j" begin="1" end="${dto.board_re_lev * 2 }">&nbsp;</c:forEach>
							┕ RE:
						</c:if>
						<a href="boardDetailAction.bo?board_num=<%=dto.getBoard_num()%>">
							<%=dto.getBoard_subject() %>
						</a>
					</td>
					<td><%=dto.getBoard_id() %></td>
					<td><%=dto.getBoard_date().substring(0, 10) %></td>
					<td><%=dto.getBoard_readcount() %></td>
				</tr>
			<%} %>
			
			<!-- 페이징 처리 -->
			<tr align="center">
				<td colspan="5">
				<%--
					<%if (nowPage <= 1) {%>
						[이전]&nbsp;
					<%} else {%>
						<a href="boardList.bo?page=<%=nowPage - 1%>">[이전]</a>&nbsp;
					<%} %>
					
					<%for(int i = startPage; i <= endPage; i++) {%>
						<%if(i == nowPage) {%>
							[<%=i %>]&nbsp;
						<%} else {%>
							<a href="boardList.bo?page=<%=i%>">[<%=i %>]</a>&nbsp;
						<%} %>
					<%} %>
					
					<%if (nowPage >= maxPage) {%>
						[다음]&nbsp;
					<%} else {%>
						<a href="boardList.bo?page=<%=nowPage + 1%>">[다음]</a>&nbsp;
					<%} %>
				--%>
				
				<c:if test="${nowPage le 1}"> [이전]&nbsp; </c:if>
				<c:if test="${nowPage gt 1}">
					<a href="boardList.bo?page=${nowPage - 1}">[이전]</a>&nbsp;
				</c:if>
				
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${i eq nowPage}">[${i}]&nbsp;</c:if>
					<c:if test="${i ne nowPage}">
						<a href="boardList.bo?page=${i}">[${i}]</a>&nbsp;
					</c:if>
				</c:forEach>
				
				<c:if test="${nowPage ge maxPage}"> [다음]&nbsp; </c:if>
				<c:if test="${nowPage lt maxPage}">
					<a href="boardList.bo?page=${nowPage + 1}">[다음]</a>&nbsp;
				</c:if>
				
				</td>
			</tr>
			<tr>
				<td colspan="5" align="center">
					<form action="boardSearchAction.bo" method="get">
							<select name="search" id="search">
							    <option value="board_subject">제목</option>
							    <option value="board_content">내용</option>
							    <option value="board_id">작성자</option>
				  			</select>
				  			<input type="text" name="search_data" />
				  			<input type="submit" value="검색하기"/>
					</form>
	  			</td>
			</tr>
			<tr align="center">
				<td colspan="5">
					<%if(id != null && id.equals("admin")) { %>
						<input type="button" value="회원관리" onclick="location.href='memberListAction.me'" />
					<%} %>
						<input type="button" value="로그아웃" onclick="location.href='memberLogout.me'" />
						<input type="button" value="글쓰기" onclick="location.href='boardWrite.bo'" />
						<input type="button" value="회원정보수정" onclick="fnModify('<%=id %>', '<%=member_pw %>')" />
				</td>
			</tr>				
		</table>
</div>
</body>
</html>