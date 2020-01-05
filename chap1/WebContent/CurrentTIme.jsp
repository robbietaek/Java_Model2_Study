<%@page import="java.util.Calendar"%>	<!--  서버의 영역이다 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>		<!-- 지시어 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>현재시간</title>
</head>
<body>
<% 
		Calendar c =Calendar.getInstance();
		int h = c.get(Calendar.HOUR_OF_DAY);
		int m = c.get(Calendar.MINUTE);
		int s = c.get(Calendar.SECOND);
%>
<h1>현재시간은<%=h%>시 <%=m%>분 <%=s %>초 입니다.</h1>
</body>
</html>