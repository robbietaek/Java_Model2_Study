<%@page import="model.Board"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
1. �Ķ���� ���� Board ��ü�� �����ϱ�		=>usbBean �±� ���
	�������� : num, grp, grplevel, grpstep
	������� : name, pass, subject, content
2. ���� grp ���� ����ϴ� �Խù����� grpstep ���� 1 �����ϱ�.
3. Board ��ü�� db�� insert�ϱ�
	num : maxnum + 1
	grp : ���۰� ����
	grplevel : ���� + 1
	grpstip : ���� + 1
4. ��� ������ : "�亯��� �Ϸ�" �޼��� ��� �� , list.jsp�� �̵�
    ��� ���н� : "�亯��Ͻ� �����߻�" �޼��� ��� �� , replayForm �������� �̵��ϱ�
 --%>    

 <% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="b" class = "model.Board"></jsp:useBean>
<jsp:setProperty property="*" name="b"/>
<%
	BoardDao dao = new BoardDao();
	//2. ���� grp ���� ����ϴ� �Խù��� grpstep ���� 1 ������Ű��
	dao.grpStepAdd(b.getGrp(),b.getGrpstep());
	//3. Board ��ü�� db�� insert �ϱ�	
	int grplevel = b.getGrplevel();
	int grpstep = b.getGrpstep();
	int num = dao.maxnum();	//num�� �ִ밪 ����
	String msg = "�亯��Ͻ� �����߻�";
	String url = "reply.jsp?=num="+b.getNum();
	b.setNum(++num);
	b.setGrplevel(grplevel + 1);
	b.setGrpstep(grpstep + 1);
	if(dao.insert(b)){
		msg = "�亯��ϿϷ�";
		url = "list.jsp";
	}
 %>
 <script>
 alert("<%=msg%>");
 location.href = "<%=url%>";
 </script>