<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��й�ȣ</title>
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
<table><tr><th>��й�ȣ</th><td>**${pass}</td></tr>
<tr><td><input type = "button" value = "�ݱ�" onclick ="exit()"></td></tr>
</table>
</body>
</html>




