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
<title>SearchList</title>
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
				<%@ include file="common/navbar.jsp" %>	
			</div>
		</div>
	</div>

	<div class="body" style="margin-top: 72px;">
		<div class="row">
			<div class="col-2" style="background-image: url('https://whale-store.pstatic.net/20191111_63/1573440818118JES0l_PNG/nightwhale_img02.png');">
				<%@ include file="common/sidebar-common.jsp" %>
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
				<input type="hidden" value="${param.keyword }" id="list-search-keyword" />
				
				<!-- userboard list -->
				<div class="row pl-3" >
					<div class="col-12">
						<div class="jumbotron mt-3" style="padding-top: 20px !important;" >
							<div style="display: inline;">회원 게시판 [총 ${userCount } 건]</div>
							<hr class="my-4">
							
							<div class="row" id="box1">					 	
								<c:choose>
									<c:when test="${empty searchUserBoards }">
										<div class="col-3">
											<div class="card" style="width: 21rem; height: 380px;">
												<div class="card-body">
													<p class="text-center">작성된 게시물이 없습니다.</p>

												</div>
											</div>
										</div>
									</c:when>
									<c:otherwise>
										<c:forEach var="board" items="${searchUserBoards }">
											<div class="col-3 " >
												<div class="card mb-3" style="width: 21rem;  height: 380px;">
													<a href="/board/userTotalBoardDetail.do?userBoardNo=${board.userBoardNo }&userNo=${board.userNo}"><img src="${board.userBoardImg }" class="card-img-top" alt="..." style="height: 180px;"></a>
													<div class="card-body">
														<h5 class="card-title" style="height: 43px;"><a href="/board/userTotalBoardDetail.do?userBoardNo=${board.userBoardNo }&userNo=${board.userNo}" class="text-dark">${board.userBoardTitle }</a></h5>
														<div style="height: 37px;">
															<c:forEach var="tag" items="${board.tags }">
																<p class="badge badge-secondary">${tag.tagName }</p>
															</c:forEach>
														</div>
																	    
														<button class="btn btn-sm btn-primary btn-summary" data-no="${board.userBoardNo }">Summary</button>
																	    
														<div style="height: 27px;">
															<p style="display: inline;">${board.userId }</p> 
																<div class="" style="display: inline; float: right;">
																<c:choose>
																	<c:when test="${not empty LOGIN_USERS }">
																		<a href="#"><img src="../../resources/img/빈하트_.png" alt="..." style="height: 25px;"></a>
																	</c:when>
																	<c:when test="${not empty LOGIN_COMPANY }">
																		<a href="#"><img src="../../resources/img/빈하트_.png" alt="..." style="height: 25px;"></a>
																	</c:when>
																</c:choose>
																			   		
																	<img src="../../resources/img/하트.png" alt="..." style="height: 25px; display: none;">
																</div>
														</div>
														<div class="text-right">
															<p class="text-muted"><fmt:formatDate value="${board.userBoardRegisteredDate }"/></p>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</div>
							<!-- 더보기 버튼 -->
							<div class="row">
								<div class="col-12">
									<div class="text-center">
										<button type="button" id="btn-more-user" class="btn btn-lg text-white mb-3" 
										style="background-image: url('https://whale-store.pstatic.net/20191111_63/1573440818118JES0l_PNG/nightwhale_img02.png');">더보기</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<!-- companyboard list -->
				<div class="row pl-3">
					<div class="col-12">
						<div class="jumbotron mt-3" style="padding-top: 20px !important;">
							<div style="display: inline;">기업 게시판 [총 ${compCount } 건]</div>
							<hr class="my-4">
							<div class="row" id="box2">
								<!-- 여기 -->
								<c:choose>
									<c:when test="${empty searchCompBoards }">
										<div class="col-3">
											<div class="card" style="width: 21rem; height: 380px;">
											  <div class="card-body">
											  	<p class="text-center">작성된 게시물이 없습니다.</p>
											  </div>
											</div>
										</div>
									</c:when>
									<c:otherwise>
										<c:forEach var="compBoard" items="${searchCompBoards }">
											<div class="col-3">
												<div class="card mb-3" style="width: 21rem;  height: 380px;">
												  <a href="/board/compBoardDetail.do?compBoardNo=${compBoard.compBoardNo }&companyNo=${compBoard.companyNo}"><img src="../../resources/img/uploadimg/${compBoard.companyLogo }" class="card-img-top" alt="..." style="height: 180px;"></a>
												  <div class="card-body">
												     <h5 class="card-title" style="height: 43px;"><a href="/board/compBoardDetail.do?compBoardNo=${compBoard.compBoardNo }&companyNo=${compBoard.companyNo}" class="text-dark">${compBoard.compBoardTitle }</a></h5>
												    <div style="height: 37px;">
												    	<c:forEach var="tag" items="${compBoard.tags }">
													    	<p class="badge badge-secondary">${tag.tagName }</p>
												    	</c:forEach>
												    </div>
												    
												    <button class="btn btn-sm btn-primary btn-summary" data-no="${compBoard.compBoardNo }">Summary</button>
												    
												    <div style="height: 27px;">
													    <p style="display: inline;">${compBoard.companyName }</p> 
													   	<div class="" style="display: inline; float: right;">
															<img src="../../resources/img/하트.png" alt="..." style="height: 25px; display: none;">
															<img src="../../resources/img/빈하트_.png" alt="..." style="height: 25px;">
													   	</div>
												    </div>
												   	<div class="text-right">
													    <p class="text-muted"><fmt:formatDate value="${compBoard.compBoardRegisteredDate }"/></p>
												   	</div>
												  </div>
												</div>
											</div>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="row">
								<div class="col-12">
									<div class="text-center">
										<button type="button" id="btn-more-company" class="btn btn-lg text-white mb-3" 
										style="background-image: url('https://whale-store.pstatic.net/20191111_63/1573440818118JES0l_PNG/nightwhale_img02.png');">더보기</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				
			</div>
			<!-- 회원/기업/커뮤니티 summary modal start -->
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
			<!-- 회원 summary modal end -->
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
			<!-- 기업 summary modal end -->
		</div>
	</div>
