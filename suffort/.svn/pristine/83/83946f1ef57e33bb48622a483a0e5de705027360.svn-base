<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
<!-- 파일 차트 링크 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<!-- 태그 차트 링크 -->
<script src="https://cdn.amcharts.com/lib/4/core.js"></script>
<script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
<script src="https://cdn.amcharts.com/lib/4/maps.js"></script>
<script src="https://cdn.amcharts.com/lib/4/plugins/wordCloud.js"></script>
<script src="https://cdn.amcharts.com/lib/4/themes/moonrisekingdom.js"></script>
<script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>
<title>Admin Main</title>
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
		margin-top: 10px;
	}
	
	#tagChart {
 		width: 100%;
 		height: 400px;
	}
	
	#fileChart {
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
			<div class="col-10 " id="content-div">

				<!-- 업로드 요약/유저,기업 전체 게시물 조회 -->
				<div class="row">
				
					<!-- 오늘 업로드된 것들(게시물, 커뮤니티, 신고, 좋아요, 태그, 파일, .. ) 개수 표시 -->			
					<div class="col-4">
						<div class="card">
							<div class="card-header">
								<div class="row">
									<div class="col">
										<h6>TODAYS</h6>
									</div>
									<div class="col-auto text-right">
										<!-- modal로 안의 항목 배치순서 및 수정, 추가 삭제 -->
										<button type="button" class="btn btn-light" data-toggle="modal" data-target="#todays-modal">수정 ></button>
									</div>
								</div>
							</div>
							<div class="card-body">
								 <table class="table table-borderless">
								 	<tr>
								 		<td>게시물</td>
								 		<td>61</td>
								 		<td>커뮤니티</td>
								 		<td>12</td>
								 	</tr>
								 	<tr>
								 		<td>신고</td>
								 		<td>32</td>
								 		<td>좋아요</td>
								 		<td>105</td>
								 	</tr>
								 	<tr>
								 		<td>파일</td>
								 		<td>6</td>
								 		<td>태그</td>
								 		<td>23</td>
								 	</tr>
								 	<tr>
								 		<td>가입</td>
								 		<td>21</td>
								 		<td>탈퇴</td>
								 		<td>3</td>
								 	</tr>
								 </table>
							</div>
						</div>
					</div>
					
					
					<!-- 유저/기업 전체 게시물 조회 -->
					<div class="col-8">
						<div class="card">
							<div class="card-header">
								<div class="row">
									<div class="col">
										<a href="../manager/adminboardlist.do" style="color:black;">전체 게시물</a>
									</div>
									<div class="col-auto">
										<select id="boardSelect" class="custom-select custom-select-sm">
											<option>최근 등록일</option>
											<option>신고</option>
											<option>좋아요</option>
										</select>
									</div>
								</div>
							</div>
							<div class="card-body">
								<div class="row">
									<div class="col">
										<table class="table table-borderless table-hover">
											<colgroup>
												<col width="20%">
												<col width="30%">
												<col width="15%">
												<col width="15%">
												<col width="20%">
											</colgroup>
											<thead>
												<tr>
													<th>ID</th>
													<th>제목</th>
													<th>신고</th>
													<th>좋아요</th>
													<th>작성일</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>홍컴퍼니</td>
													<td>기업소식</td>
													<td>6</td>
													<td>59</td>
													<td>2020.08.11</td>
												</tr>
												<tr>
													<td>Hong</td>
													<td>Hong의 포트폴리오</td>
													<td>3</td>
													<td>10</td>
													<td>2020.08.11</td>
												</tr>
												<tr>
													<td>Kong</td>
													<td>포트폴리오</td>
													<td>51</td>
													<td>3</td>
													<td>2020.08.11</td>
												</tr>
												<tr>
													<td>콩기업</td>
													<td>채용소식</td>
													<td>2</td>
													<td>102</td>
													<td>2020.08.11</td>
												</tr>
											</tbody>											
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<!-- 유저/기업/커뮤니티 조회  -->
				<div class="row">
				
					<!-- 유저 상태, 신고, 좋아요 조회 -->
					<div class="col-3">
						<div class="card card-border-color card-border-color-danger">
							<div class="card-header">
								<div class="row">
									<div class="col">
										<a href="../manager/adminuserlist.do" style="color:black;">유저</a>
									</div>
									<div class="col-auto">
										<select id="" class="custom-select custom-select-sm">
											<option>접속 중</option>
											<option>신고</option>
											<option>좋아요</option>
										</select>
									</div>
								</div>
							</div>
							<div class="card-body">
								<table class="table table-borderless">
									<tr>
										<td>Profile</td>
										<td>Status</td>
										<td>Report</td>
										<td>Likes</td>
									</tr>
									<tr>
										<td>Profile</td>
										<td>Status</td>
										<td>Report</td>
										<td>Likes</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
					
					<!-- 기업 상태/신고/좋아요 조회 -->
					<div class="col-3">
						<div class="card">
							<div class="card-header">
								<div class="row">
									<div class="col">
										<a href="../manager/admincomplist.do" style="color:black;">기업</a>
									</div>
									<div class="col-auto">
										<select id="" class="custom-select custom-select-sm">
											<option>접속 중</option>
											<option>신고</option>
											<option>좋아요</option>
										</select>
									</div>
								</div>
							</div>
							<div class="card-body">
								<table class="table table-borderless">
									<tr>
										<td>사진</td>
										<td>아이디</td>
										<td>신고</td>
										<td>좋아요</td>
									</tr>
									<tr>
										<td>사진</td>
										<td>아이디</td>
										<td>신고</td>
										<td>좋아요</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
					
					<!-- 커뮤니티 조회 -->
					<div class="col-6">
						<div class="card">
							<div class="card-header">
								<div class="row">
									<div class="col">
										<a href="../manager/admincommlist.do" style="color:black;">커뮤니티</a>
									</div>
									<div class="col-auto">
										<select id="" class="custom-select custom-select-sm">
											<option>최근 활동</option>
											<option>태그 사용</option>
											<option>파일 업로드</option>
										</select>
									</div>
								</div>
							</div>
							<div class="card-body">
								<table class="table table-borderless">
									<tr>
										<td>썸네일</td>
										<td>제목</td>
										<td>인원</td>
										<td>최근 활동</td>
									</tr>
									<tr>
										<td>썸네일</td>
										<td>제목</td>
										<td>인원</td>
										<td>최근 활동</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
				
				<!-- 전체 업로드된 파일/태그 조회 -->
				<div class="row">
					
					<!-- 파일 조회 -->
					<div class="col-5">
						<div class="card">
							<div class="card-header">
								<div class="row">
									<div class="col">
										<h6>파일</h6>
									</div>
									<div class="col-auto">
										<button type="button" class="btn btn-light btn-sm" data-toggle="modal" data-target="#file-modal">더 보기></button>
									</div>
								</div>
							</div>
							<div class="card-body">
								<div id="fileChart"></div>
							</div>
						</div>
					</div>
					
					<!-- 태그 조회 -->
					<div class="col-7">
						<div class="card">
							<div class="card-header">
								<div class="row">
									<div class="col">
										<h6>태그</h6>
									</div>
								</div>
							</div>
							<div class="card-body">
								<div id="tagChart"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- Modal -->
		<!-- todays modal -->
		<div class="modal" id="todays-modal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h6>Todays</h6>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<h6>오늘의 활동</h6>
					</div>
					<div class="modal-footer">
						
					</div>
				</div>
			</div>
		</div>
		
		<!-- file modal -->
		<div class="modal" id="file-modal">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h6>파일</h6>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<table class="table table-borderless">
							<thead>
								<tr>
									<th>번호</th>
									<th>이미지</th>
									<th>파일명</th>
									<th>작성자</th>
									<th>등록일</th>
									<th>위치</th>
									<th></th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>apple</td>
									<td>apple.jpg</td>
									<td>Hong</td>
									<td>2020.08.14</td>
									<td>게시물</td>
									<td><button type="button" class="btn btn-primary btn-sm">다운로드</button></td>
									<td><button type="button" class="btn btn-secondary btn-sm">비활성화</button></td>
								</tr>
								<tr>
									<td>2</td>
									<td>flower</td>
									<td>flower.jpg</td>
									<td>Kong</td>
									<td>2020.08.14</td>
									<td>커뮤니티</td>
									<td><button type="button" class="btn btn-primary btn-sm">다운로드</button></td>
									<td><button type="button" class="btn btn-secondary btn-sm">비활성화</button></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="modal-footer">
						<h6>페이지 12345</h6>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript" src="/resources/jquery/jquery.min.js"></script>	
