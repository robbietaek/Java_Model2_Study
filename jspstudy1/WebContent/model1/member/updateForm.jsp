<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/updateForm.jsp 
  1. id 파라미터 조회
  2. login 정보 조회. 
         로그인 안된경우 : "로그인하세요" 메세지 출력. loginForm.jsp 페이지 이동
  3. 로그인 된경우 : 로그인이 admin이 아니면서 다른사람의 정보 조회  하면
                 "내 정보 수정만 가능합니다." 메세지 출력. main.jsp 페이지 이동
  4. id의 정보를 db에서 읽어서 Member 객체에 저장
  5. Member 객체를 화면에 출력.               
--%>    
<%
	String id = request.getParameter("id");
	String login = (String)session.getAttribute("login");
	if(login == null || login.trim().equals("")){ %>
		<script>
			alert("로그인하세요");
			location.href="loginForm.jsp";
		</script>	
	<%} else if(!login.equals("admin") && (!id.equals(login))){%>
		<script>
			alert("내 정보 수정만 가능합니다.");
			location.href="main.jsp";
		</script>
<%} else {
	Member mem = new MemberDao().selectOne(id);
%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 수정 </title>
<link rel="stylesheet" href="../../css/main.css">
<script type="text/javascript">
    function win_upload() {
 	   var op = "width=500, height=150, left=50,top=150";
	   open("pictureForm.jsp","",op);    	
    }
    function win_passchg() {
 	   var op = "width=500, height=230, left=50,top=150";
 	   open("passwordForm.jsp","",op);
    }    
   function  inputcheck(f) {
<% if (!login.equals("admin")) {%>	   
	   if(f.pass.value == "") {
		   alert("비밀번호를 입력하세요");
		   f.pass.focus();
		   return false;
	   }
  <% } %>	   
   }
</script>
</head>
<body>
<form action="update.jsp" name="f" method="post" 
       onsubmit="return inputcheck(this)">
   <input type="hidden" name="picture" value="<%=mem.getPicture()%>">
<table><caption>회원 정보 수정</caption>
<tr><td rowspan="4" valign="bottom">
  <img src="picture/<%=mem.getPicture() %>" width="100" height="120" id="pic"><br>
  <font size="1"><a href="javascript:win_upload()">사진수정</a></font>
</td><th>아이디</th><td><input type="text" name="id" readonly value="<%=mem.getId()%>"></td></tr>
<tr><td>비밀번호</td><td><input type="password" name="pass" ></td></tr>
<tr><td>이름</td><td><input type="text" name="name" value="<%=mem.getName()%>"></td></tr>
<tr><td>성별</td>
     <td><input type="radio" name="gender" value="1"
     <%=mem.getGender()==1?"checked":""%>>남
        <input type="radio" name="gender" value="2"
     <%=mem.getGender()==2?"checked":""%>>여</td></tr>
<tr><td>전화번호</td>
<td colspan="2"><input type="text" name="tel" value="<%=mem.getTel()%>"></td></tr>
<tr><td>이메일</td>
<td colspan="2"><input type="text" name="email" value="<%=mem.getEmail()%>"></td></tr>
<tr><td colspan="3"><input type="submit" value="회원수정">
<input type="button" value="비밀번호수정" 
          onclick="win_passchg()"></td></tr>
</table></form></body></html>
<%} %>