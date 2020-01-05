<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>한글 처리 폼</title>
</head>
<body>
<%-- action.jsp : form 에 속한 submit 버튼 클릭시 호출되는 페이지 
					호출시 name 속성의 값을 파라미터로 함께 전송함
--%>
<form action = "han.jsp" method = "get">
이름:	<input type = "text" name = "name"><br>
주소:	<input type = "text" name = "addr"><br>
	<input type = "submit" value = "전송">
</form><hr>

<form action = "han.jsp" method = "post">
이름:	<input type = "text" name = "name"><br>
주소:	<input type = "text" name = "addr"><br>
	<input type = "submit" value = "전송">
</form>

</body>
</html>