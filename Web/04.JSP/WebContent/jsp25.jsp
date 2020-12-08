<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--
int num1 = Integer.parseInt(request.getParameter("num1"));
int num2 = Integer.parseInt(request.getParameter("num2"));
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP25</title>
</head>
<body>
<%--
num1의 값(JSP) : <%=num1 %><br/>
num2의 값(JSP) : <%=num2 %><br/>
--%>
num1의 값(EL) : ${param.num1 }<br/>
num2의 값(EL) : ${param.num2 }<br/>
num1 + num2 : ${param.num1 } + ${param.num2 }<br/>
num1 + num2 : ${param.num1 + param.num2 }<br/>
num1 - num2 : ${param.num1 - param.num2 }<br/>
num1 * num2 : ${param.num1 * param.num2 }<br/>
num1 / num2 : ${param.num1 / param.num2 }<br/>
num1 div num2 : ${param.num1 div param.num2 }<br/>
num1 % num2 : ${param.num1 % param.num2 }<br/>
num1 mod num2 : ${param.num1 mod param.num2 }<br/>
<br/>

num1이 더 크나요? ${param.num1 - param.num2 > 0 }<br/>
num1이 더 크나요? ${param.num1 > param.num2 }<br/>
num1이 더 크나요? ${param.num1 gt param.num2 }<br/>
num1이 더 크나요? ${param.num1 gt param.num2 ? "예" : "아니오" }<br/>
num1과 num2가 같나요? ${param.num1 eq param.num2 ? "예" : "아니오" }<br/>
<!-- 
> 	:	gt
>=	:	ge
<	:	lt
<=	:	le
==	:	eq
!=	: 	ne
empty : 값이 Null이거나 컬렉션의 사이즈가 0일 경우 true 반환
-->
</body>
</html>