<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--/WebContent/jdbc/login.jsp
   1. id 에 해당하는 정보를 db에서 조회
   2. 내용이 존재하면 비밀번호 검증
        -> db의 비밀번호와 입력된 비밀번호를 확인
                     맞는 경우  : session 로그인 정보 등록. 확인 메세지 출력.
            => main.jsp로 페이지 이등
                     비밀번호가 틀린 경우 '비밀번호가 틀립니다' 메세지 출력
            => loginForm.jsp로 페이지 이등
      id 가 없으면 화면에 '아이디를 확인하세요' 메세지 출력
      => loginForm.jsp로 페이지 이등
 --%>   
<%
   String id = request.getParameter("id");
   String pass = request.getParameter("pass");
   //db 연결 
   Class.forName("org.mariadb.jdbc.Driver");
   Connection conn = DriverManager.getConnection
	("jdbc:mariadb://localhost:3306/classdb","scott","1234");
   String sql = "select * from member where id=?";
   PreparedStatement pstmt = conn.prepareStatement(sql);
   pstmt.setString(1, id);
   //db로 부터 id에 해당하는 정보 읽기
   ResultSet rs = pstmt.executeQuery();
   if(rs.next()) { //id 존재
	  String dbPass = rs.getString("pass");
      if(pass.equals(dbPass)) {  //비밀번호 맞는 경우. 로그인성공
    	  session.setAttribute("login", id);
          String name = rs.getString("name");
%>    	  
<script type="text/javascript">
   alert("<%=name%>님이 로그인 하셨습니다.");
   location.href='main.jsp';
</script>	   
<%      } else { //비밀번호가 틀린경우
%>
<script type="text/javascript">
   alert("비밀번호가 틀립니다");
   location.href='loginForm.jsp';
</script>	   
<%    	  
      }
   } else {  //id 없는 경우
%> 
<script type="text/javascript">
   alert("아이디를 확인하세요 ");
   location.href='loginForm.jsp';
</script>	   
<%   } %>
