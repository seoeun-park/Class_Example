<%@page import="net.htmlparser.jericho.Source"%>
<%@page import="com.hanul.study.GjbusDAO"%>
<%@page import="java.io.FileReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
GjbusDAO dao = new GjbusDAO();
Source source = dao.makeJson();
String json = source.toString();
//System.out.println(json);

int beginIndex = json.indexOf("[");
int endIndex = json.indexOf("]");

json = json.substring(beginIndex, endIndex + 1);
%>

<%= json %>
