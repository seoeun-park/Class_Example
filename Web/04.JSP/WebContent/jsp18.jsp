<%@page import="com.hanul.study.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
// jsp17.jsp에서 넘겨준 바인딩 객체를 받는다(동적 바인딩).
// url은 jsp17.jsp으로 변하지 않지만 실제로 값을 전달한 곳은 jsp18.jsp이다.
request.setCharacterEncoding("utf-8");
MemberDTO dto = (MemberDTO) request.getAttribute("dto");

//전달받은 dto 객체를 jsp19.jsp로 넘기자 (1)
//RequestDispatcher rd = request.getRequestDispatcher("jsp19.jsp");
//rd.forward(request, response);
%>

<!-- 전달받은 dto 객체를 jsp19.jsp로 넘기자 (1) -->
<jsp:forward page="jsp19.jsp"></jsp:forward>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP18</title>
</head>
<body>
○ 이름(JSP) : <%=dto.getName() %><br/>
○ 주소(EL) : ${dto.addr }<br/>			
<!-- request.setAttribute("dto", dto);을 작성하지 않아도 
	 현재 페이지에서 요청한 페이지로 값을 전달했기 때문에 EL로도 작성이 가능하다. -->
</body>
</html>