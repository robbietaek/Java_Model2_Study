<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ���׷��� �׸���</title>
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
		var chartData = {
		labels:[<c:forEach items = "${rs.rows}" var = "m"> "${m.name}",</c:forEach>],
		datasets:[{
			type : 'line',
			borderWidth : 2,
			borderColor : [<c:forEach items = "{$rs.rows}" var = "m">
			randomColor(1),</c:forEach>],
			label : '�Ǽ�',
			fill : false,
			data:[<c:forEach items = "${rs.rows}" var = "m">
				"${m.cnt}",</c:forEach>],
			
		}, {type : 'bar',
			label : '�Ǽ�',
			backgroundColor : [<c:forEach items="${rs.rows}" var = "m"> randomColor(1),</c:forEach>],
			data : [<c:forEach items = "${rs.rows}" var = "m">"${m.cnt}",</c:forEach>],
			borderWidth : 2
		}]
		
		};
		window.onload = function() {
			var ctx = document.getElementById('canvas').getContext('2d');
			new Chart(ctx, {
				data : chartData, //������
				type : 'bar',
				options : {
					responsive : true,
					title : {
						display : true,
						text : '�Խ��� ��ϰǼ�'
					},
					
					scales:{						
						yAxes :[{
						display : true,
						scaleLable:{
							display : true,
							labelString : "�Խù� �ۼ���"
						}
					}],
						yAxes :[{
							display : true,
							scaleLable:{
								display : true,
								labelString : "�Խù� �ۼ� �Ǽ�"
							},
							stacked : true
						}]
					}
				}
			});
		}
	</script>
</body>
</html>