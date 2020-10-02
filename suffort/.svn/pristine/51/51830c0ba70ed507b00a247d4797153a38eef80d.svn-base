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
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
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
<!-- 사용자(회원) 전체 리스트 -->
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
			<div class="col-2" style="background-image: url('https://whale-store.pstatic.net/20191111_63/1573440818118JES0l_PNG/nightwhale_img02.png');">
				<%@ include file="../common/sidebar-common.jsp" %>
			</div>
			<div class="col-10" id="content-div">
				<div class="row">
					<div class="col-12">
						<div class="jumbotron mt-3"  style="height: 230px;"><!-- 수정누르면 내용 변경 -->
						  <h2 style="display: inline;">회원 게시판</h2>
						  <hr class="my-4">
						  <p class="">회원들의 포트폴리오 게시판</p>
						</div>
					</div>
				</div>
				<div class="row pr-3">
					<div class="col-12 mb-3 text-right">
						<a href="/board/userTotalBoard.do" class="btn text-light" style="background-image: url('https://whale-store.pstatic.net/20191111_63/1573440818118JES0l_PNG/nightwhale_img02.png');">회원 </a>
						<a href="/board/compTotalBoard.do"class="btn" style="border-color:black;">기업 </a>
					</div>
				</div>
				
				<!-- 등록버튼을 누르면 사용자 마이페이지의 글쓰기로 넘어감 -->
				<div class="row pl-3" id="box" >
					<c:choose>
						<c:when test="${LOGIN_TYPE eq 'naver' or LOGIN_TYPE eq 'user'}">
							<div class="col-3">
								<div class="card" style="width: 21rem; height: 380px;">
								  <div class="card-body">
								  	<a class="d-flex justify-content-center mt-5 pt-1" href="userBoardWrite.do"><img src="../../resources/img/pencil_whale.png" class="card-img-top " alt="..." style="width: 200px;'height: 200px;" id="hover-src"></a>
								  </div>
								</div>
							</div>
						</c:when>
					</c:choose>
					
				
						<%-- <c:choose>
							<c:when test="${empty userBoards }">
								<div class="col-3">
									<div class="card" style="width: 21rem; height: 380px;">
									  <div class="card-body">
									  	<p class="text-center">작성된 게시물이 없습니다.</p>
									  </div>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<c:forEach var="board" items="${userBoards }">

									<div class="col-3" id="user-board-list" >
										<div class="card mb-3" style="width: 21rem;  height: 380px;">
										  <a href="userTotalBoardDetail.do?userBoardNo=${board.userBoardNo }"><img src="${board.userBoardImg }" class="card-img-top" alt="..." style="height: 180px;"></a>
										  <div class="card-body">
										     <h5 class="card-title" style="height: 43px;"><a href="userTotalBoardDetail.do?userBoardNo=${board.userBoardNo }" class="text-dark">${board.userBoardTitle }</a></h5>
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
						</c:choose> --%>
				</div>
				<div class="row">
					<div class="col-12">
						<div class="text-center">
							<button type="button" id="btn-get-data" class="btn btn-lg text-white mb-3" style="background-image: url('https://whale-store.pstatic.net/20191111_63/1573440818118JES0l_PNG/nightwhale_img02.png');">더보기</button>
						</div>
					</div>
				</div>
			</div>
			<div class="modal" id="modal-summary">
		  		<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
		    		<div class="modal-content">
		      			<div class="modal-header">
		        			<h4 class="modal-title">포트폴리오 요약정보</h4>
		        			<button type="button" class="close" data-dismiss="modal">&times;</button>
		      			</div>
		      			<div class="modal-body">
		        			<table class="table table-bordered" id="table-summary-list">
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
			
			
		</div>
		
	</div>
</div>
<script type="text/javascript" src="/resources/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function() {
	var currentPageNo = 1;
	var currentTagNo;
	var $list = $("#box");
	
	$("#btn-get-data").click(function() {
		moreData();
	});
	
	function moreData() {
		var paramData = {pageNo:currentPageNo};
		if (currentTagNo) {
			paramData["tagNo"] = currentTagNo;
		}
		
		$.ajax({
			type:"GET",
			url:"/board/more.do",
			data:paramData,
			success:function(result){
				console.log("result ---->", result);
				if(currentPageNo == result.totalPages) {
					$("#btn-get-data").prop("disabled",true);
				}
				
				if (result.totalRows == 0) {
					var row1 = '<div class="col-3"><div class="card" style="width: 21rem; height: 380px;"><div class="card-body"><p class="text-center">작성된 게시물이 없습니다.</p></div></div></div>';
					$list.append(row1);
				}
				
				
				
				$.each(result.items, function(index, board){
					
					var row2 = '<div class="col-3" id="user-board-list" >';
					row2 += '<div class="card mb-3" style="width: 21rem;  height: 380px;">';
					row2 += '<a href="userTotalBoardDetail.do?userBoardNo='+board.userBoardNo+'&userNo='+board.userNo+'"><img src="'+board.userBoardImg+'" class="card-img-top" alt="..." style="height: 180px;"></a>';
					row2 += '<div class="card-body">';
					row2 += '<h5 class="card-title" style="height: 43px;"><a href="userTotalBoardDetail.do?userBoardNo='+board.userBoardNo+'&userNo='+board.userNo+'" class="text-dark">'+board.userBoardTitle+'</a></h5>';
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
			
		})
	}
	
	moreData();
	
	
	
	$("#box").on("click",".heart-box a",function(event) {
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
		
		/* 
		$.ajax({
			type:"GET",
			url:requestURL,
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
		}) */
		
	})
	
	
	/* var tagNo = '${param.tagNo}';
	if (tagNo) {
		$tagLink.closest('div.collapse').prev().trigger('click');
	}	 */
	
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
	
	
	
	
	$("#box").on("click","button",function() {
		var userBoardNo = $(this).data("no");
		$.ajax({
			type:"GET",
			url:"/board/userSummaryBoard.do?userBoardNo="+userBoardNo,
			data:{no:userBoardNo},
			dataType: "json",
			success:function(board) {
				console.log(board);
				$("#table-summary-list td:eq(1)").text(board.userId);
				$("#table-summary-list td:eq(2)").text(board.userBoardGit);
				$("#table-summary-list td:eq(3)").text(board.userBoardTitle);
				$("#table-summary-list td:eq(4)").text(board.tags[0].tagName+","+board.tags[1].tagName);
				$("#modal-summary").modal("show");
			}
				
		})
	});

	$("#hover-src").hover(function() {
		$(this).attr('src', '../../resources/img/whale_shy.png');
	}, function(){
		$(this).attr('src', '../../resources/img/pencil_whale.png');
		
	})
	
	
	
})
</script>
</body>
</html>