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
<title>전송된 파라미터  정보</title>
<style type="text/css">
table {
border-collapse: collapse;
background : aqua;
}</style>
</head>
<body>
<fmt:requestEncoding value = "euc-kr"/>
이름 : ${param.name }<br>
나이 : ${param.age }<br>
성별 : ${param.gender==1?"남":"여" }<br>
취미 : ${param.hobby }<br>
나이 : ${param.year }<br>
<h1>취미정보 모두 조회하기</h1>
취미 : 
<c:forEach var = "h" items = "${paramValues.hobby }">
${h }&nbsp;&nbsp;
</c:forEach><br>

${paramValues.hobby[0]}&nbsp;${paramValues.hobby[1]} <br>
<h3>모든 파라미터 정보 조회하기</h3>
<table><tr><th>파라미터 이름</th><th>파라미터값</th></tr>

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