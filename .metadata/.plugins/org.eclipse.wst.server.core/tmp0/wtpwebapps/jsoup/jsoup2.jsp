<%@page import = "java.io.IOException" %>
<%@page import = "org.jsoup.nodes.Element" %>
<%@page import = "org.jsoup.select.Elements" %>
<%@page import = "org.jsoup.Jsoup" %>
<%@page import = "org.jsoup.nodes.Document" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- jsoup1.jsp ���� tr �±׵鸸 �������� --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Jsoup ũ�Ѹ�����</title>
<style type="text/css">
	table,td,th{
	border : 2px solid grey;}
</style>
</head>
<body>
<%
	String url = "https://www.koreaexim.go.kr/site/program/financial/exchange?menuid=001001004002001";
	String line = "";
	Document doc = null;
	try{
		doc = Jsoup.connect(url).get();		//doc �̶�� ������ �ڷ���
		//e1 : url�� �����ϴ� html ���� �� �±װ� table �±׵鸸 ����
		Elements e1 = doc.select("table");
		for(Element ele : e1){		//ele : table �±� �Ѱ�
			Elements e2 = ele.select("tr");		//tr �� ã��ʹ�.
			for(Element ele2 : e2){
			String temp = ele2.html();		//caption �鸸 ���󰡹��ȴ�
			System.out.println("===========");
			System.out.println(temp);	//�ܼ�â�� �����ַ��� �Ѱ�
			line += "<tr>"+ temp + "</tr>";
			}
		}
	}catch(IOException e){
		e.printStackTrace();
	}
%>
<table><%=line %></table>
</body>
</html>