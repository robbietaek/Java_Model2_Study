<%@page import="model.BoardDao"%>
<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%-- 
    1. num�Ķ���� ������ ������ ����.
    2. num�� �̿��Ͽ� db���� �Խù� ������ ��ȸ
    Board BoardDao.selectOne(num)
    3.��ȸ���� �������Ѿ���. 
    void BoardDao.readcntadd(num)
    4.��ȸ���� �������̰� 
    2������ ��ȸ�� �Խù� ȭ�鿡 ��� 
     --%>
     <%
     int num = Integer.parseInt(request.getParameter("num"));
     BoardDao dao = new BoardDao();
     Board info = dao.selectOne(num);
      dao.readcntadd(num);
     
     %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խù� �� ����</title>
<link rel = "stylesheet" href= "/jspstudy1/css/main.css">

</head>
<body>
<table>
<caption>�Խù� �� ����</caption>
<tr><th width="20%">�۾���</th>
<td width = "80%" style="text-align:left"><%=info.getName() %></td></tr>
<tr><th>����</th>
<td style="text-align:left"><%=info.getSubject() %></td></tr>
<tr><th>����</th>
<td><table style="width:100%; height:250px;"><tr>
<td style="border-width:0px; valign : top; text-align:left"><%=info.getContent() %></td></tr></table>
</td></tr>
<tr><th>÷������</th>
<td><%if(info.getFile1()==null||info.getFile1().trim().equals("")){ %>
&nbsp;
<%} else{%>
<a href="file/<%=info.getFile1() %>"><%=info.getFile1()%></a>
<%} %>
</td></tr>
<tr><td colspan="2">
<a href="replyForm.jsp?num=<%=num %>">[�亯]</a>
<a href="updateForm.jsp?num=<%=num %>">[����]</a>
<a href="deleteForm.jsp?num=<%=num %>">[����]</a>
<a href="list.jsp">[���]</a>

</td></tr>
   



</table>
</body>
</html>