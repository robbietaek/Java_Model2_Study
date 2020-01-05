<%@page import="model.Board"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
1. 파라미터 값을 Board 객체에 저장하기		=>usbBean 태그 사용
	원글정보 : num, grp, grplevel, grpstep
	답글정보 : name, pass, subject, content
2. 같은 grp 값을 사용하는 게시물들의 grpstep 값을 1 증가하기.
3. Board 객체를 db에 insert하기
	num : maxnum + 1
	grp : 원글과 동일
	grplevel : 원글 + 1
	grpstip : 원글 + 1
4. 등록 성공시 : "답변등록 완료" 메세지 출력 후 , list.jsp로 이동
    등록 실패시 : "답변등록시 오류발생" 메세지 출력 후 , replayForm 페이지로 이동하기
 --%>    

 <% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="b" class = "model.Board"></jsp:useBean>
<jsp:setProperty property="*" name="b"/>
<%
	BoardDao dao = new BoardDao();
	//2. 같은 grp 값을 사용하는 게시물의 grpstep 값을 1 증가시키기
	dao.grpStepAdd(b.getGrp(),b.getGrpstep());
	//3. Board 객체를 db에 insert 하기	
	int grplevel = b.getGrplevel();
	int grpstep = b.getGrpstep();
	int num = dao.maxnum();	//num의 최대값 저장
	String msg = "답변등록시 오류발생";
	String url = "reply.jsp?=num="+b.getNum();
	b.setNum(++num);
	b.setGrplevel(grplevel + 1);
	b.setGrpstep(grpstep + 1);
	if(dao.insert(b)){
		msg = "답변등록완료";
		url = "list.jsp";
	}
 %>
 <script>
 alert("<%=msg%>");
 location.href = "<%=url%>";
 </script>