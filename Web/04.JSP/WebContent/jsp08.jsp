<%@page import="com.hanul.study.MemberDTO"%>
<%@page import="com.hanul.study.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
MemberDAO dao = new MemberDAO();
MemberDTO dto = dao.getById(id);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP08</title>
<style type="text/css">
	.in {
		background-color: pink;
	}
</style>
<script type="text/javascript">
	function fnUpdate() {
		if (confirm("정말 수정하시겠습니까?")) {
			return true;
		}
		return false;
	}//fnUpdate()
	
	function fnReset() {
		if (confirm("정말 초기화하시겠습니까?")) {
			return true;
		}
		return false;
	}//fnReset()
</script>
</head>
<body>
	<div align="center">
		<h3>[회원정보 수정화면]</h3>
		<form action="jsp09.jsp" method="post" onsubmit="return fnUpdate();" onreset="return fnReset();">
			<input type="hidden" name="id" value="<%=dto.getId()%>">
			<!-- submit 버튼을 누르고 jsp09.jsp로 넘어갈때 name 속성과 값이 같이 넘어가는데 
				 여기에서 아이디의 값은 input 태그를 걸지 않았으므로
				 넘어가지 않기 때문에(id와 관련된 조건식을 걸 수 없게됨) 
				 hidden 타입을 가진 input 태그를 활용해야 한다. -->
			<table border="1">
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" value="<%=dto.getName()%>" class="in"></td>
				</tr>
				<tr>
					<th>아이디</th>
					<td><%=dto.getId() %></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pwd" value="<%=dto.getPwd()%>" class="in"></td>
				</tr>
				<tr>
					<th>나이</th>
					<td><input type="number" name="age" value="<%=dto.getAge()%>" class="in"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="addr" value="<%=dto.getAddr()%>" class="in"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="tel" value="<%=dto.getTel()%>" class="in"></td>
				</tr>
				<tr align="center">
					<td colspan="2">
						<input type="submit" value="수정하기">
						<input type="reset" value="초기화하기">
						<input type="button" value="목록보기" onclick="location.href='jsp06.jsp'"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>