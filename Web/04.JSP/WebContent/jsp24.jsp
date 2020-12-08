<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP24</title>
</head>
<body>
<%
String name = request.getParameter("name");
out.println("회원님의 이름은 " + name + "님 입니다.<br/><br/>");
out.println(name + "님께서 키우고 싶은 애완동물은 ");

// getParameterValues : 가지고 올 값이 여러 개일 때 사용하는 메소드
String[] animals = request.getParameterValues("animal");
if(animals != null) {	// checkbox에서 값이 1개라도 넘어왔을 때
	for(int i = 0; i < animals.length; i++) {
		if(i != animals.length - 1) {	
			out.println(animals[i] + ", ");
		} else {
			out.println(animals[i] + "입니다.<br/>");			
		}
	}
} else {		//checkbox에서 하나라도 선택하지 않았을 때
	out.println("선택하신 사항이 없습니다.<br/>");
}
%>
<br/>

회원님의  이름은 ${param.name }님  입니다.<br/>
${param.name }님께서 키우고 싶은 애완동물은
	${paramValues.animal[0] }
	${paramValues.animal[1] }
	${paramValues.animal[2] }
	${paramValues.animal[3] }
	${paramValues.animal[4] }
	${paramValues.animal[5] }입니다.
	<!-- 자바코드인 animals가 아닌 name 속성의 값인 animal로 접근해야한다. -->
</body>
</html>