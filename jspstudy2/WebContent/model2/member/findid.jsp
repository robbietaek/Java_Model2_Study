<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���̵� ã��</title>
<link rel = "stylesheet" href = "css/main.css">
<script>
	function idsend(id){
	opener.document.f.id.value = id;
	self.close();
	}
</script>
</head>
<body>
<table><tr><th>���̵�</th>
<td>${id.substring(0,id.length()-2)}**</td></tr>
	<tr><td colspan = "2">
		<input type = "button" value = "���̵� ����" onclick ="idsend('${id.substring(0,id.length()-2)}')"></td></tr>
</table>
</body>
</html>




