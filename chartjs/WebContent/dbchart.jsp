<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>PIE graph</title>
<script type="text/javascript"
	src="http://www.chartjs.org/dist/2.9.3/Chart.min.js"></script>
	<script type="text/javascript"
	src="http://www.chartjs.org/samples/latest/utils.js"></script>
</head>
<sql:setDataSource var="conn" driver="org.mariadb.jdbc.Driver"
	url="jdbc:mariadb://localhost:3306/classdb" user="scott"
	password="1234" />
<sql:query var ="rs" dataSource="${conn}">
select name, count(*) cnt from board group by name having count(*) > 1 order by cnt
</sql:query>
<style>
canvas {
	-moz-user-select: none;
	-webkit-user-select: none;
	-ms-user-select: none;
}
</style>
</head>
<body>
	<div id="container" style="width: 75%;">
		<canvas id="canvas"></canvas>
	</div>

	<script>
		var PERSON = [<c:forEach items = "${rs.rows}" var = "m">"${m.name}",</c:forEach>];
		var color = Chart.helpers.color;
		var chartData = {
			labels : PERSON,
			datasets : [
					{
						type : 'line',
						label : '총무부 실적',
						backgroundColor : color(window.chartColors.red).alpha(
								0.5).rgbString(),
						borderColor : window.chartColors.red,
						borderWidth : 1,
						fill : false,
						data : [<c:forEach items="${rs.rows}" var = "m"> "${m.cnt}",</c:forEach>]
					}, {
						type : 'bar',
						label : '영업부 실적',
						backgroundColor : "#0000FF",
						borderColor : "#0000FF",
						borderWidth : 1,
						fill : false,
						data : [<c:forEach items="${rs.rows}" var = "m"> "${m.cnt}",</c:forEach>]
					}, {
						type : 'line',
						label : '금융부 실적',
						backgroundColor : "#0000FF",
						borderColor : "#0000FF",
						borderWidth : 1,
						fill : false,
						data : [<c:forEach items="${rs.rows}" var = "m"> "${m.cnt}",</c:forEach>]
					} ]

		};

		window.onload = function() {
			var ctx = document.getElementById('canvas').getContext('2d');
			//그래프를 그리기 위한 그림판지정
			new Chart(ctx, {
				data : chartData, //데이터
				type : 'line',
				options : {
					responsive : true, //반응형웹
					legend : {
						position : 'top',
						display : false
					},
					title : {
						display : true,
						text : '차트연습'
					},
					
					scales:{
						yAxes :[{
							display : true,
							scaleLable:{
								display : true,
								labelString : "부서별실적증가율"
							}
						}]
					}
				}
			});
		}
	</script>
</body>
</html>