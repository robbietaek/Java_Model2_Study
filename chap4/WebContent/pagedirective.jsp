<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- page 지시어 예제 속쇼ㅓㅇ으로 현재 페이지의 특징을 설정하는 기능 
	language = "java" :기본언어. 기본값 java 생략가능
	contentType : 반드시 기술해야함. text/html; = > html 형식으로 작성 전달.
					charset = EUC-KR => 한글은 EUC-KR로 설정.
					pageEncoding = "EUC-KR" 기능이 동일
	import : 클래스의 패키지명을 생략하는 기능. 여러번 처리 가능
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

현재 일시 : <%=df.format(today)%>
</body>
</html>