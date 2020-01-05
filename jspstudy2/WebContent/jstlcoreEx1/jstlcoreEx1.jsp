<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>	<%--접두어가 c로 같다. 파일을 찾아들어가서 준비하는 것이지 인터넷에 연결된 것이 아니다. --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSTL core 태그 예제 : taglib 지시어 표시해야한다.</title>
</head>
<body>
<h3>속성 설정 태그 : set, remove, out 태그</h3>
<%session.setAttribute("test", "Hello JSTL");%>
<c:set var = "test" value = "${'Hello JSTL'}" scope = "session"/>	<%--scope 에는 4가지 들어감 page, request, session, application 생략하면 page로 들어감 --%>
test 속성 : ${sessionScope.test}<br>
test 속성 : <c:out value = "${test}"/><br>	<%--똑같이 나오지만 보안에 더 좋다. --%>
<c:remove var = "test"/>
test 속성 : ${test}<br>
</body>
</html>