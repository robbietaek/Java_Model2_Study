<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<%-- /WebContent/jstl/jstlfnEx1.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSTL�� EL�Լ� ����</title></head>
<body>
<c:set var="str1" value="Functions <�±�>�� ����մϴ�.       " />
<c:set var="str2" value="���" />
<c:set var="tokens" value="1,2,3,4,5,6,7,8,9,10" />
length(str1)=${fn:length(str1)} : str1���ڿ��� ���� ����<br>
toUpperCase(str1)=${fn:toUpperCase(str1)} : str1�� ��� ���ڸ� �빮�ڷ� ����<br>
toLowerCase(str1)=${fn:toLowerCase(str1)} : str1�� ��� ���ڸ� �ҹ��ڷ� ����<br>
substring(str1,3,6)=${fn:substring(str1,3,6)} : str1�� 3~5������ �κ� ���ڿ� ����<br>
substringAfter(str1,str2)=${fn:substringAfter(str1,str2)} : 
             str1���ڿ����� str2 ���ڿ� ������ ���ڿ� ����<br>
substringBefore(str1,str2)=${fn:substringBefore(str1,str2)} : 
             str1���ڿ����� str2 ���ڿ� ������ ���ڿ� ����<br>
<br>
trim(str1)=${fn:trim(str1)}:������ ����<br>
replace(str1," ","-")=${fn:replace(str1," ","-")}: " "�� '-' ���ڿ��� ġȯ<br>
split(tokens,',') : ,�� �������� ���ڿ��� ������ �迭�� ����
<c:set var="arr" value="${fn:split(tokens,',') }" />
<c:forEach var="i" items="${arr}">
  ${i} &nbsp;
</c:forEach><br>
join(arr,'-')=${fn:join(arr,'-')}<br>
</body>
</html>