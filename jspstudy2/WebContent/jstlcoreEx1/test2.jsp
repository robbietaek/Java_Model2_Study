<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>	<%--���ξ c�� ����. ������ ã�Ƶ��� �غ��ϴ� ������ ���ͳݿ� ����� ���� �ƴϴ�. --%>
    
<% request.setCharacterEncoding("euc-kr"); %>
    
    �̸�:<c:out value="${param.name}"></c:out><br>
    ����:<c:out value="${param.age}"></c:out><br>
    ����:<c:out value="${param.gender==1?'��':'��'}"></c:out><br>
    ����⵵:<c:out value="${param.year}"></c:out><br>
    �� ����:<c:out value="${2019-param.year}"></c:out>
    

	