</div>

<script type="text/javascript" src="/resources/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function() {
	/*
	console.log("확인",$("#list-search-keyword").val());
	var currentPageNo = 1;
	var currentTagNo;
	var $list = $("#box");
	
	// 검색창 클릭시 현재 1페이지의 data
	$("#btn-search").click(function() {
		currentPageNo = 1;
		moreData();		
	})*/
	console.log("키워드확인",$("#list-search-keyword").val());
	var keyword = $('#list-search-keyword').val();
	// 더보기 버튼 클릭시 moreDate() 호출
	$("#btn-more-user").click(function() {
		location.href="/moreuser.do?keyword=" + keyword;
	});
	$("#btn-more-company").click(function() {
		location.href="/morecompany.do?keyword="+ keyword;
	});
	$("#btn-more-community").click(function() {
		location.href="/morecommunity.do?keyword="+ keyword;
	});
	
	/*
	moreData();
	
	function moreData() {
		var paramData = {pageNo:currentPageNo};
		var text = $("#list-search-keyword").val();
		if (text) {
			paramData["keyword"] = text;	
		}
		
		$.ajax({
			type:"GET",
			url:"/search.do",
			data:paramData,				// more.do?pageNo=1&keyword=자바  이런식으로 갈것임.
			success:function(result){
				console.log("result ->", result);
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
					row2 += '<a href="userTotalBoardDetail.do?userBoardNo='+board.userBoardNo+'"><img src="'+board.userBoardImg+'" class="card-img-top" alt="..." style="height: 180px;"></a>';
					row2 += '<div class="card-body">';
					row2 += '<h5 class="card-title" style="height: 43px;"><a href="userTotalBoardDetail.do?userBoardNo='+board.userBoardNo+'" class="text-dark">'+board.userBoardTitle+'</a></h5>';
					row2 += '<div style="height: 37px;">';
					
					$.each(board.tags, function(index, tag) {
						row2 += '<p class="badge badge-secondary mr-1">'+tag.tagName+'</p>';
					})
					
					row2 += '</div>';
					row2 += '<button class="btn btn-sm btn-primary btn-summary" data-no="'+board.userBoardNo+'">Summary</button>';
					row2 += '<div style="height: 27px;">';
					row2 += '<p style="display: inline;">'+board.userId+'</p>';
					row2 += '<div class="" style="display: inline; float: right;">';
					if(result.type == 'user'){
					row2 += '<a href="#"><img src="../../resources/img/빈하트_.png" alt="..." style="height: 25px;"></a>';
						
					}
					if(result.type == 'company') {
						row2 += '<a href="#"><img src="../../resources/img/빈하트_.png" alt="..." style="height: 25px;"></a>';
					}
					row2 += '<img src="../../resources/img/하트.png" alt="..." style="height: 25px; display: none;">';
					row2 += '</div></div>';
					row2 += '<div class="text-right"><p class="text-muted">'+board.userBoardRegisteredDate+'</p>';
				   	row2 += '</div></div></div></div>';
					
					$list.append(row2);
				}); 
				currentPageNo++;
			}
			
		}); 
	}
	
	/* var tagNo = '${param.tagNo}';
	if (tagNo) {
		$tagLink.closest('div.collapse').prev().trigger('click');
	}	 */
	
	/*
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
	
	*/
	$("#box1").on("click","button",function() {
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
	});
	
	$("#box2").on("click","button",function() {
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
	});
	
	
	$("#btn-open-summary").click(function() {
		$("#modal-comp-summary").modal("show");
	});
	
})
</script>

</body>
</html>