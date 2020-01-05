<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
 <%--화면에서 숫자를 입력받아서 숫자까지 합 구하기 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>입력된 숫자 합 구하기</title>
<script type = "text/javascript">
function inputcheck(f){
	if(isNaN(f.num.value)){
		alert("숫자만입력하세요.");
		f.num.focus();
		f.num.value = "";
		return false;
	}
}
</script>
</head>
<body>
<form action = "problem1.jsp" method = "post" onsubmit="return inputcheck(this)">
<input type = "text" name = "num"> 까지 합 구하기
<input type = "submit" value = "합계">
</form>
</body>
</html>