<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/loginForm.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α��� ȭ��</title>

<link rel="stylesheet" href="../../css/main.css">
<script type="text/javascript">

 var oi;
 var op;
function open_id(){
	oi = open("findidForm.me", "id","width=600, height = 300, menubar=no, top=200, left=200");
}

function open_pass(){
	op = open("findpassForm.me", "pass","width=600, height = 300, menubar=no, top=200, left=200");
}
	
</script>
</head>
<body>
<form action="login.me" method="post" name = "f">
<table>
  <caption>�α���</caption>
  <tr><th>���̵�</th><td><input type="text" name="id"></td></tr>
  <tr><th>��й�ȣ</th><td><input type="password" name="pass"></td></tr>
  <tr><td colspan="2">
     <input type="submit" value="�α���">
     <input type="button" value="ȸ������"
        onclick="location.href='joinForm.me'">
     <input type = "button" onclick = "open_id()" value = "���̵� ã��">
     <input type = "button" onclick = "open_pass()" value = "��й�ȣ ã��">
  </td></tr></table></form></body></html>