<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("euc-kr"); %>	<%-- POST 방식에서만 사용이 가능함. GET 방식에서는 바이트로 보내기 때문에 2byte 씩 쓰는 한글은 글자가 깨져서 나오게 됨. --%>
이름 : <%=request.getParameter("name") %>
주소 : <%=request.getParameter("addr") %>
</body>
</html>