<%@page import="com.hanul.study.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

// 1. Servlet 방식으로 값 전달받기
String name = request.getParameter("name");
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
int age = Integer.parseInt(request.getParameter("age"));
String addr = request.getParameter("addr");
String tel = request.getParameter("tel");
MemberDTO dto = new MemberDTO(name, id, pwd, age, addr, tel);

pageContext.setAttribute("dto", dto);	
// → 현재 페이지에서 사용할 바인딩 객체 생성(EL 사용가능)
//	 순수 자바 코드로 생성한 dto는 EL 문법으로 출력할 수 없다.		
%>

<!-- 2. actionTag로 값 전달받기 -->
<jsp:useBean id="actionDTO" class="com.hanul.study.MemberDTO">
	<jsp:setProperty property="*" name="actionDTO"/>
</jsp:useBean>

<%-- dto 객체를 jsp18.jsp로 넘기자 : 바인딩(연결) 객체 --%>
<%
//현재 페이지와 요청한 페이지에 사용할 바인딩 객체 생성   ▶   request Scope
request.setAttribute("dto", dto);		

%>

<jsp:forward page="jsp18.jsp"></jsp:forward>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP17</title>
</head>
<body>
○ 이름(JSP) : <%=name %><br/>					<!-- 1 -->
○ 이름(JSP) : <%=dto.getName() %><br/>		<!-- 1 -->
○ 이름(JSP) : <%=actionDTO.getName() %><br/>	<!-- 2 -->
<br/>

○ 아이디(Action Tag) : [jsp:getProperty] 매개변수로 전달 받은 상태에서는 사용 불가능<br/>		<!-- 1 -->
<!-- 즉 servlet 방식으로(순수 자바 코드로) 작성한 상태에서 jsp:getProperty를 사용할 수 없다. -->
○ 아이디(Action Tag) : [jsp:getProperty] jsp:useBean으로 생성된 객체에서만 사용 가능<br/>	<!-- 1 -->
○ 아이디(Action Tag) : <jsp:getProperty property="id" name="actionDTO"/><br/>	<!-- 2 -->
<br/>

○ 주소(EL) : ${param.addr }<br/>		<!-- 1 -->
○ 주소(EL) : ${dto.addr }<br/>		<!-- 1 : null (15번째 코드를 추가해야지만 값이 제대로 전달된다.)-->
○ 주소(EL) : ${actionDTO.addr }<br/>	<!-- 2 -->
<br/>
</body>
</html>