<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>	<%--���ξ c�� ����. ������ ã�Ƶ��� �غ��ϴ� ������ ���ͳݿ� ����� ���� �ƴϴ�. --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����</title>

</head>
<body>
<form name = "f" method = post>
x : <input type = "text" name = "x" value = "${param.x}">
<select name = "cal">
	<option>+</option>
	<option>-</option>
	<option>*</option>
	<option>/</option>
</select>

y : <input type = "text" name = "y" value = "${param.y}">
<input type = "submit" value = "=">
<c:choose>
<c:when test="${param.cal=='+'}">
<h3><c:out value="${param.x}"/>+<c:out value="${param.y}"/>=<c:out value="${param.x + param.y}"/></h3>
</c:when>
<c:when test="${param.cal=='-'}">
<h3><c:out value="${param.x}"/>-<c:out value="${param.y}"/>=<c:out value="${param.x - param.y}"/></h3>
</c:when>
<c:when test="${param.cal=='*'}">
<h3><c:out value="${param.x}"/>*<c:out value="${param.y}"/>=<c:out value="${param.x * param.y}"/></h3>
</c:when>
<c:when test="${param.cal=='/'}">
<h3><c:out value="${param.x}"/>/<c:out value="${param.y}"/>=<c:out value="${param.x / param.y}"/></h3>
</c:when>
</c:choose>

</form>
</body>
</html>