<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/board/replyForm.jsp--%>
<!DOCTYPE html>
<html><head><meta charset="EUC-KR">
<title>�Խ��� ��� ����</title>
</head>
<body><form action="reply.do" method="post" name="f">
  <input type="hidden" name="num" value="${b.num}">
  <input type="hidden" name="grp" value="${b.grp}" >
  <input type="hidden" name="grplevel" value="${b.grplevel}" >
  <input type="hidden" name="grpstep" value="${b.grpstep}" >
  <table  class="w3-table-all"><caption>�Խ��� ��� ���</caption>
  <tr><th>�۾���</th><td><input type="text" name="name"></td></tr>
  <tr><th>��й�ȣ</th><td><input type="password" name="pass"></td></tr>
  <tr><th>����</th><td><input type="text" name="subject" 
      value="RE:${b.subject}"></td></tr>
  <tr><th>����</th>
      <td><textarea name="content" rows="15"></textarea></td></tr>
  <tr><td colspan="2">
  <a href="javascript:document.f.submit()">[�亯�۵��]</a></td></tr>    
  </table>
</form></body></html>