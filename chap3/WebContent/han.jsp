<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("euc-kr"); %>	<%-- POST ��Ŀ����� ����� ������. GET ��Ŀ����� ����Ʈ�� ������ ������ 2byte �� ���� �ѱ��� ���ڰ� ������ ������ ��. --%>
�̸� : <%=request.getParameter("name") %>
�ּ� : <%=request.getParameter("addr") %>
</body>
</html>