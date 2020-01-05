<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model/member/delete.jsp 
   1. �α׾ƿ� ���� : "�α����ϼ���" �޼��� ���. loginForm.jsp ������ �̵�
   2. �α��� ����
     - �����ڰ� �ƴϰ�, id�� login�� �ٸ� ��� 
         "���θ� Ż�� �����մϴ�." �޼��� ���. main.jsp �������� �̵�
     - id�� ������ �� ���
          "�����ڴ� Ż�� �Ұ����մϴ�." �޼��� ���. list.jsp ������ �̵�    
     - �Ϲݻ����
        (1) ���̵�, ��й�ȣ ������ �Ķ���ͷ� ����
        (2) ��й�ȣ ����ġ=> �Էµ� ��й�ȣ�� db�� ��й�ȣ�� ����
              "��й�ȣ�� Ʋ���ϴ�" �޼��� ���. deleteForm.jsp ������ �̵�           
     - ������
        (1) ���̵� ������ �Ķ���ͷ� ����
   3. ������ �α���, �Ǵ� ��й�ȣ ��ġ�ϴ� ��� db���� ȸ������ �����ϱ�      
       ��������: �Ϲݻ���� : �α׾ƿ� ��, Ż��޼��� ���.loginForm.jsp�� ������ �̵�
                       ������ : Ż��޼��� ���. list.jsp ������ �̵�
       �������� : �Ϲݻ���� : �������� �޼��� ���. info.jsp ������ �̵�.
                       ������ : �������� �޼��� ���. list.jsp ������ �̵�
--%>   
<%
   String login = (String)session.getAttribute("login");
   String id = request.getParameter("id");
   String pass = request.getParameter("pass");
   String msg = null;
   String url = null;
   if(login == null || login.trim().equals("")) { //�α׾ƿ�����
      msg= "�α����� �ʿ��մϴ�.";
      url = "loginForm.jsp";
   } else if(!login.equals(id) && !login.equals("admin")) {
	  msg= "���θ� Ż�� �����մϴ�.";
	  url = "main.jsp";
   } else if (id.equals("admin")) { //Ż�� ����� �Ǵ� ȸ���� ������ �ȵ�
	  msg= "�����ڴ� Ż���� �� �����ϴ�.";
	  url = "list.jsp";
   } else {
	   MemberDao dao = new MemberDao();
	   Member mem = dao.selectOne(id); //db ���� ��ȸ
	   if(login.equals("admin") || pass.equals(mem.getPass())) {
		//	int result = dao.delete(id);  
			if(dao.delete(id) > 0) {  //���� ����
				if(login.equals("admin")) {  //�������� ���
					msg =id + " ����ڸ� ���� Ż�� ����";
				    url = "list.jsp";
				} else {  //�Ϲݻ������ ���
					msg =id + "����  ȸ�� Ż�� �Ϸ�Ǿ����ϴ�.";
				    url = "loginForm.jsp";
				    session.invalidate();
				}
			} else {  //���� ����
				msg = id +"���� Ż��� ���� �߻�.";
				if(login.equals("admin")) {  //�������� ���
					url = "list.jsp";
				} else {  //�Ϲݻ������ ���
					url = "info.jsp?id="+id;
				}
			}
	   } else {
		   msg = id + "���� ��й�ȣ�� Ʋ���ϴ�.";
		   url = "deleteForm.jsp?id=" + id;
	   }
   }
%>
<script>
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>  