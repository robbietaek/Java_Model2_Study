<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/book.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>방명록 내용 보기</title>
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
   
   프로퍼티
   set프로퍼티
   setXxx() => xxx
   get프로퍼티
   getXxx() => xxx
 --%>
<jsp:setProperty property="*" name="book"/>
<%-- book.setWriter(request.getParameter("name")) --%>
<jsp:setProperty property="wr" name="book" param="name"/>

<table border="1" style="border-collapse: collapse;">
<caption>방명록 조회</caption>
<tr><td>작성자</td>
<%-- book.getWriter() 메서드 호출 --%>
<td><jsp:getProperty name="book" property="wr"/>
   ,<%=book.getWr() %></td></tr>
<tr><td>제목</td>
<%-- book.getTitle() 메서드 호출 --%>
<td><jsp:getProperty name="book" property="title"/>,
<%=book.getTitle() %></td></tr>
<tr><td>내용</td>
<%-- book.getContent() 메서드 호출 --%>
<td><jsp:getProperty name="book" property="content"/>,
<%=book.getContent() %></td></tr>
</table>
</body>
</html>