<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<%
	request.setCharacterEncoding("euc-kr");
	String visitor = request.getParameter("visitor");
	String subject = request.getParameter("subject");
	String poster = request.getParameter("poster");
	Date time = new Date();
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>

<table border="1"> <caption>방명록</caption>
<tr><td>방문자</td><td><%=visitor %></td></tr>
<tr><td>제목</td><td><%=subject %></td></tr>
<tr><td>내용</td><td><%=poster %></td></tr>
<tr><td>작성시간</td><td><%=df.format(time) %></td></tr>
</table>
</head>
<body>
</body>
</html>