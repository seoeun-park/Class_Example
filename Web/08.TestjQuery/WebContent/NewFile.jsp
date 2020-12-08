<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String LINE_ID = request.getParameter("LINE_ID");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test05.jsp</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="jquery/jquery-3.5.1.js"></script>
<script type="text/javascript">
$(document).ready(function() {
   $.ajax({
      data: "LINE_ID=" + "<%= LINE_ID %>",
      dataType : "xml",
      url : "http://api.gwangju.go.kr/xml/lineStationInfo",
      success : function(data){ resultHtml(data); },
      error : function() { alert("LineStationInfo Loading Fail!!!"); }
   });
});

function resultHtml(data) {
   //alert("LineStationInfo Loading Success!!!");
   var html = "<table border = '1'>";
   html += "<tr>";
   html += "<th>노선번호</th>";
   html += "<th>노선이름</th>";
   html += "<th>정류소번호</th>";
   html += "<th>정류소이름</th>";
   html += "<th>위도</th>";
   html += "<th>경도</th>";
   html += "<th>ARS_ID</th>";
   html += "</tr>";
   
   var BUSSTOP = $(data).find("BUSSTOP");
   
   for(var i = 0; i < BUSSTOP.length; i++) {
      html += "<tr align='center'>";
      html += "<td>" + BUSSTOP.eq(i).find("LINE_ID").text() + "</td>";
      html += "<td>" + BUSSTOP.eq(i).find("LINE_NAME").text() + "</a></td>";
      html += "<td>" + BUSSTOP.eq(i).find("BUSSTOP_ID").text() + "</td>";
      html += "<td><a href='test06.jsp?BUSSTOP_ID=" + BUSSTOP.eq(i).find("BUSSTOP_ID").text() + "'>" + BUSSTOP.eq(i).find("BUSSTOP_NAME").text() + "</td>";
      html += "<td>" + BUSSTOP.eq(i).find("LONGITUDE").text() + "</td>";
      html += "<td>" + BUSSTOP.eq(i).find("LATITUDE").text() + "</td>";
      html += "<td>" + BUSSTOP.eq(i).find("RETURN_FLAG").text() + "</td>";
      html += "</tr>"
   }
   html += "</table>";
   $("#display").empty();
   $("#display").append(html);
}
</script>
</head>
<body>
<%=LINE_ID %>
<div id="display">
여기에 버스 노선 정류소 정보가 출력됩니다.
</div>
</body>
</html>