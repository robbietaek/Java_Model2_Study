<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Jsoup 크롤링예제</title>
<style type="text/css">
table, td, th {
	border: 2px solid grey;
}
</style>
</head>
<body>
	<%
		String url = "http://www.hanwhaeagles.co.kr/html/players/player/hitter_view.asp?sGubunCd=PLPPOF&sMSId=P477";
		try {
			Document doc = Jsoup.connect(url).get();
			Elements body = doc.select(".personAreaInner>.img");

			for (Element src : body) {
				out.println(src.toString());
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	%>
</body>
</html>