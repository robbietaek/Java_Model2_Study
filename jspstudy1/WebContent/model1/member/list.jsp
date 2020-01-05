<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/list.jsp
   1. 로그아웃상태 : 로그인이 필요합니다. 메세지 출력
                  loginForm.jsp로 페이지 이동
   2. 로그인 상태
           일반사용자  : 관리자만 가능한 거래입니다. 메세지 출력
                 main.jsp로 페이지 이동
           관리자 : 정상적인 거래 가능.
   3. db에서 모든 회원 정보를 조회하여 List<Member> 객체로 리턴
      List<Member> list = new MemberDao().list();                       
--%>    
<%
    String login = (String)session.getAttribute("login");
    if(login==null||login.trim().equals("")){
%>
	<script>
	alert("로그인이 필요합니다.")
	location.href = "loginForm.jsp";
	</script>
<%	
   } else if(!login.equals("admin")) {
%>
	<script>
	alert("관리자만 접근할 수 있습니다..")
	location.href = "main.jsp";
	</script>
<%
   } else { //admin으로 로그인 되어 있는 경우
		List<Member> list = new MemberDao().list();        
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원목록보기</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<table><caption>회원 목록</caption>
<tr><th>아이디</th><th>이름</th><th>성별</th><th>전화</th><th>&nbsp;</th></tr>
<% for(Member m : list) {%>
<tr><td><a href="info.jsp?id=<%=m.getId()%>"><%=m.getId()%></a></td>
<td><%=m.getName()%></td>
<td><%=m.getGender()==1?"남":"여"%></td>
<td><%=m.getTel()%></td>
<td><a href="updateForm.jsp?id=<%=m.getId() %>">[수정]</a>
<% if(!m.getId().equals("admin")) {%>
<a href="delete.jsp?id=<%=m.getId() %>">[강제탈퇴]</a>
<% } %></td></tr><% } %></table></body></html><% } %>