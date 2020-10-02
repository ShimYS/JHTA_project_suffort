<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<link rel="stylesheet" href="/resources/jquery/jquery.min.js">
<link rel="stylesheet" href="/resources/bootstrap/js/bootstrap.min.js">
<link rel="icon" href="/resources/favicon.ico" type="image/x-icon">
<title>Insert title here</title>
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
</style>
</head>
<body>
<div class="container-fluid">
	<div class="header">
		<div class="row">
			<div class="col-12 bg-dark">
				<%@ include file="../common/navbar.jsp" %>	
			</div>
		</div>
	</div>

	<div class="body" style="margin-top: 72px;">
		<div class="row">
			<div class="col-2" style="background-image: url('https://whale-store.pstatic.net/20191111_63/1573440818118JES0l_PNG/nightwhale_img02.png');">
				<%@ include file="../common/sidebar-common.jsp" %>
				<!-- 
					사이드바 역시 아래와 마찬가지로
					<@ include file="${sidebarLocation }" %> 해서 사용하면 매번 프론트단에서 사이드바를 갈아끼울 필요가 없다.
				 -->
			</div>
			<div class="col-10" id="content-div">
				<!-- 
					Controller에서 contentLocation 속성으로 각자 작성한 페이지.jsp를 넣어두면 여기에서 호출해 표시 
					<@ include file="${contentLocation }" %>
				-->
				<input type="hidden" value="${typelist }" id="list-type"/>
				<input type="hidden" value="${keyword }" id="list-keyword"/>
				
				<!-- userboard list -->
				<div class="row pl-3" >
					<div class="col-12">
						<div class="jumbotron mt-3" style="padding-top: 20px !important;" >
							<div style="display: inline;">더보기 게시판</div>
							<hr class="my-4">
							
							<div class="row" id="box2">
							<!-- 여기 -->
							</div>
							<div class="row">
								<div class="col-12">
									<div class="text-center">
										<button type="button" id="btn-get-data" class="btn btn-lg text-white mb-3" 
										style="background-image: url('https://whale-store.pstatic.net/20191111_63/1573440818118JES0l_PNG/nightwhale_img02.png');">더보기</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- summary modal start -->
			<!-- user summary modal -->
			<div class="modal" id="modal-user-summary">
		  		<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
		    		<div class="modal-content">
		      			<div class="modal-header">
		        			<h4 class="modal-title">포트폴리오 요약정보</h4>
		        			<button type="button" class="close" data-dismiss="modal">&times;</button>
		      			</div>
		      			<div class="modal-body">
		        			<table class="table table-bordered" id="table-usersummary-list">
								<!--<colgroup>
									<col width="15%">
									<col width="35%">
									<col width="15%">
									<col width="35%">
								</colgroup>-->
								<tbody>
									<tr>
										<th>썸네일</th><td colspan="3"><img src="../../resources/img/gray.jpg" alt="..." style="height: 180px; width: 100%"></td>
									</tr>
									<tr>
										<th>아이디</th><td></td>
										<th>깃주소</th><td></td>
									</tr>
									<tr>
										<th>제목</th><td colspan="3"></td>
									</tr>
									<tr>
										<th>해시태그</th><td colspan="3"></td>
									</tr>
								</tbody>
							</table>
		      			</div>
		      			<div class="modal-footer">
		        			<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
		      			</div>
		    		</div>
		  		</div>
			</div>
			
			<!-- comp summary modal -->
			<div class="modal" id="modal-comp-summary">
		  		<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable  modal-lg">
		    		<div class="modal-content">
		      			<div class="modal-header">
		        			<h4 class="modal-title">기업 게시물 요약정보</h4>
		        			<button type="button" class="close" data-dismiss="modal">&times;</button>
		      			</div>
		      			<div class="modal-body">
		        			<table class="table table-bordered" id="table-compsummary-list">
								<colgroup>
									<col width="30%">
									<col width="30%">
									<col width="15%">
									<col width="25%">
								</colgroup>
								<tbody>
									<tr>
										<th>썸네일</th><td colspan="3"><img id="compimg" src="../../resources/img/uploadimg/${compBoard.companyLogo }" alt="..." style="height: 180px; width: 100%"></td>
									</tr>
									<tr>
										<th>기업이름</th><td></td>
										<th>기업URL</th><td></td>
									</tr>
									<tr>
										<th>제목</th><td colspan="3"></td>
									</tr>
									<tr>
										<th>해시태그</th><td colspan="3"></td>
									</tr>
								</tbody>
							</table>
		      			</div>
		      			<div class="modal-footer">
		        			<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
		      			</div>
		    		</div>
		  		</div>
			</div>
			
		</div>
	</div>
