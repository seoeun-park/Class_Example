<%@page import="com.hanul.study.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.hanul.study.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("utf-8");
MemberDAO dao = new MemberDAO();
List<MemberDTO> list = dao.memberSearchAll();
pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member List JSP</title>
<script type="text/javascript">
	function fnDelete(id) {
		//alert("id : " + id);
		if(confirm("정말 삭제하시겠습니까?")) {
			location.href = "memberDelete.jsp?id=" + id;
		}
	}//fnDelete()
</script>
</head>
<body>
	<div align="center">
		<h3>[전체 회원 목록 보기]</h3>
		<table border="1" style="width: 80%">
			<tr>
				<th>이름</th>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>나이</th>
				<th>주소</th>
				<th>전화번호</th>
				<th>삭제</th>
				<th>수정</th>
			</tr>
			<%-- 1. for문을 이용한 출력 (자바코드)
				for(int i = 0; i < list.size(); i++) {
					out.println("<tr align='center'>");
					out.println("<td>" + list.get(i).getName() + "</td>");
					out.println("<td>" + list.get(i).getId() + "</td>");
					out.println("<td>" + list.get(i).getPw() + "</td>");
					out.println("<td>" + list.get(i).getAge() + "</td>");
					out.println("<td>" + list.get(i).getAddr() + "</td>");
					out.println("<td>" + list.get(i).getTel() + "</td>");
					out.println("</tr>");
				}
			--%>
			
			<%-- 2. forEach문을 이용한 출력 (자바코드)
				for(MemberDTO dto : list) {
					out.println("<tr align='center'>");
					out.println("<td>" + dto.getName() + "</td>");					
					out.println("<td>" + dto.getId() + "</td>");					
					out.println("<td>" + dto.getPw() + "</td>");					
					out.println("<td>" + dto.getAge() + "</td>");					
					out.println("<td>" + dto.getAddr() + "</td>");					
					out.println("<td>" + dto.getTel() + "</td>");					
					out.println("</tr>");
				}
			--%>
			
			<%-- 3. JSTL core와 EL을 이용한 출력 --%>
			<c:forEach var="i" items="${list }">
				<tr align="center">
					<td>${i.name }</td>
					<td>${i.id }</td>
					<td>${i.pw }</td>
					<td>${i.age }</td>
					<td>${i.addr }</td>
					<td>${i.tel }</td>
					<td><input type="button" value="삭제" onclick="fnDelete('${i.id}');" /></td>
					<td><input type="button" value="수정" onclick="location.href='memberDetail.jsp?id=${i.id }'" /></td>
					<!-- 문자 id도 인식하기 위해 EL 표기법을 작은 따옴표('')로 묶어야 한다. -->
				</tr>			
			</c:forEach>
			
			<tr align="center">
				<td colspan="8">
					<input type="button" value="회원가입" onclick="location.href='MemberMain.html'" />
				</td>
			</tr>	
		</table>
	</div>
</body>
</html>