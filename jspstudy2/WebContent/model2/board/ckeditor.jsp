<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script>
	window.parent.CKEDITOR.tools.callFunction
	(${param.CKEditorFuncNum}, 'imgfile/${fileName}','이미지업로드완료');
</script>