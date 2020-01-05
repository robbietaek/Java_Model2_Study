<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model/member/delete.jsp 
   1. 로그아웃 상태 : "로그인하세요" 메세지 출력. loginForm.jsp 페이지 이동
   2. 로그인 상태
     - 관리자가 아니고, id와 login이 다른 경우 
         "본인만 탈퇴가 가능합니다." 메세지 출력. main.jsp 페이지로 이동
     - id가 관리자 인 경우
          "관리자는 탈퇴가 불가능합니다." 메세지 출력. list.jsp 페이지 이동    
     - 일반사용자
        (1) 아이디, 비밀번호 정보를 파라미터로 전송
        (2) 비밀번호 불일치=> 입력된 비밀번호와 db의 비밀번호를 검증
              "비밀번호가 틀립니다" 메세지 출력. deleteForm.jsp 페이지 이동           
     - 관리자
        (1) 아이디 정보를 파라미터로 전송
   3. 관리자 로그인, 또는 비밀번호 일치하는 경우 db에서 회원정보 삭제하기      
       삭제성공: 일반사용자 : 로그아웃 후, 탈퇴메세지 출력.loginForm.jsp로 페이지 이동
                       관리자 : 탈퇴메세지 출력. list.jsp 페이지 이동
       삭제실패 : 일반사용자 : 삭제실패 메세지 출력. info.jsp 페이지 이동.
                       관리자 : 삭제실패 메세지 출력. list.jsp 페이지 이동
--%>   
<%
   String login = (String)session.getAttribute("login");
   String id = request.getParameter("id");
   String pass = request.getParameter("pass");
   String msg = null;
   String url = null;
   if(login == null || login.trim().equals("")) { //로그아웃상태
      msg= "로그인이 필요합니다.";
      url = "loginForm.jsp";
   } else if(!login.equals(id) && !login.equals("admin")) {
	  msg= "본인만 탈퇴가 가능합니다.";
	  url = "main.jsp";
   } else if (id.equals("admin")) { //탈퇴 대상이 되는 회원은 관리자 안됨
	  msg= "관리자는 탈퇴할 수 없습니다.";
	  url = "list.jsp";
   } else {
	   MemberDao dao = new MemberDao();
	   Member mem = dao.selectOne(id); //db 정보 조회
	   if(login.equals("admin") || pass.equals(mem.getPass())) {
		//	int result = dao.delete(id);  
			if(dao.delete(id) > 0) {  //삭제 성공
				if(login.equals("admin")) {  //관리자인 경우
					msg =id + " 사용자를 강제 탈퇴 성공";
				    url = "list.jsp";
				} else {  //일반사용자인 경우
					msg =id + "님의  회원 탈퇴가 완료되었습니다.";
				    url = "loginForm.jsp";
				    session.invalidate();
				}
			} else {  //삭제 실패
				msg = id +"님의 탈퇴시 오류 발생.";
				if(login.equals("admin")) {  //관리자인 경우
					url = "list.jsp";
				} else {  //일반사용자인 경우
					url = "info.jsp?id="+id;
				}
			}
	   } else {
		   msg = id + "님의 비밀번호가 틀립니다.";
		   url = "deleteForm.jsp?id=" + id;
	   }
   }
%>
<script>
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>  