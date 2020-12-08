<%@page import="com.hanul.study.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP37</title>
</head>
<body>
<%
ArrayList<MemberDTO> list = new ArrayList<>();
list.add(new MemberDTO("홍길동", "hong", "1234", 11, "광주시", "010-1111-1111"));
list.add(new MemberDTO("홍길동", "hong", "1234", 22, "광주시", "010-1111-1111"));
list.add(new MemberDTO("홍길동", "hong", "1234", 33, "광주시", "010-1111-1111"));
list.add(new MemberDTO("홍길동", "hong", "1234", 44, "광주시", "010-1111-1111"));
list.add(new MemberDTO("홍길동", "hong", "1234", 55, "광주시", "010-1111-1111"));
pageContext.setAttribute("list", list);
%>

○ JAVA for<br/>
<ul>
	<%
		for(int i = 0; i < list.size(); i++) {
			out.println("<li>" + list.get(i).getName());
			out.println(list.get(i).getId());
			out.println(list.get(i).getPwd());
			out.println(list.get(i).getAge());
			out.println(list.get(i).getAddr());
			out.println(list.get(i).getTel() + "</li>");
		}
	%>
</ul>

○ JAVA forEach<br/>
<ul>
	<%
		for(MemberDTO dto : list) {
			out.println("<li>" + dto.getName());
			out.println(dto.getId());
			out.println(dto.getPwd());
			out.println(dto.getAge());
			out.println(dto.getAddr());
			out.println(dto.getTel() + "</li>");
		}
	%>
</ul>

○ EL 문법<br/>

<ul>
	<li>${list[0].name } ${list[0].id } ${list[0].pwd } ${list[0].age } ${list[0].addr } ${list[0].tel }</li>
	<li>${list[1].name } ${list[1].id } ${list[1].pwd } ${list[1].age } ${list[1].addr } ${list[1].tel }</li>
	<li>${list[2].name } ${list[2].id } ${list[2].pwd } ${list[2].age } ${list[2].addr } ${list[2].tel }</li>
	<li>${list[3].name } ${list[3].id } ${list[3].pwd } ${list[3].age } ${list[3].addr } ${list[3].tel }</li>
	<li>${list[4].name } ${list[4].id } ${list[4].pwd } ${list[4].age } ${list[4].addr } ${list[4].tel }</li>
</ul>

○ JSTL core<br/>
<ul>
	<c:forEach var="i" items="${list }">
		<li>${i.name } ${i.id } ${i.pwd } ${i.age } ${i.addr } ${i.tel }</li>
	</c:forEach>

</ul>
</body>
</html>