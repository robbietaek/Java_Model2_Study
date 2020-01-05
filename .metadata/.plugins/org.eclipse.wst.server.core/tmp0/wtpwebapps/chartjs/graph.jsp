<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>막대 선그래프 그리기</title>
<script type="text/javascript"
	src="http://www.chartjs.org/dist/2.9.3/Chart.min.js"></script>
</head>
<style>
canvas {
	-moz-user-select: none;
	-webkit-user-select: none;
	-ms-user-select: none;
}
</style>
<sql:setDataSource var="conn" driver="org.mariadb.jdbc.Driver"
	url="jdbc:mariadb://localhost:3306/classdb" user="scott"
	password="1234" />
<sql:query var="rs" dataSource="${conn}">
select name, count(*) cnt from board group by name having count(*) > 1 order by cnt desc
</sql:query>
<body>
	<div id="container" style="width: 75%">
		<canvas id="canvas"></canvas>
	</div>

	<script type="text/javascript">
		var randomColorFactor = function() {
			return Math.round(Math.random() * 255);
		}
		var randomColor = function(opacity) {
			return "rgba(" + randomColorFactor() + "," + randomColorFactor()
					+ "," + randomColorFactor() + "," + (opacity || '.3') + ")";
		};
		
		$(function(){
			exchangeRate();
			barGraph();
			pieGraph();
		})
		
		function pieGraph(){
			$.ajax("/member2/ajax/graph.jsp",{
				success : function(data){
					pieGraphprint(data);
					barGraphprint(data);
					},
					error : function(e){
						alert("서버오류" + e.status);
					}
				}
			)
		}
		
		function pieGraphprint(data){
			var rows = JSON.parse(data);
			var names = [];
			var datas = [];
			var colors = [];
			$.each(rows,function(index,item){
				names[index] = item.name;
				datas[index] = item.cnt;
				colors[index] = randomColor(1);
			})
			var config ={
				type : 'pie',
				data : {
					datasets :[{
						data : datas,
						backgroundColor : colors,
					}],
					labels:names
				},
				option:{
					responseive:true,
					legend : {position:'top',},
					title : {
						display : true,
						text : '글쓴이 별 게시판 등록 건수'
					}
				}
			};
			var ctx = document.getElementById("canvas2").getContext("2d");
			new Chart(ctx,config);
		}
	</script>
</body>
</html>