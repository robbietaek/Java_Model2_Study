<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>pageContext 예제</title>
</head>
<body>
<h2>pageContext 객체 : 현재 페이지의 자원을 관리하는 객체</h2>
<%
	if(request == pageContext.getRequest()){
%>
	request 객체와 pageContext.getRequest() 는 같은 객체임<br>
<%}%>
<%
	if(response == pageContext.getResponse()){
%>
	response 객체와 pageContext.getResponse() 는 같은 객체임<br>
<%}%>

<%
	if(session == pageContext.getSession()){
%>
	response 객체와 pageContext.getSession() 는 같은 객체임<br>
<%}%>


</body>
</html>