<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/list.jsp
   1. �α׾ƿ����� : �α����� �ʿ��մϴ�. �޼��� ���
                  loginForm.jsp�� ������ �̵�
   2. �α��� ����
           �Ϲݻ����  : �����ڸ� ������ �ŷ��Դϴ�. �޼��� ���
                 main.jsp�� ������ �̵�
           ������ : �������� �ŷ� ����.
   3. db���� ��� ȸ�� ������ ��ȸ�Ͽ� List<Member> ��ü�� ����
      List<Member> list = new MemberDao().list();                       
--%>    
<%
    String login = (String)session.getAttribute("login");
    if(login==null||login.trim().equals("")){
%>
	<script>
	alert("�α����� �ʿ��մϴ�.")
	location.href = "loginForm.jsp";
	</script>
<%	
   } else if(!login.equals("admin")) {
%>
	<script>
	alert("�����ڸ� ������ �� �ֽ��ϴ�..")
	location.href = "main.jsp";
	</script>
<%
   } else { //admin���� �α��� �Ǿ� �ִ� ���
		List<Member> list = new MemberDao().list();        
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ����Ϻ���</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<table><caption>ȸ�� ���</caption>
<tr><th>���̵�</th><th>�̸�</th><th>����</th><th>��ȭ</th><th>&nbsp;</th></tr>
<% for(Member m : list) {%>
<tr><td><a href="info.jsp?id=<%=m.getId()%>"><%=m.getId()%></a></td>
<td><%=m.getName()%></td>
<td><%=m.getGender()==1?"��":"��"%></td>
<td><%=m.getTel()%></td>
<td><a href="updateForm.jsp?id=<%=m.getId() %>">[����]</a>
<% if(!m.getId().equals("admin")) {%>
<a href="delete.jsp?id=<%=m.getId() %>">[����Ż��]</a>
<% } %></td></tr><% } %></table></body></html><% } %>