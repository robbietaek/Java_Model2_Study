<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- page ���þ� ���� �Ӽ�ä����� ���� �������� Ư¡�� �����ϴ� ��� 
	language = "java" :�⺻���. �⺻�� java ��������
	contentType : �ݵ�� ����ؾ���. text/html; = > html �������� �ۼ� ����.
					charset = EUC-KR => �ѱ��� EUC-KR�� ����.
					pageEncoding = "EUC-KR" ����� ����
	import : Ŭ������ ��Ű������ �����ϴ� ���. ������ ó�� ����
-->
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	Date today = new Date();
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>

���� �Ͻ� : <%=df.format(today)%>
</body>
</html>