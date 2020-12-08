<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<% 
request.setCharacterEncoding("utf-8");
ArrayList<DTO> list = (ArrayList<DTO>) request.getAttribute("list");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h3>출력 결과</h3>
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>성명</th>
				<th>급여</th>
				<th>부서 이름</th>
				<th>업무명</th>
			</tr>
			<%for(int i = 0; i < list.size(); i++) {
				DTO dto = list.get(i);
			%>
			<tr>
				<td><%=dto.getEmployee_id() %></td>
				<td><%=dto.getEmployee_name() %></td>
				<td><%=dto.getSalary() %></td>
				<td><%=dto.getDepartment_name() %></td>
				<td><%=dto.getJob_title() %></td>
			</tr>
			<%} %>
		</table>
	</div>
</body>
</html>