<%@page import="com.hanul.study.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--
//MVC Project에서 학습했던 Servlet 코드(MVC 폴더 > Servlet03.java) : 순수 JAVA 코드(POJO)
request.setCharacterEncoding("utf-8");
String name =  request.getParameter("name");
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
int age = Integer.parseInt(request.getParameter("age"));
String addr = request.getParameter("addr");
String tel = request.getParameter("tel");

MemberDTO dto = new MemberDTO(name, id, pwd, age, addr, tel);

request.setCharacterEncoding("utf-8");
MemberDTO dto = new MemberDTO();
dto.setName(request.getParameter("name"));
dto.setId(request.getParameter("id"));
dto.setPwd(request.getParameter("pwd"));
dto.setAge(Integer.parseInt(request.getParameter("age")));
dto.setAddr(request.getParameter("addr"));
dto.setTel(request.getParameter("tel"));
--%>

<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="dto" class="com.hanul.study.MemberDTO">
	<jsp:setProperty property="*" name="dto"/>
	<%-- form에서 넘겨준 모든 값(*)을 dto로 삽입--%>
</jsp:useBean>

<jsp:useBean id="dao" class="com.hanul.study.MemberDAO"/>

<%
int succ = dao.memberInsert(dto);
if(succ > 0) {
	out.write("<script>alert('회원가입 성공!');");
	out.write("location.href='jsp05Main.html';</script>");
} else {
	out.write("<script>alert('회원가입 실패!');");
	out.write("location.href='jsp05Main.html';</script>");
}
%>



