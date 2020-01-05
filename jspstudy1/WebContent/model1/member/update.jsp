<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/update.jsp
  1. 모든 파라미터 Member 객체에 저장
  2. 입력된 비밀번호와, db에 저장된 비밀번호가 같지 않으면
     "비밀번호가 틀렸습니다." 메세지 출력후, updateForm.jsp페이지로 이동
  3. 1번에 내용을 db에 수정하기
     int MemberDao.update(Member)
     결과가 0보다크면 수정성공 메세지 출력. info.jsp 페이지 이동
        0이하면  수정실패 메세지 출력. main.jsp 페이지 이동       
--%>
<% request.setCharacterEncoding("euc-kr");  
%>
<%--  Member m = new Member(); --%>
<jsp:useBean id="m" class="model.Member" />
<%--  m.setId(request.getParameter("id"))... --%>
<jsp:setProperty name="m" property="*" />
<%
    MemberDao dao = new MemberDao();
//selectOne(id) : 사용자id에 해당하는 db 정보 Member 객체로 리턴
//dbmem : 변경 전 Member 정보 저장
	Member dbmem = dao.selectOne(m.getId());
    String login = (String)session.getAttribute("login");
	String msg = null;
	String url = null;
	if(!login.equals("admin") && !m.getPass().equals(dbmem.getPass())) {
		msg = "비밀번호가 틀렸습니다.";
		url = "updateForm.jsp?id="+m.getId();
	} else { //비밀번호가 일치하는 경우
		int result = dao.update(m); //db에 회원 정보 변경기능. 결과 정수값리턴
		if(result > 0) {
			  msg = "수정완료";
			  url = "info.jsp?id="+m.getId();
		  } else {
			  msg = "수정실패";
			  url = "main.jsp";
		  }
	}%>
<script>
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>   
