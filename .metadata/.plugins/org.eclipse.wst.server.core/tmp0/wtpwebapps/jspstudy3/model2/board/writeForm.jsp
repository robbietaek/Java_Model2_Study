<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model2/board/writeForm.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խ��� �۾���</title>
<script type="text/javascript">
   function inputcheck() {
	   f = document.f;
	   if(f.name.value=="") {
		   alert("�۾��̸� �Է��ϼ���");
		   f.name.focus();
		   return;
	   }
	   if(f.pass.value=="") {
		   alert("��й�ȣ�� �Է��ϼ���");
		   f.pass.focus();
		   return;
	   }
	   if(f.subject.value=="") {
		   alert("������ �Է��ϼ���");
		   f.subject.focus();
		   return;
	   }
/* 	   if(f.content.value=="") {
		   alert("������ �Է��ϼ���");
		   f.content.focus();
		   return;
	   }
 */	   f.submit();
   }
</script>
</head>
<body>
<form action="write.do" method="post" 
       enctype="multipart/form-data" name="f">
  <table  class="w3-table-all">
   <caption>�Խ��� �۾���</caption>
   <tr><td>�۾���</td><td><input type="text" name="name"></td></tr>
   <tr><td>��й�ȣ</td><td><input type="password" name="pass"></td></tr>
   <tr><td>����</td><td><input type="text" name="subject"></td></tr>
   <tr><td>����</td>
   <td><textarea rows="15" name="content" id="content1"></textarea>
   </td></tr>
   <script>CKEDITOR.replace("content1", {
<%-- filebrowserImageUploadUrl : �̹��� ���ε� ����
     imgupload.do : ���ε带 ���� url ����
--%>	   
     filebrowserImageUploadUrl : "imgupload.do"
   });
   </script>
   <tr><td>÷������</td><td><input type="file" name="file1"></td></tr>
   <tr><td colspan="2">
     <a href="javascript:inputcheck()">[�Խù����]</a></td></tr>
  </table></form></body></html>