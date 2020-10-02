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
<!-- 기업 전체 리스트 디테일 -->
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
			<div class="col-2"  style=" background-image: url('https://whale-store.pstatic.net/20191111_63/1573440818118JES0l_PNG/nightwhale_img02.png');">
				<%@ include file="../common/sidebar-company.jsp" %>
			</div>
			<div class="col-10" id="content-div">
				<div class="jumbotron mt-3"><!-- 수정누르면 내용 변경 -->
				  <h2>${compBoardDto.companyName }님의 게시물</h2>
				  <p>${compBoardDto.companyContent }</p>
				  <hr>
				  <p class="text-right mb-0 pb-0"><a href="${compBoardDto.companyUrl }" class=" mr-5 pr-5 small">${compBoardDto.companyUrl }</a></p>
				  
				  
				</div>
				
				<div class="row">
					<div class="col-12">
						<div class="card">
						  <img src="../../resources/img/uploadimg/${compBoardDto.companyLogo }" class="card-img-top" alt="..." style="height: 200px;">
						  <h4 class="card-header text-center">${compBoardDto.compBoardTitle }</h4>
						  <div class="card-body">
						    
						    <p class="card-text">${compBoardDto.compBoardContent }</p>
						  </div>
						  <div class="card-footer text-muted">
						  	<div class="row">
						  		<div class="col-12">
						  			<div class="row">
						  				<div class="col-6">
										    <div class="text-left">
										    	<fmt:formatDate value="${compBoardDto.compBoardRegisteredDate }"/>
										    </div>
						  				</div>
						  				<c:if test="${LOGIN_USERS.no eq compBoardDto.companyNo }">
						  				<div class="col-6">
										    <div class="text-right">
										    	<a class="btn btn-primary" href="compBoardModify.do?compBoardNo=${compBoardDto.compBoardNo }&companyNo=${compBoardDto.companyNo}"> 수정</a>
										    	<a class="btn btn-danger" id="compboard-delete" href="compBoardDelete.do?compBoardNo=${compBoardDto.compBoardNo }"> 삭제</a>
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

</script>
</body>
</html>