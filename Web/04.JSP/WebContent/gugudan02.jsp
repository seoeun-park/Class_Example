<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
	<h3>[구구단 출력]</h3>
	<table border="1">
		<tr bgcolor="#B76AAD">
			<%for(int i = 2; i <= 9; i++) {%>
				<th style="color: white;"><%=i%> 단</th>
			<%} %>
		</tr>
		<%for(int i = 1; i <= 9; i++) { %>
			<%if(i % 2 == 0) {%>
				<tr align="center" bgcolor="aqua">
			<%} else { %>
				<tr align="center" bgcolor="pink">
			<%} %>
					<%for(int j = 2; j <= 9; j++) {%>
						<td>
							<%if(i * j < 10) { %>
								<%=j + " X " + i + " = 0" + (i*j) %>
							<%} else {%>
								<%=j + " X " + i + " = " + (i*j) %>
							<%} %>
						</td>
					<%} %>
				</tr>
		<%} %>
	</table>
</div>
</body>
</html>