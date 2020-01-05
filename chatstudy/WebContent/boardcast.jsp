<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>채팅화면</title>
</head>
<body>
	<fieldset>
		<textarea rows="10" cols="50" readonly="readonly" id="messageWidnow"></textarea>
		<br>
		<input id="inputMessage" type="text" size="50">
		<input
			type="button" value="전송" onclick="send()">
	</fieldset>
	<script>
var textarea = document.getElementById("messageWidnow");
var webSocket = new WebSocket("ws://192.168.0.89:8080${path}/broadcasting");
var inputMessage = document.getElementById("inputMessage");
webSocket.onerror = function(event){
	onError(event)
}
webSocket.onopen = function(event){
	onOpen(event);
	alert("즐거운 채팅. 비속어 환영");
}
webSocket.onmessage = function(event){
	onMessage(event)
}
function onMessage(event){
	textarea.value = "상대"+event.data + "\n";
}
function onOpen(event){
	textarea.value += "연결성공\n";
}
function onError(event){
	alert("" + event.data)
}
function send(){
	<c:if test="${!empty sessionScope.memId}">
	<c:set var = "memId" value = "${sessionScope.memId}"/>
	</c:if>
	<c:if test="${empty sessionScope.memId}">
	<c:set var = "memId" value = "본인"/>
	</c:if>
	textarea.value += "${memId} : "+inputMessage.value + "\n";
	webSocket.send(inputMessage.value);
	inputMessage.value= "";
}
</script>
</body>
</html>