<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--스크립트(Script) 예제 : 자바영역 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Script 예제</title>
</head>
<body>
<%	//스크립트립(scriptlet)
	String msg= "스크립트 예제";		//지역변수
	for(int i = 1; i<= 10; i++){
%>
<%=i+":"+this.msg+ " ---이것은 멤버변수 호출입니다.\t\t" + msg + " ---이것은 멤버변수입니다." %><br>		<%--표현식(세미콜론을 쓸 수 없다) out.print(내용); 으로 들어간다. /* */ 주석만 사용가능  --%>
<%}%> 

<%!//선언문
String msg = "선언문으로 선언한 msg 변수";	//멤버변수
String getMsg(){
	return msg;
}

%>


</body>
</html>