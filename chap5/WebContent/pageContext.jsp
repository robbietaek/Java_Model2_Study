<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>pageContext ����</title>
</head>
<body>
<h2>pageContext ��ü : ���� �������� �ڿ��� �����ϴ� ��ü</h2>
<%
	if(request == pageContext.getRequest()){
%>
	request ��ü�� pageContext.getRequest() �� ���� ��ü��<br>
<%}%>
<%
	if(response == pageContext.getResponse()){
%>
	response ��ü�� pageContext.getResponse() �� ���� ��ü��<br>
<%}%>

<%
	if(session == pageContext.getSession()){
%>
	response ��ü�� pageContext.getSession() �� ���� ��ü��<br>
<%}%>


</body>
</html>