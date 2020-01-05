<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>파이 그래프 그리기</title>
<script type="text/javascript"
	src="http://www.chartjs.org/dist/2.9.3/Chart.min.js"></script>
<script type="text/javascript"
	src="http://www.chartjs.org/samples/latest/utils.js"></script>
</head>
<body>
	<div id="container" style="width: 75%">
		<canvas id="canvas"></canvas>
	</div>
	<script type="text/javascript">
		var MONTHS = [ 'January', 'February', 'March', 'April', 'May', 'June',
				'July', 'August', 'September', 'October', 'November',
				'December' ];
		window.chartColors = {
				red : 'rgb(255,99,132)',
				orange : 'rgb(255,159,64)',
				yellow : 'rgb(255,205,86)',
				green : 'rgb(75,192,192)',
				blue : 'rgb(54,162,235)',
				purple : 'rgb(153,102,255)',
				grey : 'rgb(201,203,207)',
		};
		var randomScalingFactor = function(){
			return Math.random(Math.random()*100);
		}
		var config = {
				type : 'pie',
				data:{
					datasets:[{
						data:[
							randomScalingFactor(),
							randomScalingFactor(),
							randomScalingFactor(),
							randomScalingFactor(),
							randomScalingFactor(),
							randomScalingFactor(),
							randomScalingFactor(),
							randomScalingFactor(),
							randomScalingFactor(),
							randomScalingFactor(),
							randomScalingFactor(),
							randomScalingFactor()
						],
						backgroundColor:[
							window.chartColors.red,
							window.chartColors.orange,
							window.chartColors.yellow,
							window.chartColors.green,
							window.chartColors.blue,
							window.chartColors.purple,
							window.chartColors.red,
							window.chartColors.orange,
							window.chartColors.yellow,
							window.chartColors.green,
							window.chartColors.blue,
							window.chartColors.purple,
							window.chartColors.red,
							window.chartColors.orange,
							window.chartColors.yellow
						],
						label : '도넛 그래프'
					}],
					labels : MONTHS
				},
				options:{
					responsive : true,
					legend : {
						position: 'top',
					},
					title:{
						display : true,
						text: '도넛 그래프 연습'
					},
					animation : {
						animateScale : true,
						animateRotate : true
					}
				}
		};
		window.onload = function(){
			var ctx = 
				document.getElementById('canvas').getContext('2d');
				window.myBar = new Chart(ctx, config);
		}
	</script>
</body>
</html>