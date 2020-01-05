<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>	<%--���ξ c�� ����. ������ ã�Ƶ��� �غ��ϴ� ������ ���ͳݿ� ����� ���� �ƴϴ�. --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSTL core �±� ���� : taglib ���þ� ǥ���ؾ��Ѵ�.</title>
</head>
<body>
<h3>�Ӽ� ���� �±� : set, remove, out �±�</h3>
<%session.setAttribute("test", "Hello JSTL");%>
<c:set var = "test" value = "${'Hello JSTL'}" scope = "session"/>	<%--scope ���� 4���� �� page, request, session, application �����ϸ� page�� �� --%>
test �Ӽ� : ${sessionScope.test}<br>
test �Ӽ� : <c:out value = "${test}"/><br>	<%--�Ȱ��� �������� ���ȿ� �� ����. --%>
<c:remove var = "test"/>
test �Ӽ� : ${test}<br>
</body>
</html>