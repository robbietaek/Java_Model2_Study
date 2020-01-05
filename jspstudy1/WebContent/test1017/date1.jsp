<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	SimpleDateFormat sdf = 
			 new SimpleDateFormat("yyyy-MM-dd hh:mm:ss a");
	String date = sdf.format(new Date());
	session.setAttribute("date", date);
	int num = 10/0;
%>
등록된 날짜 :
<%=date%>
</body>
</html>