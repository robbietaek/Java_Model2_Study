<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<fmt:requestEncoding value="UTF-8" />
<sql:setDataSource var="conn" driver="org.mariadb.jdbc.Driver"
	url="jdbc:mariadb://localhost:3306/classdb" user="scott"
	password="1234" />
	
<sql:query var="rs" dataSource="${conn}">
select * from member where id = ?
<sql:param>${param.id}</sql:param>
</sql:query>

<c:if test="${empty rs.rows}">
<h5 class = "notfound">ȸ������ �� �� �ֽ��ϴ�.</h5>
</c:if>

<c:if test="${!empty rs.rows}">
<h5 class = "find">�����ϴ� ���̵��Դϴ�.</h5>
</c:if>

