<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%-- /WebContent/decorator/decorator3.jsp --%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<title><decorator:title /></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
* {
	margin: 0px;
	padding: 0px;
}

html, body, h1, h2, h3, h4, h5 {
	font-family: "Raleway", sans-serif
}
</style>

<script type="text/javascript"
	src="http://www.chartjs.org/dist/2.9.3/Chart.min.js"></script>
<script type="text/javascript"
	src="http://www.chartjs.org/samples/latest/utils.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">


  $(document).ready(function(){ //문서로드가 완료된 경우
	  exchangeRate();
//	  setInterval(exchangeRate,1000*60)
//		barGraph();
		pieGraph();
  })
  
  		var randomColorFactor = function() {
			return Math.round(Math.random() * 255);
		}
		var randomColor = function(opacity) {
			return "rgba(" + randomColorFactor() + "," + randomColorFactor()
					+ "," + randomColorFactor() + "," + (opacity || '.3') + ")";
		};
  
  function pieGraph(){
	$.ajax("${path}/model2/ajax/graph2.do",{
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

function barGraphprint(data){
	var rows = JSON.parse(data);
	var names = [];
	var datas = [];
	var colors = [];
	$.each(rows,function(index,item){
		names[index] = item.name;
		datas[index] = item.cnt;
		colors[index] = randomColor(1);
	})
	var chartData = {
		labels : names,
		datasets : [
			{
				type:'line',
				borderWidth:2,
				borderColor : colors,
				label : '건수',
				fill : false,
				data : datas,
			},{
				type : 'bar',
				label : '건수',
				backgroundColor : colors,
				data : datas,
				borderWidth : 2
			}]
	}
	var ctx = document.getElementById("canvas1").getContext("2d");
	new Chart(ctx,{
		type : 'bar',
		data : chartData,
		option : {
			responsive : true,
			title : {display : true,
				text : '글쓴이 별 게시판 등록 건수'}
		},
		legend : {display : false},
		scales:{
			xAxes:[{
				display : true,
				scaleLabel : {
					display : true,
					labelString : "게시물 작성자"
				},
				stacked : true
			}],
			yAxes:[{
				display : true,
				scaleLabel : {
					display : true,
					labelString : "게시물 작성 건수"
				},
				stacked : true
			}]
		}
		
	});
}
  
  
  function exchangeRate() {
	 $.ajax("${path}/model2/ajax/exchange2.do",{
<%-- data : exchange.jsp 에서 제공된 html 페이지--%>		 
			  success : function(data){ //콜백함수
				  console.log(data)
				  $("#exchange").html(data);
			  },
			  error : function(e){
				  alert("서버 오류:" + e.status);
			  }	  
	  })
  }
</script>
<decorator:head />
<body class="w3-light-grey">

	<!-- Top container -->
	<div class="w3-bar w3-top w3-black w3-large" style="z-index: 4">
		<button
			class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey"
			onclick="w3_open();">
			<i class="fa fa-bars"></i> &nbsp;Menu
		</button>
		<span class="w3-bar-item w3-right"> <c:if
				test="${empty sessionScope.login }">
				<a href="${path}/model2/member/loginForm.me">로그인</a>
				<a href="${path}/model2/member/joinForm.me">회원가입</a>
			</c:if> <c:if test="${!empty sessionScope.login }">
      ${sessionScope.login}님이 로그인 하셨습니다.&nbsp;&nbsp;
       <a href="${path}/model2/member/logout.me">로그아웃</a>
			</c:if>
		</span>
	</div>

	<!-- Sidebar/menu -->
	<nav class="w3-sidebar w3-collapse w3-white w3-animate-left"
		style="z-index: 3; width: 290px;" id="mySidebar">
		<br>
		<div class="w3-container w3-row">
			<div class="w3-col s4">
				<img src="${path}/img/3_over.jpg" class="w3-circle w3-margin-right"
					style="width: 46px">
			</div>
			<div class="w3-col s8 w3-bar">
				<c:if test="${!empty sessionScope.login }">
					<span>Welcome, <strong>${sessionScope.login}</strong></span>
					<br>
				</c:if>
				<c:if test="${empty sessionScope.login }">
					<span><strong>로그인 하세요</strong></span>
					<br>
				</c:if>
				<a href="#" class="w3-bar-item w3-button"><i
					class="fa fa-envelope"></i></a> <a href="#"
					class="w3-bar-item w3-button"><i class="fa fa-user"></i></a> <a
					href="#" class="w3-bar-item w3-button"><i class="fa fa-cog"></i></a>
			</div>
		</div>
		<hr>
		<div class="w3-container">
			<h5>프로그램연습</h5>
		</div>
		<div class="w3-bar-block">
			<a href="#"
				class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black"
				onclick="w3_close()" title="close menu"><i
				class="fa fa-remove fa-fw"></i>&nbsp; Close Menu</a> <a href="#"
				class="w3-bar-item w3-button w3-padding " style="color: #D1B6E1;"><i
				class="fa fa-users fa-fw"></i>&nbsp; Overview</a> <a
				href="${path}/model2/member/main.me"
				class="w3-bar-item w3-button w3-padding"><i
				class="fa fa-eye fa-fw"></i>&nbsp; 회원관리</a> <a
				href="${path}/model2/board/list.do"
				class="w3-bar-item w3-button w3-padding"><i
				class="fa fa-users fa-fw"></i>&nbsp; 게시판</a>
		</div>
		<div class="w3-container">
			<%-- ajax을 통해 얻은 환율 정보 내용 출력 --%>
			<div id="exchange"></div>
		</div>
	</nav>


	<!-- Overlay effect when opening sidebar on small screens -->
	<div class="w3-overlay w3-hide-large w3-animate-opacity"
		onclick="w3_close()" style="cursor: pointer" title="close side menu"
		id="myOverlay"></div>

	<!-- !PAGE CONTENT! -->
	<div class="w3-main" style="margin-left: 300px; margin-top: 43px;">

		<!-- Header -->
		<header class="w3-container" style="padding-top: 22px">
			<h5>
				<b><i class="fa fa-dashboard"></i> 프로그램 연습</b>
			</h5>
		</header>
		<div class="w3-row-padding w3-margin-bottom">
			<div class="w3-half">
				<div class="w3-container w3-blue w3-padding-16">
					<div class="w3-left">
						<i class="fa fa-comment w3-xxxlarge"></i>
					</div>
					<div class="w3-right">
						<h3>52</h3>
					</div>
					<div class="w3-clear"></div>
					<h4>게시글등록건수</h4>
				</div>
			</div>
			<div class="w3-half">
				<div class="w3-container w3-blue w3-padding-16">
					<div class="w3-left">
						<i class="fa fa-eye w3-xxxlarge"></i>
					</div>
					<div class="w3-right">
						<h3>99</h3>
					</div>
					<div class="w3-clear"></div>
					<h4>사용자건수</h4>
				</div>
			</div>
		</div>
		<div class="w3-container w3-light-grey w3-padding-32">
			<div class="w3-row">
				<div class="w3-container w3-col" style="width: 95%;">
					<decorator:body />
				</div>
				<div class="w3-container w3-col" style="width: 5%;">
					<p>&nbsp;</p>
				</div>
			</div>
		</div>

		<!-- Footer -->
		<footer class="w3-container w3-padding-16 w3-light-grey">

			<div id="container">
				<canvas id="canvas2"></canvas>
			</div>
			<div id="container">
				<canvas id="canvas1"></canvas>
			</div>
			<h4>구디 아카데미 Since 2016</h4>
			<p>
				Powered by <a href="http://www.goodee.co.kr" target="_blank">구디아카데미</a>
			</p>
		</footer>

		<!-- End page content -->
	</div>

	<script>
// Get the Sidebar
var mySidebar = document.getElementById("mySidebar");

// Get the DIV with overlay effect
var overlayBg = document.getElementById("myOverlay");

// Toggle between showing and hiding the sidebar, and add overlay effect
function w3_open() {
  if (mySidebar.style.display === 'block') {
    mySidebar.style.display = 'none';
    overlayBg.style.display = "none";
  } else {
    mySidebar.style.display = 'block';
    overlayBg.style.display = "block";
  }
}

// Close the sidebar with the close button
function w3_close() {
  mySidebar.style.display = "none";
  overlayBg.style.display = "none";
}
</script>

</body>
</html>