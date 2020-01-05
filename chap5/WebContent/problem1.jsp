<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3> 합계는 ? </h3>
<%
request.setCharacterEncoding("euc-kr");
int num = Integer.parseInt(request.getParameter("num"));
int sum = 0;

for(int i=1;i<=num;i++){
	sum += i;
}
%>
<%=sum%>


</body>
</html>