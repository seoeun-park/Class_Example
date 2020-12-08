<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String LINE_ID = request.getParameter("LINE_ID");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>죽여줘</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="jquery/jquery-3.5.1.js"></script>
<script>
	$(document).ready(function() {
		$.ajax({
			dataType : "xml",
			url : "http://api.gwangju.go.kr/xml/lineStationInfo",
			data : "LINE_ID=" + "<%= LINE_ID %>",
			success : function(data) { resultHtml(data); },
			error : function() { alert("Lineinfo Loading Fail!"); }
		}); //ajax
	}); //ready()
	
	function resultHtml(data) {
		//alert("LineInfo Loading Success!");
		
		var html = "<table border='1'>";
		html += "<tr>";
		html += "<th>노선번호</th>";
		html += "<th>노선이름</th>";
		html += "<th>정류소번호</th>";
		html += "<th>정류소이름</th>";
		html += "<th>위도</th>";
		html += "<th>경도</th>";
		html += "<th>ARS 번호</th>";
		html += "</tr>";
		
		var BUSSTOP = $(data).find("BUSSTOP");
		
 		for(var i = 0; i < BUSSTOP.length; i++) {
			html += "<tr align='center'>";
			html += "<td>" + BUSSTOP.eq(i).find("LINE_ID").text() + "</td>";
			html += "<td>" + BUSSTOP.eq(i).find("LINE_NAME").text() + "</td>";
			
			var BUSSTOP_ID = BUSSTOP.eq(i).find("BUSSTOP_ID").text();
			
			html += "<td>" + BUSSTOP.eq(i).find("BUSSTOP_ID").text() + "</td>";
			html += "<td><a href='test06.jsp?BUSSTOP_ID=" + BUSSTOP_ID + "'>" + BUSSTOP.eq(i).find("BUSSTOP_NAME").text() + "</td>";
			html += "<td>" + BUSSTOP.eq(i).find("LONGITUDE").text() + "</td>";
			html += "<td>" + BUSSTOP.eq(i).find("LATITUDE").text() + "</td>";
			html += "<td>" + BUSSTOP.eq(i).find("ARS_ID").text() + "</td>";
		    html += "</tr>";
		} //for
		
		html += "</table>";
		$("#display").html(html);
	}				
</script>
</head>
<body>
<%=LINE_ID %>
	<div id="display">
	
	</div>
</body>
</html>

