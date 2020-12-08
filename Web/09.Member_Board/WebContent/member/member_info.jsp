<%@page import="com.member.study.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
	MemberDTO dto = (MemberDTO) request.getAttribute("dto");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member_info</title>
</head>
<body>
	<div align="center">
		<h3>[회원 정보 상세보기]</h3>
		<table border="1">
			<tr>
				<th>아이디</th>
				<%--<td><%=dto.getMember_id() %></td> --%>
				<td>${dto.member_id }</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<%--<td>${dto.member_pw }</td> --%>
				<%
				int pwLength = dto.getMember_pw().length();
				
				String mark = dto.getMember_pw().substring(0, 2);
				// → 비밀번호 앞자리 2글자만 보이게끔 설정

				for(int i = 0; i < pwLength - 2; i++) {
					mark += "*";
				}
				out.println("<td>" + mark + "</td>");
				%>
			</tr>
			<tr>
				<th>이름</th>
				<td>${dto.member_name }</td>
			</tr>
			<tr>
				<th>나이</th>
				<td>${dto.member_age }</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>${dto.member_gender }</td>
			</tr>
			<tr>
				<th>이메일</th>
				<%--<td>${dto.member_email }</td> --%>
				<%--
				if (dto.getMember_email() == null) {
					out.println("<td>이메일이 등록되지 않았습니다.</td>");
				} else {
					out.println("<td>" + dto.getMember_email() + "</td>");
				}
				--%>
				<c:if test="${dto.member_email eq null }">
					<td>이메일이 등록되지 않았습니다.</td>
				</c:if>
				<c:if test="${dto.member_email ne null }">
					<td>${dto.member_email }</td>
				</c:if>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="회원목록보기" onclick="location.href='memberListAction.me'" />
					<input type="button" value="게시판보기" onclick="location.href='boardList.bo'" />
					<input type="button" value="로그아웃" onclick="location.href='memberLogout.me'" />
				</td>
			</tr>	
		</table>
	</div>
</body>
</html>