<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>include 지시어</title>
</head>
<body>
<%
	String msg = "includedirective1.jsp 페이지의 msg 변수";
%>
<h1>includedirective1.jsp 입니다.</h1><br>
<%@ include file = "includedirective2.jsp" %>
<h2>include Directive(지시어)는 다른 페이지를 포함할 수 있습니다.<br>
	또한 두개의 jsp는 같은 서블릿으로 변환되므로 변수를 공유할 수 있습니다.
</h2>
</body>
</html>