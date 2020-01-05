<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/loginForm.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인 화면</title>

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
  <caption>로그인</caption>
  <tr><th>아이디</th><td><input type="text" name="id"></td></tr>
  <tr><th>비밀번호</th><td><input type="password" name="pass"></td></tr>
  <tr><td colspan="2">
     <input type="submit" value="로그인">
     <input type="button" value="회원가입"
        onclick="location.href='joinForm.me'">
     <input type = "button" onclick = "open_id()" value = "아이디 찾기">
     <input type = "button" onclick = "open_pass()" value = "비밀번호 찾기">
  </td></tr></table></form></body></html>