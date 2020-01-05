<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("euc-kr");
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		int cal = Integer.parseInt(request.getParameter("cal"));
		int sum = 0;

		switch (cal) {
		case 0:
			sum = num1 + num2;
			break;
		case 1:
			sum = num1 - num2;
			break;
		case 2:
			sum = num1 * num2;
			break;
		case 3:
			sum = num1 / num2;
			break;
		}
		%>
	<%="값은 " + sum + "입니다."%>

</body>
</html>