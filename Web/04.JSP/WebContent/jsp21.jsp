<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
int sum = 0;
for(int i = 1; i <= 100; i++) {
	sum += i;
}

//sum 결과값을 현재 페이지 출력 : EL 문법에 사용하기 위해 바인딩(연결) 객체 생성
pageContext.setAttribute("sum", sum);

//sum 결과값을 jsp22.jsp로 넘기자   ▶  바인딩 객체 생성 : request
request.setAttribute("sum", sum);
//RequestDispatcher rd = request.getRequestDispatcher("jsp22.jsp");	//페이지 호출
//rd.forward(request, response);		//페이지 전환
%>

<!-- Action Tag를 이용하여 페이지 호출 & 페이지 전환 -->
<jsp:forward page="jsp22.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP21</title>
</head>
<body>
○ JSP 출력 : <%=sum %><br/>
○ EL 출력 : ${sum }<br/>
</body>
</html>