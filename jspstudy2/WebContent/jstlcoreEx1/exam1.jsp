<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�հ豸�ϱ�</title>
</head>
<body>
<form method = "post">
	x:<input type = "text" name = "x" value = "${param.x}"><br>
	y:<input type = "text" name = "y" value = "${param.y}"><br>
	<input type = "submit" value = "���ϱ�">
</form>
�հ� : <c:out value = "${param.x + param.y}" />

<h3>if �±׸� �̿��Ͽ� ����ϱ�</h3>
<c:if test="${(param.x + param.y)>0}">
<h3>����Դϴ�.</h3>
</c:if>
<c:if test="${(param.x + param.y)==0}">
<h3>0�Դϴ�.</h3>
</c:if>
<c:if test="${(param.x + param.y)<0}">
<h3>�����Դϴ�.</h3>
</c:if>
-------------------------------------------
<c:choose>
<c:when test="${(param.x + param.y)>0}">
<h3>����Դϴ�.</h3>
</c:when>

<c:when test="${(param.x + param.y)==0}">
<h3>0�Դϴ�.</h3>
</c:when>

<c:when test="${(param.x + param.y)<0}">
<h3>�����Դϴ�.</h3>
</c:when>
</c:choose>

</body>
</html>