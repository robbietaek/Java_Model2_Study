<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�۾���</title>

</head>
<body>
	<form action ="book.jsp" method = "post" onsubmit="return next(this)">
		�湮�� : <input type="text" name="visitor" ><br>
		<br> ���� : <input type="text" name="subject" ><br><br>
		 <td>���� :</td><br> <textarea name="poster" cols = "50" rows = "20"></textarea>
		 <br>
		 <input	type="submit" value="����" style='align : right;'>
	</form>
</body>
</html>