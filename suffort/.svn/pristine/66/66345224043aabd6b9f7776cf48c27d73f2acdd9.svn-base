<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<title>Admin Company List</title>
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

#compName {
  width        : 150px;     /* 너비는 변경될수 있습니다. */
  text-overflow: ellipsis;  /* 위에 설정한 px 보다 길면 말줄임표처럼 표시합니다. */
  white-space  : nowrap;    /* 줄바꿈을 하지 않습니다. */
  overflow     : hidden;    /* 내용이 길면 감춤니다 */
  display      : block;     /* ie6이상 현재요소를 블럭처리합니다. */
}

#comp {
  width        : 150px;     /* 너비는 변경될수 있습니다. */
  text-overflow: ellipsis;  /* 위에 설정한 px 보다 길면 말줄임표처럼 표시합니다. */
  white-space  : nowrap;    /* 줄바꿈을 하지 않습니다. */
  overflow     : hidden;    /* 내용이 길면 감춤니다 */
  display      : block;     /* ie6이상 현재요소를 블럭처리합니다. */
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
			
				<!-- 기업 정지/차트 조회 -->
				<div class="row">
				
					<!-- 정지된 기업 조회
					<div class="col-5">
						<div class="card">
							<div class="card-header">
								<div class="row">
									<div class="col">
										<h6>정지 기업</h6>
									</div>
									<div class="col-auto">
										<select id="blockUserSelect" class="custom-select custom-select-sm">
											<option>신고</option>
											<option>가입일</option>
											<option>게시글</option>
										</select>
									</div>
								</div>
							</div>
							<div class="card-body">
								<table class="table table-borderless" >
									<thead>
										<tr>
											<th>ID</th>
											<th>이름</th>
											<th>신고</th>
											<th>신고 게시물</th>
											<th>가입일</th>
											<th>정지된 날짜</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>Kcompany</td>
											<td>콩컴퍼니</td>
											<td>152</td>
											<td>10</td>
											<td>2020.01.01</td>
											<td>2020.08.11</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="card-footer">
								<div class="row">
									<div class="col text-center">
										<h6>페이지 12345</h6>
									</div>
								</div>
							</div>
						</div>
					</div> -->
					
					<!-- 월별 기업 조회 -->
					<div class="col-12">
						<div class="card">
							<div class="card-header">
								<div class="row">
									<div class="col">
										<h6>최근 가입한 기업</h6>
									</div>
								</div>
							</div>
							<div class="card-body">
								<div id="chartdiv" class="small"></div>
							</div>
						</div>
					</div>
				</div>
				
				<!-- 전체 기업리스트 조회 -->
				<div class="row">
					<div class="col-12" >
						<div class="card" >
							<div class="card-header">
								<div class="row">
									<div class="col">
										<h6>기업리스트</h6>
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
								<thead class="text-center">
									<tr>
										<th>로고</th>
										<th>ID</th>
										<th>회사명</th>
										<th>주소</th>
										<th>게시글</th>
										<th>좋아요</th>
										<th>신고</th>
										<th>가입일</th>
										<th>활동</th>
									</tr>
								</thead>
								<tbody class="text-center" id="company-list">
									
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
<script type="text/javascript" src="/resources/jquery/jquery.min.js"></script>	
<script type="text/javascript" src="/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
companyList();
compChart();
function companyList() {
	$.ajax({
		type:"GET",
		url: "/manager/complist.do",
		success:function(result){
			console.log(result);
			
			$.each(result, function(index, company) {
				
				var row = "";
				if (company.actived == 'Y') {
					row += '<tr class="text-dark font-weight-bold">'
				} else if (company.actived == 'N') {
					row += '<tr class="text-muted">'
				}
				row +="<td><img src='"+company.logo+"'alt='...' style='height:30px; width: 50px;'></td>";
				row +="<td>"+company.id+"</td>";
				row +="<td id='compName'>"+company.name+"</td>";
				row +="<td id='compAddr'>"+company.address+"</td>";
				row +="<td>"+company.boardCnt+"</td>";
				row +="<td>"+company.sumUserLike+"</td>";
				if (company.sumWarning >= 10 ) {
					row +="<td style='color:red;'>"+company.sumWarning+"</td>";
				} else {
					row +="<td>"+company.sumWarning+"</td>";
				}
				row +="<td>"+company.registeredDate+"</td>";
				if (company.actived == 'Y') {
					row +="<td><button class='btn btn-danger btn-sm' data-no="+company.no+" data-actived='N'>정지</button></td>";
				}
				if (company.actived == 'N') {
					row += "<td><button class='btn btn-success btn-sm' data-no="+company.no+" data-actived='Y'>활성</button></td>"
				}
				row +="</tr>";
				
				$("#company-list").append(row);
			})
		}
	});
}

$("#company-list").on("click", "button", function() {
	var $button = $(this);
	
	var companyNo = $(this).data("no");
	var companyActived = $(this).attr("data-actived");
	$.ajax({
		type:"GET",
		url: "/manager/changeCompActive.do",
		data:{no:companyNo, actived:companyActived},
		dataType: "json",
		success:function(result){
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

function compChart() {
	$.ajax({
		type:"get",
		url:"/manager/compchart.do",
		success:function(result) {
			
			am4core.ready(function() {

				// Themes begin
				am4core.useTheme(am4themes_animated);
				// Themes end

				// Create chart instance
				var chart = am4core.create("chartdiv", am4charts.XYChart);
				$.each(result, function(index, compChart) {
					chart.data.push({
						"day" : compChart.day,
						"regiCnt" : compChart.regiCnt
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
				    return dy + 20;								// 격일 간격 차이
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