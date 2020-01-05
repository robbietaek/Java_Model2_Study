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
	alert("날짜 등록후 거래하세요. date1.jsp로 갑니다.");
	location.href = "date1.jsp";
</script>
<%	} else {  //등록된 날짜가 존재. %>
	반갑습니다 등록된 날짜 :
	<%=date%>
<% session.invalidate();
	}   %>
</body>
</html>