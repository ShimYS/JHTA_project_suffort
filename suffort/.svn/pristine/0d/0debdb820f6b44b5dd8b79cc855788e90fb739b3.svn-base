<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
<!-- 유저 차트 링크 -->
<script src="https://cdn.amcharts.com/lib/4/core.js"></script>
<script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
<script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>
<title>Admin User List</title>
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
.card {
	margin-top : 20px;
	box-shadow: 13px 15px 9px -7px #7d7d7d;
}
#chartdiv {
	width: 100%;
	height: 400px;
}
</style>
</head>
<body>
<div class="container-fluid">
	<div class="header">
		<div class="row">
			<div class="col-12 bg-light">
				<%@ include file="../common/navbar.jsp" %>		
			</div>
		</div>
	</div>

	<div class="body" style="margin-top: 72px;">
		<div class="row">
			<div class="col-2"  style="background-image: url('https://whale-store.pstatic.net/20191111_63/1573440818118JES0l_PNG/nightwhale_img02.png');">
				<%@ include file="../common/sidebar-admin.jsp" %>
			</div>
			<div class="col-10 mt-3" id="content-div">
			
				<!-- 유저 정지/차트 조회 -->
				<div class="row">
				
					<!-- 정지된 유저 조회
					<div class="col-4">
						<div class="card">
							<div class="card-header">
								<div class="row">
									<div class="col">
										<h6>정지 유저</h6>
									</div>
									<div class="col-auto">
										<select id="blockUserSelect" class="custom-select custom-select-sm">
											<option>신고</option>
											<option>가입일</option>
											<option>게시물</option>
										</select>
									</div>
								</div>
							</div>
							<div class="card-body">
								<table class="table table-borderless text-center" >
									<thead>
										<tr>
											<th></th>
											<th>ID</th>
											<th>이름</th>
											<th>신고</th>
											<th>신고 게시물</th>
											<th>가입일</th>
											<th></th>
										</tr>
									</thead>
									<tbody class="text-center" id = "block-user-list">
									
									</tbody>
								</table>
							</div>
							<div class="card-footer">
							
							</div>
						</div>
					</div> -->
					
					<!-- 유저차트 -->
					<div class="col-12">
						<div class="card">
							<div class="card-header">
								<div class="row">
									<div class="col">
										<h6>최근 가입한 유저</h6>
									</div>
								</div>
							</div>
							<div class="card-body">
								<div id="chartdiv" class="small"></div>
							</div>
						</div>
					</div>
				</div>
			
				<!-- 전체 유저리스트 조회 -->
				<div class="row">
					<div class="col-12" >
						<div class="card" >
							<div class="card-header">
								<div class="row">
									<div class="col">
										<h6>유저리스트</h6>
									</div>
									<div class="col-auto">
										<select id="userSelect" class="custom-select custom-select-sm ">
											<option>가입일</option>
											<option>신고</option>
											<option>좋아요</option>
											<option>게시글</option>
											<option>탈퇴</option>
										</select>
									</div>
								</div>
							</div>
							<div class="card-body">
								<table class="table table-borderless table-hover">
								<!-- 
								<colgroup>
									<col width="20">
									<col width="40">
									<col width="15">
									<col width="15">
									<col width="10">
								</colgroup>
								 -->
								<thead class="text-center">
									<tr>
										<th>프로필</th>
										<th>번호</th>
										<th>ID</th>
										<th>이름</th>
										<th>생년월일</th>
										<th>깃주소</th>
										<th>이메일</th>
										<th>게시물</th>
										<th>좋아요</th>
										<th>신고</th>
										<th>가입일</th>
										<th>활동</th>
									</tr>
								</thead>
								<tbody class="text-center" id = "user-list">
								
								</tbody>
							</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- jQuery, bootstrap -->
