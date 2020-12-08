<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String BUSSTOP_ID = request.getParameter("BUSSTOP_ID");
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
			url : "http://api.gwangju.go.kr/xml/arriveInfo",
			data : "BUSSTOP_ID=" + "<%= BUSSTOP_ID %>",
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
		html += "<th>버스번호</th>";
		html += "<th>광역 FLAG</th>";
		html += "<th>정류소이름</th>";
		html += "<th>차량속도</th>";
		html += "<th>차량 도착 예상 시간</th>";
		html += "<th>차량 남은 정류소 개수</th>";
		html += "<th>출발지</th>";
		html += "<th>도착지</th>";
		html += "<th>도착지</th>";
		html += "<th>도착 코드</th>";
		html += "<th>운행구분</th>";
		html += "</tr>";
		
		var ARRIVE = $(data).find("ARRIVE");
		
 		for(var i = 0; i < ARRIVE.length; i++) {
			html += "<tr align='center'>";
			html += "<td>" + ARRIVE.eq(i).find("LINE_ID").text() + "</td>";
			html += "<td>" + ARRIVE.eq(i).find("LINE_NAME").text() + "</td>";
			html += "<td>" + ARRIVE.eq(i).find("BUS_ID").text() + "</td>";
			html += "<td>" + ARRIVE.eq(i).find("METRO_FLAG").text() + "</td>";
			html += "<td>" + ARRIVE.eq(i).find("BUSSTOP_NAME").text() + "</td>";
			html += "<td>" + ARRIVE.eq(i).find("SPEED").text() + "</td>";
			html += "<td>" + ARRIVE.eq(i).find("REMAIN_MIN").text() + "</td>";
			html += "<td>" + ARRIVE.eq(i).find("REMAIN_STOP").text() + "</td>";
			html += "<td>" + ARRIVE.eq(i).find("DIR_START").text() + "</td>";
			html += "<td>" + ARRIVE.eq(i).find("DIR_END").text() + "</td>";
			html += "<td>" + ARRIVE.eq(i).find("LOW_BUS").text() + "</td>";
			html += "<td>" + ARRIVE.eq(i).find("ARRIVE_FLAG").text() + "</td>";
			html += "<td>" + ARRIVE.eq(i).find("FIRST_LAST_BUS").text() + "</td>";
		    html += "</tr>";
		} //for
		
		html += "</table>";
		$("#display").html(html);
	}
	
	
</script>
</head>
<body>
<%=BUSSTOP_ID %>
	<div id="display">
	
	</div>
</body>
</html>

