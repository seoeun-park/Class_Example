<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
session.getAttribute("cart");
session.removeAttribute("cart");

session.invalidate();	//모든 세션이 제거된다.

response.sendRedirect("ShopMallMain.jsp");
%>