<script type="text/javascript" src="/resources/jquery/jquery.min.js"></script>	
<script type="text/javascript" src="/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
userList();
userChart();
function userList() {
	$.ajax({
		type:"get",
		url:"/manager/userlist.do",
		success:function(result) {
			console.log(result);
			
			$.each(result, function(index, user) {
				
				var row = "";
				if (user.actived == 'Y') {
					row += "<tr class='text-dark font-weight-bold'>"
				} else if (user.actived == 'N'){
					row += "<tr class='text-muted'>"
				}
				row += "<td>"+user.img+"</td>"
				row += "<td>"+user.no+"</td>"
				row += "<td>"+user.id+"</td>"
				row += "<td>"+user.name+"</td>"
				if (user.birth == null) {
					row += "<td> </td>"
				} else {
					row += "<td>"+user.birth+"</td>"
				}
				row += "<td>"+user.gitAddr+"</td>"
				row += "<td>"+user.email+"</td>"
				row += "<td>"+user.boardCnt+"</td>"
				row += "<td>"+user.sumLike+"</td>"
				if (user.sumWarnings >= 10) {
					row += "<td style='color:red;'>"+user.sumWarning+"</td>"
				} else {
					row += "<td>"+user.sumWarning+"</td>"
				}
				row += "<td>"+user.registeredDate+"</td>"
				if (user.actived == 'Y') {
					row +="<td><button class='btn btn-danger btn-sm' data-no="+user.no+" data-actived='N'>정지</button></td>";
				}
				if (user.actived == 'N') {
					row += "<td><button class='btn btn-success btn-sm' data-no="+user.no+" data-actived='Y'>활성</button></td>"
				}
				row +="</tr>";
				
				$("#user-list").append(row);
			})
		}
	})
}

$("#user-list").on("click", "button", function() {
	var $button = $(this);
	
	var userNo = $(this).data("no");
	var userActived = $(this).attr("data-actived");
	$.ajax({
		type:"get",
		url: "/manager/changeUserActive.do",
		data: {no: userNo, actived: userActived},
		dataType: "json",
		success:function(result) {
			console.log(result);
			if (result.actived == 'Y') {
				$button.removeClass("btn-success").addClass("btn-danger")
				.attr('data-actived', 'N').text("정지");
				$button.parents('tr').removeClass('text-muted').addClass('text-dark font-weight-bold')
				
			}
			if (result.actived == 'N') {
				$button.removeClass("btn-danger").addClass("btn-success")
				.attr('data-actived', 'Y').text("활성");
				$button.parents('tr').removeClass('text-dark').removeClass('font-weight-bold').addClass('text-muted')
			}
		}
	})
})

function userChart() {
	$.ajax({
		type:"get",
		url:"/manager/userchart.do",
		success:function(result) {
			
			am4core.ready(function() {

				// Themes begin
				am4core.useTheme(am4themes_animated);
				// Themes end

				// Create chart instance
				var chart = am4core.create("chartdiv", am4charts.XYChart);
				$.each(result, function(index, userChart) {
					chart.data.push({
						"day" : userChart.day,
						"regiCnt" : userChart.regiCnt
					});
				})
				console.log("차트 데이터 " , chart.data);
				// Create axes
				var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
				categoryAxis.dataFields.category = "day";
				categoryAxis.renderer.grid.template.location = 0;
				categoryAxis.renderer.minGridDistance = 30;			// 뒷배경그리드

				categoryAxis.renderer.labels.template.adapter.add("dy", function(dy, target) {
				  if (target.dataItem && target.dataItem.index & 2 == 2) {
				    return dy + 20;									// 격일 간격 차이
				  }
				  return dy;
				});

				var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());

				// Create series
				var series = chart.series.push(new am4charts.ColumnSeries());
				series.dataFields.valueY = "regiCnt";	// y축 : 가입자 수
				series.dataFields.categoryX = "day";	// x축 : 날짜
				series.name = "Register";
				series.columns.template.tooltipText = "{categoryX}: [bold]{valueY}[/]";
				series.columns.template.fillOpacity = .8;	// 바 투명도

				var columnTemplate = series.columns.template;
				columnTemplate.strokeWidth = 2;		// 바 테두리 넓이
				columnTemplate.strokeOpacity = 1;	

				});
		}
	})
}


</script>
</body>
</html>