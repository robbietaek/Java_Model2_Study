<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ٱ��� ����</title>
</head>
<body>
<%List<String> cart = (List<String>)session.getAttribute("cart"); 
if(cart == null || cart.size() == 0){
%> <h3>��ٱ��Ͽ� ��ǰ�� �����ϴ�.</h3>
<%} else{	%>
	<h3>��ٱ��� ��ǰ</h3>
	<%	for(String p : cart) {%>
	<h4><%=p %></h4>
<%}} 
// 	session.invalidate();	//���� ���Ǵ� session ��ü�� ��ȿ���� �ʵ��� ��
// 							//���ο� session ��ü�� ������.
							
	session.removeAttribute("cart");	//���� ��ü�� �ƴ� īƮ�� ����							
%>	
</body>
</html>