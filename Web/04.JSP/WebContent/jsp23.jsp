<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP23</title>
</head>
<body>
<form action="jsp24.jsp" method="post">
이름 : <input type="text" name="name" required="required" /><br/>
<br/>
다음 중 회원님께서 키우고 싶은 애완동물을 선택하세요.<br/>
<input type="checkbox" name="animal" value="강아지" />강아지<br/>
<input type="checkbox" name="animal" value="라쿤" />라쿤<br/>
<input type="checkbox" name="animal" value="고양이" />고양이<br/>
<input type="checkbox" name="animal" value="햄스터" />햄스터<br/>
<input type="checkbox" name="animal" value="앵무새" />앵무새<br/>
<input type="checkbox" name="animal" value="거북이" />거북이<br/>
<input type="submit" value="전송하기" />
</form>
</body>
</html>