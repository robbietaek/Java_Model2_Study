<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Session ��ü</title>
</head>
<body>
<h2>session ��ü : �������� ���������� �����ϴ� ��ü</h2>
<%
	session.setMaxInactiveInterval(10);	/* ������ �����ð��� 10�ʷ� ���� ��*/
%>
<h3>session ����</h3>
isNew() : <%=session.isNew()%><br>	<%--���� ����ž�? �ƴϾ� ���� �ִ��ž� --%>
�����ð� : <%=session.getCreationTime() %><br>
�������ӽð� : <%=session.getLastAccessedTime() %><br>
sessionId : <%=session.getId()%>

</body>
</html>