<script type="text/javascript" src="/resources/bootstrap/js/bootstrap.min.js"></script>
<!-- 부트스트랩 -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script> 
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<script type="text/javascript">

/*
 * 차트시작
 	파일차트
 */
 am4core.ready(function() {

// Themes begin
am4core.useTheme(am4themes_animated);
// Themes end

// Create chart instance
var chart = am4core.create("fileChart", am4charts.XYChart);

// Add data
chart.data = [{
  "day": "월요일",
  "uploads": 2025
}, {
  "day": "화요일",
  "uploads": 1882
}, {
  "day": "수요일",
  "uploads": 1809
}, {
  "day": "목요일",
  "uploads": 1322
}, {
  "day": "금요일",
  "uploads": 1122
}, {
  "day": "토요일",
  "uploads": 1114
}, {
  "day": "일요일",
  "uploads": 984
}];

// Create axes
var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
categoryAxis.dataFields.category = "day";
categoryAxis.renderer.grid.template.location = 0;
categoryAxis.renderer.minGridDistance = 30;

categoryAxis.renderer.labels.template.adapter.add("dy", function(dy, target) {
  if (target.dataItem && target.dataItem.index & 2 == 2) {
    return dy + 25;
  }
  return dy;
});

var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());

// Create series
var series = chart.series.push(new am4charts.ColumnSeries());
series.dataFields.valueY = "uploads";
series.dataFields.categoryX = "day";
series.name = "파일";
series.columns.template.tooltipText = "{categoryX}: [bold]{valueY}[/]";
series.columns.template.fillOpacity = .8;

var columnTemplate = series.columns.template;
columnTemplate.strokeWidth = 2;
columnTemplate.strokeOpacity = 1;

}); // end am4core.ready()

