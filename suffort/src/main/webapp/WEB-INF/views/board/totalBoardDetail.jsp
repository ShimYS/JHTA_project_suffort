<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
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
<!-- 회원 전체 리스트 디테일 -->
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
			<div class="col-2" style=" background-image: url('https://whale-store.pstatic.net/20191111_63/1573440818118JES0l_PNG/nightwhale_img02.png');">
				<%@ include file="../common/sidebar-my.jsp" %>
			</div>
			<div class="col-10" id="content-div">
				<div class="jumbotron mt-3"><!-- 수정누르면 내용 변경 -->
				  <h2>${boardDto.userId }님의 포트폴리오</h2>
				  <hr>
				  <p class="text-right mb-0 pb-0"><a href="${boardDto.userBoardGit }" class=" mr-5 pr-5 small">${boardDto.userBoardGit }</a></p>
				  
				</div>
				
				<div class="row">
					<div class="col-12">
						<div class="card">
						  <img src="${boardDto.userBoardImg }" class="card-img-top" alt="..." style="height: 200px;">
						  <h4 class="card-header text-center">${boardDto.userBoardTitle }<span class=" small text-muted">( ${boardDto.userBoardAccess } )</span></h4>
						  <div class="card-body">
						    
						    <p class="card-text">${boardDto.userBoardContent }</p>
						  </div>
						  <div class="card-footer text-muted">
						  	<div class="row">
						  		<div class="col-12">
						  			<div class="row">
						  				<div class="col-6">
										    <div class="text-left">
										    	<fmt:formatDate value="${boardDto.userBoardRegisteredDate }"/>
										    </div>
						  				</div>
						  				<c:if test="${LOGIN_USERS.no eq boardDto.userNo }">
						  				<div class="col-6">
										    <div class="text-right">
										    	<a class="btn btn-primary" href="userBoardModify.do?userBoardNo=${boardDto.userBoardNo }"> 수정</a>
										    	<a class="btn btn-danger" id="userboard-delete" href="userBoardDelete.do?userBoardNo=${boardDto.userBoardNo }"> 삭제</a>
										    </div>
						  				</div>
						  				</c:if>
						  			</div>
						  		</div>
						  	</div>
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
$(function(){
	$("#userboard-delete").click(function(){
		alert('삭제하시겠습니까?');
	})
})
</script>
</body>
</html>