<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ٱ��� �߰�</title>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");
	String product = request.getParameter("product");	//���
	List<String> cart = (List<String>)session.getAttribute("cart");	//cart��� �Ӽ��� ��ü�� ����. ��ϵ� �Ӽ��� ���� ��ȸ
	if(cart == null){	//cart �Ӽ��� ���� ���
		cart = new ArrayList<String>();
		session.setAttribute("cart",cart);	//setAttribute ��ü�� cart �Ӽ��� ���
	}
	cart.add(product);
%>
<script>
	alert("<%=product%>��(��) ��ٱ��Ͽ� �߰��Ǿ����ϴ�.")
	history.go(-1);	//�� �������� �̵��ϱ�
</script>
</body>
</html>