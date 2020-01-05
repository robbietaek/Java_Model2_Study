<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/info.jsp
  1. id 파라미터 값을 조회.
  2. 로그인 상태 검증.
   로그아웃상태 : '로그인이 필요합니다.' 메세지 출력. loginForm.jsp 이동
  3. 로그인 상태
      id의 값과 login 값이 다른 경우 이면서 admin이 아닌경우  
         '내정보만 조회 가능합니다.' 메세지 출력. main.jsp 이동
  4. db에서 id값에 해당하는 데이터 조회.
  5. 조회된 내용을 화면 출력하기       
--%>   
<%
	String id = request.getParameter("id"); //조회대상인 회원정보
	//login 정보 : 회원정보를 조회하는 사용자 정보
	String login = (String)session.getAttribute("login");
	if(login == null || login.equals("")) { // 로그인이 안 된 경우
%>		
<script>
	alert("로그인을 하고 오세요");
	location.href="loginForm.jsp";
</script>
<%	} else {
		if(!id.equals(login) && !login.equals("admin")) {
%>
			<script>
			alert("내 정보 조회만 가능합니다");
			location.href="main.jsp";
			</script>
<%		} else { //정상적인 조회
			Member info = new MemberDao().selectOne(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원정보조회</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<table>
  <caption>회원 정보 보기</caption>
  <tr><td rowspan="6">
    <img src="picture/<%=info.getPicture()%>" width="150"
     height="180"></td>
    <th>아이디</th><td><%=info.getId() %></td></tr>
   <tr><th>이름</th><td><%=info.getName() %></td></tr>
   <tr><th>성별</th><td><%=info.getGender()==1?"남":"여" %></td></tr>
   <tr><th>전화</th><td><%=info.getTel() %></td></tr>
   <tr><th>이메일</th><td><%=info.getEmail() %></td></tr>
   <tr><td colspan="2">
     <a href="updateForm.jsp?id=<%=info.getId()%>">[수정]</a>
  <% if( !id.equals("admin") && !login.equals("admin")) {%>
     <a href="deleteForm.jsp?id=<%=info.getId()%>">[탈퇴]</a>
   <% } %></td></tr>
</table></body></html><%		}	}%>