<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<% request.setCharacterEncoding("euc-kr"); %>
<%--
1.num,pass �Ķ���͸� ������ ����
2.�Էµ� ��й�ȣ�� db ��й�ȣ ����
	Ʋ����� : ��й�ȣ ���� �޼��� ���, deleteForm.jsp ������ �̵�
3. ��й�ȣ�� �´� ��� : �Խù� ����.
	���� ���� : ���� ���� �޼��� ���, list.jsp ������ �̵�
	���� ���� : ���� ���� �޼��� ���, info.jsp ������ �̵�
 --%>
    

    <%
    	int num = Integer.parseInt(request.getParameter("num"));
    	String pass = request.getParameter("pass");
    	String msg = "�Խñ��� ��й�ȣ�� Ʋ�Ƚ��ϴ�.";
    	String url = "deleteForm.jsp?num="+num;
    	BoardDao dao = new BoardDao();
    	if(dao.passcheck(num)==null){
    		msg = "���� �Խñ� �Դϴ�.";
    		url = "list.jsp";
    	}else{
    	
    	if(dao.passcheck(num).equals(pass)){
    		dao.delete(num);
    		msg = "�����Ǿ����ϴ�.";
    		url = "list.jsp";
    	} else{
    		msg = "��й�ȣ�� Ʋ���ϴ�.";
    		url = "info.jsp?num="+num;
    	}
    	}
    %>
<script>
alert("<%=msg%>")
location.href = "<%=url%>"
</script>