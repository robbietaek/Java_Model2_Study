<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/book.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ���� ����</title>
</head>
<body>
<% request.setCharacterEncoding("euc-kr"); %>
<%--
    String writer = request.getParameter("writer");
    ....
 --%>
 <%--
    1. Book book = new Book();
    2. request.setAttribute("book",book);
  --%>
<jsp:useBean id="book" class="chap7.Book" scope="request"/>
<%--
   book.setWriter(request.getParameter("writer"));
   book.setTitle(request.getParameter("title"));
   ....
   
   ������Ƽ
   set������Ƽ
   setXxx() => xxx
   get������Ƽ
   getXxx() => xxx
 --%>
<jsp:setProperty property="*" name="book"/>
<%-- book.setWriter(request.getParameter("name")) --%>
<jsp:setProperty property="wr" name="book" param="name"/>

<table border="1" style="border-collapse: collapse;">
<caption>���� ��ȸ</caption>
<tr><td>�ۼ���</td>
<%-- book.getWriter() �޼��� ȣ�� --%>
<td><jsp:getProperty name="book" property="wr"/>
   ,<%=book.getWr() %></td></tr>
<tr><td>����</td>
<%-- book.getTitle() �޼��� ȣ�� --%>
<td><jsp:getProperty name="book" property="title"/>,
<%=book.getTitle() %></td></tr>
<tr><td>����</td>
<%-- book.getContent() �޼��� ȣ�� --%>
<td><jsp:getProperty name="book" property="content"/>,
<%=book.getContent() %></td></tr>
</table>
</body>
</html>