</div>
</body>
<script type="text/javascript" src="/resources/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
	console.log($("#list-type").val());
	var typelist = $("#list-type").val()
	var keyword = $('#list-keyword').val();
	
	var currentPageNo = 1;
	var currentTagNo;
	var $list = $("#box2");
	
	moreData();
	
	$("#btn-get-data").click(function() {
		moreData();
	});
	
	function moreData() {
		var paramData = {pageNo:currentPageNo};
		if(currentTagNo){
			paramData["tagNo"] = currentTagNo;
		}
		if (keyword) {
			paramData["keyword"] = keyword;	
		}
		paramData['typelist'] = typelist;
		if ('user' == typelist) {
			userAjax(paramData);
		} else if ('company' == typelist) {
			compAjax(paramData);
		} else if ('community' == typelist) {
			commuAjax(paramData);
		}
	}
	
	function userAjax(paramData) {
		$.ajax({
			type:"GET",
			url: "/searchmore.do",
			data:paramData,				// more.do?pageNo=1&keyword=자바  이런식으로 갈것임.
			success:function(result){
				console.log("result ---->", result);
				if (result.totalRows == 0) {
					var row1 = '<div class="col-3"><div class="card" style="width: 21rem; height: 380px;"><div class="card-body"><p class="text-center">작성된 게시물이 없습니다.</p></div></div></div>';
					$list.append(row1);
					return false;
				}
				
				if(currentPageNo == result.totalPages) {
					$("#btn-get-data").prop("disabled",true);
				}
				
				
				$.each(result.items, function(index, board){
					var row2 = '<div class="col-3" id="user-board-list" >';
					row2 += '<div class="card mb-3" style="width: 21rem;  height: 380px;">';
					row2 += '<a href="/board/userTotalBoardDetail.do?userBoardNo='+board.userBoardNo+'&userNo='+board.userNo+'"><img src="'+board.userBoardImg+'" class="card-img-top" alt="..." style="height: 180px;"></a>';
					row2 += '<div class="card-body">';
					row2 += '<h5 class="card-title" style="height: 43px;"><a href="/board/userTotalBoardDetail.do?userBoardNo='+board.userBoardNo+'&userNo='+board.userNo+'" class="text-dark">'+board.userBoardTitle+'</a></h5>';
					row2 += '<div style="height: 37px;">';
					
					$.each(board.tags, function(index, tag) {
						row2 += '<p class="badge badge-secondary mr-1">'+tag.tagName+'</p>';
					})
					
					row2 += '</div>';
					row2 += '<button class="btn btn-sm btn-primary btn-summary" data-no="'+board.userBoardNo+'">Summary</button>';
					row2 += '<div style="height: 27px;">';
					row2 += '<p style="display: inline;">'+board.userId+'</p>';
					row2 += '<div class="heart-box" style="display: inline; float: right;">';
					if(result.type == 'user'){
						if (board.myLikes == 0) {
							row2 += '<a href="/board/userBoardUserLikes.do" data-heart-type="blank" data-board-no="'+board.userBoardNo+'"><img src="../../resources/img/'+board.heartImage+'" alt="..." style="height: 25px;"></a>';
						} else {
							row2 += '<a href="/board/userBoardUserUnLikes.do" data-heart-type="full" data-board-no='+board.userBoardNo+'><img src="../../resources/img/'+board.heartImage+'" alt="..." style="height: 25px; "></a>';
						}
						
					}
					if(result.type == 'company') {
						if(board.myLikes == 0){
							row2 += '<a href="/board/userBoardCompLikes.do" data-heart-type="blank" data-board-no="'+board.userBoardNo+'"><img src="../../resources/img/'+board.heartImage+'" alt="..." style="height: 25px;"></a>';
						} else {
							row2 += '<a href="/board/userBoardCompUnLikes.do" data-heart-type="full" data-board-no="'+board.userBoardNo+'"><img src="../../resources/img/'+board.heartImage+'" alt="..." style="height: 25px;"></a>';
						}
					}
					row2 += '</div></div>';
					row2 += '<div class="text-right"><p class="text-muted">'+board.userBoardRegisteredDate+'</p>';
				   	row2 += '</div></div></div></div>';
					
					$list.append(row2);
				}); 
				currentPageNo++;
			}
			
		}); 
	}
	
	function compAjax(paramData) {
		$.ajax({
			type:"GET",
			url:"/searchmore.do",
			data:paramData,
			success:function(result){
				console.log("result-->", result) 
				if(result.totalRows == 0) {
					var row1 = '<div class="col-3"><div class="card" style="width: 21rem; height: 380px;"><div class="card-body"><p class="text-center">작성된 게시물이 없습니다.</p></div></div></div>';
					$list.append(row1);
					return false;
				}
				if(currentPageNo == result.totalPages){
					$("#btn-get-data").prop("disabled",true);
				}
				
				$.each(result.items, function(index, compBoard){
					var row2='<div class="col-3" id="comp-board-list">';
					row2 += '<div class="card mb-3" style="width: 21rem;  height: 380px;">';
					row2 += ' <a href="/board/compBoardDetail.do?compBoardNo='+compBoard.compBoardNo+'&companyNo='+compBoard.companyNo+'"><img src="../../resources/img/uploadimg/'+compBoard.companyLogo+'" class="card-img-top" alt="..." style="height: 180px;"></a>';
					row2 += '<div class="card-body">';
					row2 += '<h5 class="card-title" style="height: 43px;"><a href="/board/compBoardDetail.do?compBoardNo='+compBoard.compBoardNo+'&companyNo='+compBoard.companyNo+'" class="text-dark">'+compBoard.compBoardTitle+'</a></h5>';
					row2 += '<div style="height: 37px;">';
					$.each(compBoard.tags, function(index, tag){
						row2 += '<p class="badge badge-secondary mr-1" data-tag-no='+tag.tagNo+'>'+tag.tagName+'</p>';
					})
					
					row2 += '</div>';
					row2 += '<button class="btn btn-sm btn-primary btn-summary" data-no="'+compBoard.compBoardNo+'">Summary</button>';
					row2 += '<div style="height: 27px;">';
					row2 += '<p style="display: inline;">'+compBoard.companyName+'</p> ';
					row2 += '<div class="heart-box" style="display: inline; float: right;">';
					if(result.type == 'user'){
						if (compBoard.myLikes == 0) {
							row2 += '<a href="/board/compBoardUserLikes.do" data-heart-type="blank"  data-board-no="'+compBoard.compBoardNo+'" ><img src="../../resources/img/'+compBoard.heartImage+'" alt="..." style="height: 25px;"></a>';
						} else {
							
							row2 += '<a href="/board/compBoardUserUnLikes.do" data-heart-type="full" data-board-no="'+compBoard.compBoardNo+'"><img src="../../resources/img/'+compBoard.heartImage+'" alt="..." style="height: 25px;"></a>';
						}
					}
					row2 += '</div></div>';
					row2 += '<div class="text-right">';
					row2 += ' <p class="text-muted">'+compBoard.compBoardRegisteredDate+'</p>';
					row2 += '</div></div></div></div>';
					
					$list.append(row2);
				});
				currentPageNo++;
			}
		})
	}
	
	$("#box2").on("click",".heart-box a",function(event) {
		event.preventDefault();
		
		var $link = $(this);
		
		$.ajax({
			type:"GET",
			url:$link.attr("href"),
			data:{userBoardNo:$(this).data('board-no')},
			success:function(result){
				var success = result.success
				var heart = result.heart
				if(success){
					if(heart == "full"){
						$link.find("img").attr("src","../../resources/img/하트.png");
						
					} else if(heart == "blank"){
						$link.find("img").attr("src","../../resources/img/빈하트_.png");
					}
				}
			}
		})
	})
	
	$(".collapse a").click(function(event) {
		event.preventDefault();
		var tagNo = $(this).data("tag-no");
		if(tagNo) {
			$("div.collapse span").removeClass('text-info font-weight-bold').addClass("text-secondary");
			
			var $tagLink = $("a[data-tag-no="+tagNo+"]");
			$tagLink.find("span").removeClass('text-secondary').addClass("text-info font-weight-bold")
				.closest("a").siblings().find('span').removeClass('text-info font-weight-bold').addClass("text-secondary");
			
			
			$list.empty();
			currentPageNo = 1;
			currentTagNo = tagNo;
			moreData();
			
			//location.href = "/board/userTotalBoard.do?tagNo="+tagNo;			
		}
		
	});
	
	$("li .main").click(function(event) {
		event.preventDefault();
		var tagNo = -1;
		if(tagNo) {
			location.href = "/board/userTotalBoard.do";
		}
	})
	
	// modal ajax
	$("#box2").on("click","button",function() {
		if ('user' == typelist) {
			var userBoardNo = $(this).data("no");
			$.ajax({
				type:"GET",
				url:"/board/userSummaryBoard.do?userBoardNo="+userBoardNo,
				data:{no:userBoardNo},
				dataType: "json",
				success:function(board) {
					console.log(board);
					$("#table-usersummary-list td:eq(1)").text(board.userId);
					$("#table-usersummary-list td:eq(2)").text(board.userBoardGit);
					$("#table-usersummary-list td:eq(3)").text(board.userBoardTitle);
					$("#table-usersummary-list td:eq(4)").text(board.tags[0].tagName+","+board.tags[1].tagName);
					$("#modal-user-summary").modal("show");
				}
					
			})
			
		} else if ('company' == typelist) {
			var compBoardNo = $(this).data("no");
			$.ajax({
				type:"GET",
				url:"/board/compSummaryBoard.do?compBoardNo="+compBoardNo,
				data:{no:compBoardNo},
				dataType: "json",
				success:function(compBoard) {
					console.log(compBoard);
					$("#compimg").attr('src', '../../resources/img/uploadimg/' + compBoard.companyLogo);
					$("#table-compsummary-list td:eq(1)").text(compBoard.companyName);
					$("#table-compsummary-list td:eq(2)").text(compBoard.companyUrl);
					$("#table-compsummary-list td:eq(3)").text(compBoard.compBoardTitle);
					$("#table-compsummary-list td:eq(4)").text(compBoard.tags[0].tagName+","+compBoard.tags[1].tagName);
					$("#modal-comp-summary").modal("show");
				}
					
			})
			
		}

	});
	
	
	
</script>
</html>