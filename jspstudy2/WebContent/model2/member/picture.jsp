<%@page import="java.io.IOException"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/picture.jsp
   1. ���� ���ε� => java 
   2. opener ȭ�鿡 ��� ���� =>javascript
   3. ���� ȭ�� close() =>javascript
--%>

<script type="text/javascript">
   img = opener.document.getElementById("pic");
   img.src = "picture/${fname}";
   opener.document.f.picture.value="${fname}";
   self.close();
</script>  
