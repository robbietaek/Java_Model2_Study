<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시물 목록 보기</title>
<link rel="stylesheet" href="/jspstudy1/css/main.css">
<script>
	function listdo(page){
		document.sf.pageNum.value = page;
		document.sf.submit();
	}
</script>
</head>
<body>
	
	<form action = "list.do" method = "post" name = "sf">
	<input type = "hidden" name = "pageNum" value = "1">
	<table><tr><td style = "border-width : 0px;">
	<select name = "column">
	<option value = "">선택하세요</option>
	<option value = "subject">제목</option>
	<option value = "name">작성자</option>
	<option value = "content">내용</option>
	<option value = "subject,content">제목+내용</option>
	<option value = "name,content">작성자+내용</option></select>
	<script>document.sf.column.value = "${param.column}";</script>
	<input type = "text" name = "find" value = "${param.find}" style = "width:50%">
	<input type = "submit" value = "검색"></td>
	</tr></table></form>

	<table>
		<caption>게시판 목록</caption>
		<c:if test="${boardcnt==0 }">
			<tr>
				<td colspan="5">등록된 게시글이 없습니다.</td>
			</tr>
		</c:if>

		<c:if test="${boardcnt>0 }">
			<tr>
				<td colspan="5" style="text-align: right">글개수:${boardcnt }</td>
			<tr>
				<th width="8%">번호</th>
				<th width="50%">제목</th>
				<th width="14%">작성자</th>
				<th width="17%">등록일</th>
				<th width="11%">조회수</th>
			</tr>
			<c:forEach var="b" items="${list }">
				<%-- 게시글 내용 --%>
				<tr>
					<%--첨부파일이 있으면 사진 문구가 나오면서 첨부파일사용 --%>
					<td>${boardnum}</td>
					<c:set var="boardnum" value="${boardnum-1 }" />
					<td style="text-align: left">
					
					<c:if test="${!empty b.file1}">
							<a href="file/${b.file1 }" style="text-decoration: none;">@</a>
					</c:if> 
					<c:if test="${empty b.file1 }">
    				  &nbsp;&nbsp;&nbsp;
      				</c:if> 
      				
      				<c:if test="${b.grplevel>0 }">
							<c:forEach begin="1" end="${b.grplevel }">
           						 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
         					</c:forEach>
        						 └ 
      				</c:if> 
      				
      				<a href="info.do?num=${b.num }">${b.subject}</a>
					<td>${b.name }</td>
					<td>
					
					<c:set var="today" value = "<%=new java.util.Date()%>"/>
					<fmt:formatDate value = "${today}" pattern = "yyMMdd" var ="day"/>
					<fmt:formatDate value = "${b.regdate}" pattern = "yyMMdd" var= "regdate"/>
					
					<c:if test="${regdate<day}">
					<fmt:formatDate value="${b.regdate}" pattern = "yy-MM-dd hh:mm"/>
					</c:if>
					<c:if test="${regdate==day}">
					<fmt:formatDate value="${b.regdate}" pattern = "hh:mm:ss"/>
					</c:if>
					
					</td>
					<td>${b.readcnt }</td>
				</tr>
			</c:forEach>

			<tr>
				<%-- 페이지단 --%>
				<td colspan="5"><c:if test="${pageNum<=1 }">[이전]</c:if> <c:if
						test="${pageNum>1 }">
						<a href="javascript:listdo(${pageNum -1 })">[이전]</a>
					</c:if> <c:forEach var="a" begin="${startpage }" end="${endpage }">
						<c:if test="${a==pageNum }">[${a }]</c:if>
						<c:if test="${a!=pageNum }">
							<a href="javascript:listdo(${a})">[${a}]</a>
						</c:if>
					</c:forEach> <c:if test="${pageNum>=maxpage}">[다음]</c:if> <c:if
						test="${ pageNum<maxpage}">

						<a href="javascript:listdo(${pageNum+1})">[다음]</a>

					</c:if></td>
			</tr>
		</c:if>
		<tr>
			<td colspan="5" style="text-align: right"><a href="writeForm.do">[글쓰기]</a></td>
		</tr>
	</table>
</body>
</html>