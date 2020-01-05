<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/jstl/jstlfmtEx3.jsp --%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html><html><head>
<meta charset="EUC-KR">
<title>fmt �±� : ���ڵ�</title></head>
<body>
<fmt:requestEncoding value="euc-kr"/>
<form method="post" name="f">
  �̸�:<input type="text" name="name" value="${param.name}"><br>
  �Ի���:<input type="text" name="hiredate" value="${param.hiredate}">
  yyyy-MM-dd ���·� �Է�<br>
 �޿�:<input type="text" name="salary" value="${param.salary}"><br>
 <input type="submit" value="����">
</form>
<hr>
�̸�:${param.name}<br>
�Ի���:${param.hiredate}<br>
�޿�:${param.salary}<br>
<h3>�Ի����� yyyy�� MM�� dd�� E���� ���·� ���
    �޿� ���ڸ����� ,�� ����ϱ�
    ���� �޿� * 12 ����ϰ�, ���ڸ����� ,�� ��� : ȫ�ؿ�
</h3>
<c:catch var="formatexception">
   <fmt:parseDate value="${param.hiredate}" 
                               pattern="yyyy-MM-dd" var="hiredate"/>
</c:catch>
<%-- ���� �߻��� �ȵ� --%>
<c:if test="${formatexception == null}">                               
�̸�:${param.name}<br>
<fmt:formatDate value="${hiredate}" 
                       pattern="yyyy��MM��dd�� E����" var="hiredate2"/>
�Ի���:${hiredate2}<br>
<fmt:formatNumber value="${param.salary}" 
                                   pattern="###,###" var="salary"/>
�޿�:${salary}<br>
<fmt:formatNumber value="${param.salary * 12}" 
                                pattern="###,###" var="salary12"/>
����:${salary12}<br></c:if>
<%-- ���� �߻��� �� --%>
<c:if test="${formatexception != null}">
  <font color="red">�Ի����� yyyy-MM-dd ���·� �Է��ϼ���</font>
</c:if></body></html>