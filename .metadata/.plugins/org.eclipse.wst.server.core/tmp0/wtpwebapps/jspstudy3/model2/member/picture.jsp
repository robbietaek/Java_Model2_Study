<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model2/member/picture.jsp
   1. opener ȭ�鿡 ��� ���� =>javascript
   2. ���� ȭ�� close() =>javascript
--%>
<script type="text/javascript">
   img = opener.document.getElementById("pic");
   img.src = "picture/${fname}";
   opener.document.f.picture.value="${fname}";
   self.close();
</script>  
