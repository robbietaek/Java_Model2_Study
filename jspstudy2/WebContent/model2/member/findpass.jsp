<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>비밀번호</title>
<link rel = "stylesheet" href = "css/main.css">
<script>
	function exit(){
		self.close();
	}

</script>
<script>
</script>
</head>
<body>
<table><tr><th>비밀번호</th><td>**${pass}</td></tr>
<tr><td><input type = "button" value = "닫기" onclick ="exit()"></td></tr>
</table>
</body>
</html>




