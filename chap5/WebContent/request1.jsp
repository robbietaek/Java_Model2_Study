<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���۵� �Ķ����  ����</title>
<style type="text/css">
table {
border-collapse: collapse;
background : aqua;
}</style>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String gender = request.getParameter("gender");
	String hobby = request.getParameter("hobby");
	String year = request.getParameter("year");
%>

�̸� : <%=name %><br>
���� : <%=age %><br>
���� : <%=gender.equals("1")?"��":"��" %><br>
��� : <%=hobby %><br>
���� : <%=year %><br>
<h1>������� ��� ��ȸ�ϱ�</h1>
<%
String[] hobbies = request.getParameterValues("hobby");
for(String h : hobbies){%>
	<%=h%>&nbsp;&nbsp;
<%}%><br>
<h3>��� �Ķ���� ���� ��ȸ�ϱ�</h3>
<table><tr><th>�Ķ���� �̸�</th><th>�Ķ���Ͱ�></th></tr>
<%
//getParameterNames() : �Ķ���� �̸���
//Enumeration : Iterator ������. �ݺ���
	Enumeration e = request.getParameterNames();
	while(e.hasMoreElements()){
		String pname = (String)e.nextElement();
		String[] pvalue = request.getParameterValues(pname);
%>
<tr><td><%=pname %></td>
	<td><%for(String v : pvalue) {%>
		<%=v %>&nbsp;&nbsp;<%} %>
		</td></tr>
		<%}%></table>
</body>
</html>