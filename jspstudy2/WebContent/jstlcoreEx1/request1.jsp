<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri= "http://java.sun.com/jsp/jstl/fmt" %>   
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
<fmt:requestEncoding value = "euc-kr"/>
�̸� : ${param.name }<br>
���� : ${param.age }<br>
���� : ${param.gender==1?"��":"��" }<br>
��� : ${param.hobby }<br>
���� : ${param.year }<br>
<h1>������� ��� ��ȸ�ϱ�</h1>
��� : 
<c:forEach var = "h" items = "${paramValues.hobby }">
${h }&nbsp;&nbsp;
</c:forEach><br>

${paramValues.hobby[0]}&nbsp;${paramValues.hobby[1]} <br>
<h3>��� �Ķ���� ���� ��ȸ�ϱ�</h3>
<table><tr><th>�Ķ���� �̸�</th><th>�Ķ���Ͱ�</th></tr>

<c:forEach var = "p" items = "${paramValues}">
<tr><td>${p.key}</td></tr>
<td>
<c:forEach var = "v" items = "${p.value}">
	${v} &nbsp;&nbsp;&nbsp;&nbsp;
</c:forEach>
</td>
</c:forEach>
</table>
</body>
</html>