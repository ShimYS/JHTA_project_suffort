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
			<div class="col-2" style=" background-image: url('https://whale-store.pstatic.net/20191111_63/1573440818118JES0l_PNG/nightwhale_img02.png');" >
				<%@ include file="../common/sidebar-my.jsp" %>
			</div>
			<div class="col-10" id="content-div">
				<div class="row">
					<div class="col-12">
						<div class="jumbotron mt-3"  style="height: 230px;"><!-- 수정누르면 내용 변경 -->
						  <h2 style="display: inline;">${LOGIN_USERS.name }님의 게시판</h2>
						  <hr class="my-4">
						</div>
					</div>
				</div>
				
				
				<!-- 등록버튼을 누르면 사용자 마이페이지의 글쓰기로 넘어감 -->
				<div class="row pl-3" >
					<div class="col-3">
						<div class="card" style="width: 21rem; height: 380px;">
						  <div class="card-body">
						  	<a class="d-flex justify-content-center mt-5 pt-1" href="userBoardWrite.do"><img src="../../resources/img/pencil_whale.png" class="card-img-top " alt="..." style="width: 200px;'height: 200px;" id="hover-src"></a>
						  </div>
						</div>
					</div>
					
				
						<c:choose>
							<c:when test="${empty userMyPage }">
								<div class="col-3">
									<div class="card" style="width: 21rem; height: 380px;">
									  <div class="card-body">
									  	<p class="text-center">작성된 게시물이 없습니다.</p>
									  </div>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<c:forEach var="board" items="${userMyPage }">

									<div class="col-3 " >
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
													<img src="../../resources/img/하트.png" alt="..." style="height: 25px; display: none;">
													<img src="../../resources/img/빈하트_.png" alt="..." style="height: 25px;">
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
</body>
  <script type="text/javascript" src="/resources/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/resources/bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(function() {
	
	$(".card-body .btn-summary").click(function() {
		var userBoardNo = $(this).data("no");
		$.ajax({
			type:"GET",
			url:"/board/userSummaryBoard.do?userBoardNo="+userBoardNo,
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
</html>