<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model2/member/loginForm.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인 화면</title>
<script type="text/javascript">
   function win_open(page) {
	   var op = "width=500, height=350, left=50,top=150";
	   open(page+".me","",op);
   }
</script>

</head>
<body>
<form action="login.me" method="post" name="f">
<table  class="w3-table-all">
  <caption>로그인</caption>
  <tr><th class="w3-center w3-blue">아이디</th>
      <td><input type="text" name="id" 
           class="w3-input w3-skyblue"></td></tr>
  <tr><th class="w3-center w3-blue">비밀번호</th>
  <td><input type="password" name="pass" class="w3-input w3-skyblue"></td></tr>
  <tr><td colspan="2"  class="w3-center">
     <input type="submit" value="로그인" class="w3-circle">
     <input type="button" value="회원가입"
        onclick="location.href='joinForm.jsp'" class="w3-circle">
     <input type="button" value="아이디찾기"
                  onclick="win_open('idForm')" class="w3-circle">
     <input type="button" value="비밀번호찾기" 
                  onclick="win_open('pwForm')" class="w3-circle">
  </td></tr></table></form></body></html>