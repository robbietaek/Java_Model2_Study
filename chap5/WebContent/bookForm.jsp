<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>글쓰기</title>

</head>
<body>
	<form action ="book.jsp" method = "post" onsubmit="return next(this)">
		방문자 : <input type="text" name="visitor" ><br>
		<br> 제목 : <input type="text" name="subject" ><br><br>
		 <td>내용 :</td><br> <textarea name="poster" cols = "50" rows = "20"></textarea>
		 <br>
		 <input	type="submit" value="제출" style='align : right;'>
	</form>
</body>
</html>