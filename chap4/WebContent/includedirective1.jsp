<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>include ���þ�</title>
</head>
<body>
<%
	String msg = "includedirective1.jsp �������� msg ����";
%>
<h1>includedirective1.jsp �Դϴ�.</h1><br>
<%@ include file = "includedirective2.jsp" %>
<h2>include Directive(���þ�)�� �ٸ� �������� ������ �� �ֽ��ϴ�.<br>
	���� �ΰ��� jsp�� ���� �������� ��ȯ�ǹǷ� ������ ������ �� �ֽ��ϴ�.
</h2>
</body>
</html>