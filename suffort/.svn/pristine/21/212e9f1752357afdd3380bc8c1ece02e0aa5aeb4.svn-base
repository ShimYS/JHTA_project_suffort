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
<title>Admin Board List</title>
<!-- 게시물 차트 링크 -->
<script src="https://www.chartjs.org/dist/2.9.3/Chart.min.js"></script>
<script src="https://www.chartjs.org/samples/latest/utils.js"></script>
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

#boardTitle {
  width        : 150px;     /* 너비는 변경될수 있습니다. */
  text-overflow: ellipsis;  /* 위에 설정한 px 보다 길면 말줄임표처럼 표시합니다. */
  white-space  : nowrap;    /* 줄바꿈을 하지 않습니다. */
  overflow     : hidden;    /* 내용이 길면 감춤니다 */
  display      : block;     /* ie6이상 현재요소를 블럭처리합니다. */
}


thead {
	font-size: 15px;
	color: gray;
}

.card {
	margin-top : 20px;
	box-shadow: 13px 15px 9px -7px #7d7d7d;
}

canvas {
	-moz-user-select: none;
	-webkit-user-select: none;
	-ms-user-select: none;
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
				<!-- 게시물 태그/정지 조회 -->
				<div class="row">
				
					<!-- 게시물 태그 조회 -->
					<div class="col-12">
						<div class="card">
							<div class="card-header">
								<div class="row">
									<div class="col">
										<h6>태그</h6>
									</div>
									<div class="col-auto">
										<button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#tag-modal">추가</button>
									</div>
								</div>
							</div>						
							<div class="card-body" id="tag-list">
								
							</div>						
						</div>
					</div>
					
					<!-- 정지 게시물 조회
					<div class="col-6">
						<div class="card">
							<div class="card-header">
								<div class="row">
									<div class="col">
										<h6>정지 게시물</h6>
									</div>
									<div class="col-auto">
										<select class="custom-select custom-select-sm">
											<option>1월</option>
											<option>2월</option>
											<option>3월</option>
											<option>...</option>
										</select>
									</div>
								</div>
							</div>
							<div class="card-body">
								<canvas id="canvas"></canvas>
							</div>
						</div>
					</div> -->
				</div>
				
				<!-- 전체 게시물 조회 -->
				<div class="row">
					<div class="col-12">
						<div  class="card">
							<div class="card-header">
								<div class="row">
									<div class="col">
										<h6>전체 게시물</h6>
									</div>
								</div>
							</div>
							<div class="card-body" >
								<div class="row">
									<div class="col-6">
										<h6 style="font-size: 20px; color:gray;">유저</h6>	
										<table class="table table-borderless text-center table-hover" >
											<colgroup>
												<col width="10%">
												<col width="15%">
												<col width="25%">
												<col width="10%">
												<col width="25%">
												<col width="15%">
											</colgroup>
											<thead>
												<tr>
													<th>번호</th>
													<th>ID</th>
													<th>제목</th>
													<th>신고</th>
													<th>작성일</th>
													<th></th>
												</tr>
											</thead>
											<tbody id="userboard-list">
											
											</tbody>
										</table>
									</div>
									<div class="col-6">
										<h6 style="font-size: 20px; color:gray;">기업</h6>	
										<table class="table table-borderless text-center table-hover">
											<colgroup>
												<col width="10%">
												<col width="15%">
												<col width="25%">
												<col width="10%">
												<col width="25%">
												<col width="15%">
											</colgroup>
											<thead>
												<tr>
													<th>번호</th>
													<th>ID</th>
													<th>제목</th>
													<th>신고</th>
													<th>작성일</th>
													<th></th>
												</tr>
											</thead>
											<tbody id="compboard-list">
												
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="modal" id="tag-modal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h6>태그추가</h6>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<div class="mt-3">
							<form class="" action="addTag.do" method="post">
								
		  						<div class="form-row">
								    <div class="form-group col-md-12">
								      <label for="tag-name">태그명</label>
								      <input type="text" name="name" class="form-control" id="tag-name" placeholder="ex)Java">
								    </div>
		  						
		  						</div>
		  						<div class="form-row">
			  						<div class="form-group col-md-12">
			  						
								      <label for="category-list">카테고리</label>
								      <select id="category-list" class="form-control" name="categoriesNo">
								        	<option selected disabled>카테고리를 선택하세요.</option>
									      	<c:forEach var="category" items="${categories }">
									        	<option value="${category.no }">${category.name }</option>
									      	</c:forEach>
								      </select>
								      <div id="tag-btn" class="mt-2">
								      		
								      </div>
								    </div>
							    </div>
								<div class="modal-footer">
									<button class="btn btn-primary">등록</button>
								</div>
							    
	  						</form>
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
userBoardList();
compBoardList();
tagList();

$("select").change(function(){
	var categoryNo = $(this).val();
	
	$.ajax({
		type:"GET",
		url:"/manager/confirmtags.do",
		data:{categoryNo:categoryNo},
		success:function(result){
			console.log("1"+result);
			$.each(result, function(index, tag){
				console.log(tag)
				var row = '<button class="btn btn-sm btn-outline-dark mt-1 ml-2">'+tag.name+'</button>';
				$("#tag-btn").append(row);
			})
		}
	})
})


function userBoardList() {
	
	$.ajax({
		type:"GET",
		url:"/manager/userboardlist.do",
		dataType: 'json',
		success:function(result) {
			console.log(result);
			$.each(result, function(index, userboard) {
				
				var row = "";
				if (userboard.userBoardActived == 'Y') {
					row += '<tr class="text-dark font-weight-bold">'
				} else if (userboard.userBoardActived == 'N') {
					row += '<tr class="text-muted">'
				}
				row +="<td>"+userboard.userBoardNo+"</td>";
				row +="<td>"+userboard.userId+"</td>";
				row +="<td id='boardTitle' class='text-left'><a class='text-dark' href='../board/userTotalBoardDetail.do?userBoardNo="+userboard.userBoardNo+"'>"+userboard.userBoardTitle+"</a></td>";
				if (userboard.userBoardWarnings >= 10) {
					row +="<td style='color:red;'>"+userboard.userBoardWarnings+"</td>";
				} else {
					row +="<td>"+userboard.userBoardWarnings+"</td>";
				}
				row +="<td>"+userboard.userBoardRegisteredDate+"</td>";
				if (userboard.userBoardActived == 'Y') {
					row +="<td><button class='btn btn-danger btn-sm' data-no="+userboard.userBoardNo+" data-actived='N'>정지</button></td>";
				}
				if (userboard.userBoardActived == 'N') {
					row += "<td><button class='btn btn-success btn-sm' data-no="+userboard.userBoardNo+" data-actived='Y'>활성</button></td>"
				}
				row +="</tr>";
				
				$("#userboard-list").append(row);
			})
		}
	});
}

$("#userboard-list").on("click","button", function() {
	var $button = $(this);
	console.log($button);
	
	var userboardNo = $(this).data("no");
	var userboardActived = $(this).attr("data-actived");
	$.ajax({
		type:"get",
		url:"/manager/changeUserBoardActive.do",
		data : {no: userboardNo, actived:userboardActived},
		dataType:"json",
		success:function(result) {
			console.log(result);
			if (result.userBoardActived == 'Y') {
				$button.removeClass("btn-success").addClass("btn-danger").attr('data-actived', 'N').text("정지");
				$button.parents('tr').removeClass('text-muted').addClass('text-dark font-weight-bold');
			}
			if (result.userBoardActived == 'N') {
				$button.removeClass("btn-danger").addClass("btn-success").attr('data-actived', 'Y').text("활성");
				$button.parents('tr').removeClass('text-dark').removeClass('font-weight-bold').addClass('text-muted');
			}
		}
		
	})
})


function compBoardList() {
	
	$.ajax({
		type:"get",
		url:"/manager/compboardlist.do",
		success:function(result) {
			console.log(result);
			
			$.each(result, function(index, compboard) {
				
				var row = "";
				if (compboard.compBoardActived == 'Y') {
					row += '<tr class="text-dark font-weight-bold">'
				} else if (compboard.compBoardActived == 'N') {
					row += '<tr class="text-muted">'
				}
				row +="<td>"+compboard.compBoardNo+"</td>";
				row +="<td>"+compboard.companyId+"</td>";
				row +="<td id='boardTitle' class='text-left'><a class='text-dark' href='../board/compBoardDetail.do?compBoardNo="+compboard.compBoardNo+"'>"+compboard.compBoardTitle+"</a></td>";
				if (compboard.compBoardWarnings >= 10) {
						row +="<td style='color: red;'>"+compboard.compBoardWarnings+"</td>";
				} else {
					row +="<td>"+compboard.compBoardWarnings+"</td>";
				}
				row +="<td>"+compboard.compBoardRegisteredDate+"</td>";
				if (compboard.compBoardActived == 'Y') {
					row +="<td><button class='btn btn-danger btn-sm' data-no="+compboard.compBoardNo+" data-actived='N'>정지</button></td>";
				}
				if (compboard.compBoardActived == 'N') {
					row += "<td><button class='btn btn-success btn-sm' data-no="+compboard.compBoardNo+" data-actived='Y'>활성</button></td>"
				}
				row +="</tr>";
				
				$("#compboard-list").append(row);
			})
		}
	});
}

$("#compboard-list").on("click","button", function() {
	var $button = $(this);
	
	var compboardNo = $(this).data("no");
	var compboardActived = $(this).attr("data-actived");
	$.ajax({
		type:"get",
		url:"/manager/changeCompBoardActive.do",
		data : {no: compboardNo, actived: compboardActived},
		dataType:"json",
		success:function(result) {
			console.log(result);
			if (result.actived == 'Y') {
				$button.removeClass("btn-success").addClass("btn-danger").attr('data-actived', 'N').text("정지");
				$button.parents('tr').removeClass('text-muted').addClass('text-dark font-weight-bold');
			}
			if (result.actived == 'N') {
				$button.removeClass("btn-danger").addClass("btn-success").attr('data-actived', 'Y').text("활성");
				$button.parents('tr').removeClass('text-dark').removeClass('font-weight-bold').addClass('text-muted');
			}
		}
	})
})

function tagList() {
	$.ajax({
		type:"get",
		url:"/manager/alltags.do",
		success:function(result) {
			console.log(result);
			
			$.each(result, function(index, tag) {
				
				$("#tag-list").append( 
						"<button class='btn btn-outline-dark mt-1 ml-2' >"+tag.name+"</button>");
				
				/*
				$("#tag-list").append( 
						"<button class='btn btn-outline-dark mt-1 ml-2' >"
						+tag.name+						
						"  <span class='badge badge-danger' type='button' data-no="+tag.no+">X</span></button>");
				*/
			})
		}
	});
}

$("#tag-list").on("click","badge", function() {
	var $badge = $(this);
	
	var tagNo = $(this).data("no");

	console.log(tagNo);
})

</script>
</body>
</html>