<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--/WebContent/model1/member/login.jsp --%>   
<%
   String id = request.getParameter("id");
   String pass = request.getParameter("pass");
   //MemberDao Ŭ���� : Model ��� Ŭ����
   // Model : dbms�� �����ִ� ����� ���� Ŭ����
   Member mem = new MemberDao().selectOne(id);
   if(mem != null) { //id ����
       if(pass.equals(mem.getPass())) {  //��й�ȣ �´� ���. �α��μ���
    	  session.setAttribute("login", id); //�α����������
%>    	  
<script type="text/javascript">
   alert("<%=mem.getName()%>���� �α��� �ϼ̽��ϴ�.");
   location.href='main.jsp';
</script>	   
<%      } else { //��й�ȣ�� Ʋ�����
%>
<script type="text/javascript">
   alert("��й�ȣ�� Ʋ���ϴ�");
   location.href='loginForm.jsp';
</script>	   
<%    	  
      }
   } else {  //id ���� ���
%> 
<script type="text/javascript">
   alert("���̵� Ȯ���ϼ��� ");
   location.href='loginForm.jsp';
</script>	   
<%   } %>
