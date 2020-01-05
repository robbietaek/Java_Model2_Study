<%@page import="model.BoardDao"%>
<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%-- 
    1. num파라미터 정보를 변수에 저장.
    2. num을 이용하여 db에서 게시물 정보를 조회
    Board BoardDao.selectOne(num)
    3.조회수를 증가시켜야함. 
    void BoardDao.readcntadd(num)
    4.조회수가 증가가됫고 
    2번에서 조회된 게시물 화면에 출력 
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
<title>게시물 상세 보기</title>
<link rel = "stylesheet" href= "/jspstudy1/css/main.css">

</head>
<body>
<table>
<caption>게시물 상세 보기</caption>
<tr><th width="20%">글쓴이</th>
<td width = "80%" style="text-align:left"><%=info.getName() %></td></tr>
<tr><th>제목</th>
<td style="text-align:left"><%=info.getSubject() %></td></tr>
<tr><th>내용</th>
<td><table style="width:100%; height:250px;"><tr>
<td style="border-width:0px; valign : top; text-align:left"><%=info.getContent() %></td></tr></table>
</td></tr>
<tr><th>첨부파일</th>
<td><%if(info.getFile1()==null||info.getFile1().trim().equals("")){ %>
&nbsp;
<%} else{%>
<a href="file/<%=info.getFile1() %>"><%=info.getFile1()%></a>
<%} %>
</td></tr>
<tr><td colspan="2">
<a href="replyForm.jsp?num=<%=num %>">[답변]</a>
<a href="updateForm.jsp?num=<%=num %>">[수정]</a>
<a href="deleteForm.jsp?num=<%=num %>">[삭제]</a>
<a href="list.jsp">[목록]</a>

</td></tr>
   



</table>
</body>
</html>