<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>out 내장 객체 예제</title>
</head>
<body>
<h3>out 객체는 response 객체의 출력 버퍼에 테이터를 보낼 수 있는 출력스트림 객체임</h3>
<%
	int sum = 0;
	for(int i = 1; i<=100; i++){
		sum += i;
%>
	1부터 <%=i %>까지의 부분 합 : <%=sum %><br>
<%}%>
<%
	sum = 0;
	for(int i =1;i<=10;i++){
		sum+=i;
		out.println("1부터 "+i+"까지의 부분합:"+sum+"<br>");
	}%>
</body>
</html>