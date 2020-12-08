<%@page import="com.hanul.study.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String[] studyJSP = (String[]) request.getAttribute("study");
ArrayList<String> listJSP = (ArrayList<String>) request.getAttribute("list");
MemberDTO dtoJSP = (MemberDTO)request.getAttribute("dto");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP28</title>
</head>
<body>
[배열을 받는 방법(JSP) - 1]<br/>
<%for(int i = 0; i < studyJSP.length; i++) {%>
studyJSP[] 배열의 <%=i %> 인덱스 값 : <%=studyJSP[i] %><br/>
<%} %>
<br/>

[배열을 받는 방법(JSP) - 2]<br/>
<%
for(int i = 0; i < studyJSP.length; i++) {
	out.println("studyJSP[] 배열의 " + i + "인덱스 값 : " + studyJSP[i] + "<br/>");
}
%>
<br/>
[배열을 받는 방법(EL)]<br/>
study[] 배열의 0 인덱스 값 : ${study[0] }<br/>
study[] 배열의 1 인덱스 값 : ${study[1] }<br/>
study[] 배열의 2 인덱스 값 : ${study[2] }<br/>
study[] 배열의 3 인덱스 값 : ${study[3] }<br/>
study[] 배열의 4 인덱스 값 : ${study[4] }<br/>
study[] 배열의 5 인덱스 값 : ${study[5] }<br/>
study[] 배열의 6 인덱스 값 : ${study[6] }<br/>
<!-- EL 표기법은 현재 페이지에서 자바코드로 만든 studyJSP로 접근하지 않아도
	 jps27.jsp에서 넘어온 배열 study로 접근이 가능하다. -->
<br/>

[무한배열을 받는 방법(JSP)]<br/>
<%
for(int i = 0; i < listJSP.size(); i++) {
	out.println("ArrayList<> 배열의 " + i + " 인덱스 값 : " + listJSP.get(i) + "<br/>");
}
%>
<br/>

[무한배열을 받는 방법(EL)]<br/>
ArrayList&lt;&gt; 배열의 0 인덱스 값 : ${list[0] }<br/>
ArrayList&lt;&gt; 배열의 1 인덱스 값 : ${list[1] }<br/>
ArrayList&lt;&gt; 배열의 2 인덱스 값 : ${list[2] }<br/>
ArrayList&lt;&gt; 배열의 3 인덱스 값 : ${list[3] }<br/>
ArrayList&lt;&gt; 배열의 4 인덱스 값 : ${list[4] }<br/>
<br/>

[객체를 받는 방법(JSP)]<br/>
이름 : <%=dtoJSP.getName() %><br/>
아이디 : <%=dtoJSP.getId() %><br/>
비밀번호 : <%=dtoJSP.getPwd() %><br/>
나이 : <%=dtoJSP.getAge() %><br/>
주소 : <%=dtoJSP.getAddr() %><br/>
전화번호 : <%=dtoJSP.getTel() %><br/>
<br/>
	 
[객체를 받는 방법(EL)]<br/>
이름 : ${dto.name }<br/>
아이디 : ${dto.id }<br/>
비밀번호 : ${dto.pwd }<br/>
나이 : ${dto.age }<br/>
주소 : ${dto.addr }<br/>
전화번호 : ${dto.tel }<br/>
<br/>

[리스트 구조에 객체가 저장된 객체 배열을 받는 방법(EL)]<br/>
mlist 0 인덱스 값 : ${mlist[0].name }, ${mlist[0].id }, ${mlist[0].pwd }, ${mlist[0].tel }<br/>
mlist 4 인덱스 값 : ${mlist[4].name }, ${mlist[4].id }, ${mlist[4].pwd }, ${mlist[4].tel }<br/>

<br/>
</body>
</html>