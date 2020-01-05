<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Session 객체</title>
</head>
<body>
<h2>session 객체 : 브라우저의 상태정보를 저장하는 객체</h2>
<%
	session.setMaxInactiveInterval(10);	/* 세션의 유지시간을 10초로 만든 것*/
%>
<h3>session 정보</h3>
isNew() : <%=session.isNew()%><br>	<%--새로 만든거야? 아니야 전에 있던거야 --%>
생성시간 : <%=session.getCreationTime() %><br>
최종접속시간 : <%=session.getLastAccessedTime() %><br>
sessionId : <%=session.getId()%>

</body>
</html>