<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/jquery/jquery.min.js">
<link rel="stylesheet" href="/resources/bootstrap/js/bootstrap.min.js">
<link rel="icon" href="/resources/favicon.ico" type="image/x-icon">
<title>Main_Home</title>
<style type="text/css">

           @font-face {
    font-family: 'paybooc-Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/paybooc-Bold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
            
                             

body {
	font-family: 'paybooc-Bold';
}

.header {
	position: absolute;
}
* { box-sizing: border-box; }
	.clock { top: 20%; text-align:center; position: absolute;}
	.clock .time_box { width: 100%; padding-left: 10px;}
	.clock span { color: #fff; }
	.txt_lg { font-size: 150px; }
	.txt_sm { font-size: 20px; }
	.date_box { font-size: 20px; }
	.mark1 { display: inline-block; height:1px; margin-left: 1px; line-height: 94px; font-size: 150px; }
	.mark2 { display: inline-block; margin-left: -3px; }
#day { display: block; margin-top: 5px; }
body, html { 
    margin: 0;
    padding: 0;
    height: 100%;
}
#bg {
    
    background-image: url('https://whale-store.pstatic.net/20191111_63/1573440818118JES0l_PNG/nightwhale_img02.png');
    min-height: 100%;
    background-position: relative;
}
#home-div-searchbar {
	position: absolute;
}
nav {
	background-color: rgba(255,255,255,0.00) !important;
}
</style>
</head>
<body>
<div class="container-fluid">
	<div class="header">
		<div class="row">
			<div class="col-12 bg-dark">
				<%@ include file="common/navbar.jsp" %>
			</div>
		</div>
	</div>
	<div class="body">
		<div class="row">
			<div id="home-div-searchbar" class="col-12" style="top: 60%;">
				<form class="form-inline d-flex justify-content-center" method="get" action="/search.do">
					<div class="input-group" style="width: 40%;">
						<input type="text" class="form-control" id="search-keyword" name="keyword" placeholder="Search With Keyword">
				     	<div class="input-group-prepend">
				       		<button type="submit" class="input-group-text btn btn-sm btn-primary">↲</button>
				     	</div>
			   		</div>
				</form>
			</div>
		</div>
		
		<div class="row">
			<div class="clock col-12">
				<div class="time_box">
					<span class="txt_lg" id="hours"></span>
					<span class="mark1">:</span>
					<span class="txt_lg" id="min"></span>
					<span class="mark2">.</span>
					<span class="txt_sm" id="sec"></span>
				</div>
				<div class="date_box">
					<span id="month"></span>
					<span class="point">.</span>
					<span id="date"></span>
					<span class="point">.</span>
					<span id="year"></span>
					<span id="day"></span>
				</div>
			</div>
		</div>
		
	</div>
	<div class="footer">
		
	</div>
</div>
<script type="text/javascript" src="../resources/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
var clockStart = setInterval(function() {
	var today = new Date()
	var dayList = ['sunday', 'monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday']
	var hh = addZero(today.getHours())
	var mm = addZero(today.getMinutes())
	var ss = addZero(today.getSeconds())
	var YY = today.getFullYear()
	var MM = today.getMonth()+1
	var DD = today.getDate()
	var dd = dayList[today.getDay()].toUpperCase()
	document.getElementById('hours').innerText = hh
	document.getElementById('min').innerText = mm
	document.getElementById('sec').innerText = ss
	document.getElementById('month').innerText = MM
	document.getElementById('date').innerText = DD
	document.getElementById('year').innerText = YY
	document.getElementById('day').innerText = dd
	
	function addZero(num) {
		return (num < 10 ? '0'+num : ''+num)
	}
}, 1000)

$(function() { $("#nav-div-searchbar").hide(); });
</script>
<div id="bg">
</div>
</body>
</html>