/*
 * 태그차트
 */
am4core.ready(function() {

// Themes begin
am4core.useTheme(am4themes_moonrisekingdom);
am4core.useTheme(am4themes_animated);
// Themes end

var tagChart = am4core.create("tagChart", am4plugins_wordCloud.WordCloud);
tagChart.fontFamily = "Courier New";
var series = tagChart.series.push(new am4plugins_wordCloud.WordCloudSeries());
series.randomness = 0.1;
series.rotationThreshold = 0.5;

series.data = [ {
    "tag": "suffort",
    "count": "400"
}, {
    "tag": "javascript",
    "count": "250"
}, {
    "tag": "javascript",
    "count": "250"
}, {
    "tag": "c#",
    "count": "200"
}, {
    "tag": "php",
    "count": "190"
}, {
    "tag": "android",
    "count": "180"
}, {
    "tag": "python",
    "count": "130"
}, {
    "tag": "jquery",
    "count": "110"
}, {
    "tag": "html",
    "count": "70"
}, {
    "tag": "c++",
    "count": "50"
}, {
    "tag": "ios",
    "count": "32"
}, {
    "tag": "css",
    "count": "15"
}, {
    "tag": "mysql",
    "count": "3"
}
];

/*
 * series.dataFields.word="태그명",
 * series.dataFields.value="빈도수"
 */
series.dataFields.word = "tag";
series.dataFields.value = "count";	

series.heatRules.push({
 "target": series.labels.template,
 "property": "fill",
 "min": am4core.color("gray"),
 "max": am4core.color("black"),
 "dataField": "value"
});

/*
 * 태그 클릭 시 해당 태그 사용한 게시물, 커뮤니티 조회
 */
series.labels.template.url = "";
series.labels.template.urlTarget = "_blank";
series.labels.template.tooltipText = "{word}: {value}";

var hoverState = series.labels.template.states.create("hover");
hoverState.properties.fill = am4core.color("#FF0000");


}); // end am4core.ready()

			
</script>

</body>
</html>