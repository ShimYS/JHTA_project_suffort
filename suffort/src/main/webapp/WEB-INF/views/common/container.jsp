<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title></title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container-fluid">
	<div class="header">
		<div class="row">
			<div class="col-12 bg-dark">
				<%@ include file="navbar.jsp" %>	
			</div>
		</div>
	</div>

	<div class="body">
		<div class="row">
			<div class="col-2 bg-light">
				<%@ include file="sidebar-common.jsp" %>
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
			</div>
		</div>
	</div>
</div>
</body>
</html>