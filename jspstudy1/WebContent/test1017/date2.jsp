<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head><body>
<%	String date = (String)session.getAttribute("date");
	if (date == null) {
%>
<script>
	alert("��¥ ����� �ŷ��ϼ���. date1.jsp�� ���ϴ�.");
	location.href = "date1.jsp";
</script>
<%	} else {  //��ϵ� ��¥�� ����. %>
	�ݰ����ϴ� ��ϵ� ��¥ :
	<%=date%>
<% session.invalidate();
	}   %>
</body>
</html>