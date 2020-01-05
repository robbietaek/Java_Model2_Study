<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>


<%
	String email = request.getParameter("email");
	String tel = request.getParameter("tel");
	MemberDao dao = new MemberDao();
	String id = dao.findId(email, tel);
	if(id != null){	//id 찾은경우
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>아이디 찾기</title>
<link rel = "stylesheet" href = "css/main.css">
<script>
	function idsend(id){
	opener.document.f.id.value = id;
	self.close();
	}
</script>
</head>
<body>
<table><tr><th>아이디</th>
<td><%=id.substring(0,id.length()-2)+"**"%></td></tr>
	<tr><td colspan = "2">
		<input type = "button" value = "아이디 전송" onclick ="idsend('<%=id.substring(0,id.length()-2) %>')"></td></tr>
</table>
</body>
</html>

<%} else{ //id를 찾을 수 없는 경우%>
<script>
	alert("정보에 맞는 id를 찾을 수 없습니다.");
	location.href = "findidForm.jsp";
</script>
<%} %>
