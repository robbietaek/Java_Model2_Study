<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Forward 하는 페이지</title>
</head>
<body>
<h1>forward 하는 페이지 입니다. 이 내용은 화면에 출력되지 않습니다.</h1>
<%pageContext.forward("forward2.jsp"); %>
</body>
</html>