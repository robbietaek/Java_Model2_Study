<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ ����</title>
<script type="text/javascript">
function inputCheck(f,cal){
	if(isNaN(f.num1.value)){
		alert("���ڸ��Է��ϼ���.");
		f.num1.focus();
		f.num1.value = "";
		return false;
	}
	if(isNaN(f.num2.value)){
		alert("���ڸ��Է��ϼ���.");
		f.num2.focus();
		f.num2.value = "";
		return false;
	}
	
	f.cal.value = cal;
	f.submit();
}

</script>
</head>
<body>
<form action = "problem3.jsp" method = "post">
<input type="hidden" name = "cal" value = "0">
����1 : <input type="text" name="num1"><br>
����2 : <input type="text" name="num2"><br>
<input type = "button" value = "+" onclick = "inputCheck(this.form,0)">
<input type = "button" value = "-" onclick = "inputCheck(this.form,1)">
<input type = "button" value = "*" onclick = "inputCheck(this.form,2)">
<input type = "button" value = "/" onclick = "inputCheck(this.form,3)">
</form>
</body>
</html>