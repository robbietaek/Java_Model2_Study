<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>	<%--접두어가 c로 같다. 파일을 찾아들어가서 준비하는 것이지 인터넷에 연결된 것이 아니다. --%>
    
<% request.setCharacterEncoding("euc-kr"); %>
    
    이름:<c:out value="${param.name}"></c:out><br>
    나이:<c:out value="${param.age}"></c:out><br>
    성별:<c:out value="${param.gender==1?'남':'여'}"></c:out><br>
    출생년도:<c:out value="${param.year}"></c:out><br>
    만 나이:<c:out value="${2019-param.year}"></c:out>
    

	
