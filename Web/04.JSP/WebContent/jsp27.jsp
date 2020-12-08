<%@page import="com.hanul.study.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
//study[] 배열을 초기화   →  바인딩(연결) 객체  : request →  jsp28.jsp 출력
String[] study = {"JAVA", "View", "SQL", "Servlet/JSP/SPRING", "Android", "Iot", "Project"};
request.setAttribute("study", study);

//ArrayList<> 배열을 생성하고 초기화   → 바인딩(연결) 객체  → jsp28.jsp 출력
ArrayList<String> list = new ArrayList<>();
list.add("자두");
list.add("수박");
list.add("오렌지");
list.add("복숭아");
list.add("키위");
request.setAttribute("list", list);

//MemberDTO 객체를 생성하고 초기화   → 바인딩(연결) 객체  → jsp28.jsp 출력
MemberDTO dto = new MemberDTO();
dto.setName("한울");
dto.setId("hanul");
dto.setPwd("1234");
dto.setAge(27);
dto.setAddr("광주시 서구 경열로 3");
dto.setTel("062-362-7797");
request.setAttribute("dto", dto);

//ArrayList<> 구조에 MemberDTO 객체 배열 생성   → 바인딩(연결) 객체  → jsp28.jsp 출력
ArrayList<MemberDTO> mlist = new ArrayList<>();
mlist.add(new MemberDTO("홍길동", "hong", "1234", 11, "광주시", "010-1111-1111"));
mlist.add(new MemberDTO("홍길동", "hong", "1234", 22, "광주시", "010-1111-1111"));
mlist.add(new MemberDTO("홍길동", "hong", "1234", 33, "광주시", "010-1111-1111"));
mlist.add(new MemberDTO("홍길동", "hong", "1234", 44, "광주시", "010-1111-1111"));
mlist.add(new MemberDTO("홍길동", "hong", "1234", 55, "광주시", "010-1111-1111"));
request.setAttribute("mlist", mlist);
%>

<jsp:forward page="jsp28.jsp"/>


