<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>

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
<body style="background-image:url('/resources/img/made_whale.gif');">
<div class="container-fluid">
	<div class="header">
		<div class="row">
			<div class="col-12 bg-light">
				<%@ include file="../common/navbar.jsp" %>	
			</div>
		</div>
	</div>
	
	<div class="body" style="margin-top:72px">
		<div class="row">
			<div class="offset-4"></div>
			<div class="col-4" >
				<div class="card" id="card" style="margin-top:230px; background-color: rgba(245, 245, 245, 1); opacity: 0.3;">
					<div class="card-body" >
					<c:choose>
						<c:when test="${param.error eq 'fail' }">
							<div class="alert alert-danger">
								<strong>로그인 실패</strong> 아이디 혹은 비밀번호가 올바르지 않습니다
							</div>
						</c:when>
						<c:when test="${param.error eq 'deny' }">
							<div class="alert alert-danger">
								<strong>서비스 거부</strong> 해당 서비스의 접근이 거부되었습니다
							</div>
						</c:when>
					</c:choose>
						<div class="text-center" style="margin-top:20px; margin-bottom:20px">
							기업 로그인
						</div>
						<!-- form 구분 안에 submit 버튼 넣고, 목적지 확인하고, name 값은 vo의 변수명과 동일한지 확인 -->
						<form id="form-login" method="POST" action="complogincheck.do">
							<div class="form-group">
								<label for="input-id">ID</label>
								<input type="text" class="form-control" placeholder="아이디를 입력하세요" name="id" id="input-id" >
							</div>
							<div class="form-group">
								<label for="input-pwd" style="margin-top:10px">PWD</label>
								<input type="password" class="form-control" placeholder="비밀번호를 입력하세요" name="password" id="input-pwd">
							</div>
							<div style="margin-top:30px">
								<a href="/user/compsignupform.do" class="btn btn-success float-left">회원가입</a>
								<button type="submit" class="btn btn-primary float-right">로그인</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="offset-4"></div>
		</div>
	</div>
	
</div>
<script type="text/javascript" src="/resources/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#card").hover(function() {
		$(this).css("opacity", "1.0");
	}, function() {
		$(this).css("opacity", "0.3");
	})
})
</script>
</body>
</html>