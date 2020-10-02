<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html>
<head>
<style>
    * {
        margin: 0;
        padding: 0;
        list-style: none;
    }
    ul {
        padding: 16px 0;
    }
    ul li {
        display: inline-block;
        margin: 0 5px;
        font-size: 14px;
        letter-spacing: -.5px;
    }
    form {
        padding-top: 16px;
    }
    ul li.tag-item {
        padding: 4px 8px;
        background-color: #777;
        color: #000;
    }
    .tag-item:hover {
        background-color: #262626;
        color: #fff;
    }
    .del-btn {
        font-size: 12px;
        font-weight: bold;
        cursor: pointer;
        margin-left: 8px;
    }
</style>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
<link rel="icon" href="/resources/favicon.ico" type="image/x-icon">
<title>Community Main</title>
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
	
	<div class="body pt-10" style="margin-top: 100px;">
		<div class="row">
			<!-- 사이드바 include -->
			<div class="col-2 bg-light" style="background-image: url('https://whale-store.pstatic.net/20191111_63/1573440818118JES0l_PNG/nightwhale_img02.png');">
				<%@ include file="../common/sidebar-common.jsp" %>
			</div>
			<!-- content 시작 -->
			<div class="col-10" id="content-div" style="height: 800px;">
				<div class="row justify-content-between">
					<div class="col-12 p-3">
						<div id="commuListArea" class="row">
							<div class="col-xl-2 col-lg-3 col-md-4 col-sm-6 col-12 d-flex justify-content-center p-2">
								<!-- 고정 -->
								<div id="defaultForm" class="card bg-light p-1" style="width: 100%; display: block;">
									<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTHcieD3HYe86IANMcc_6B7ThBQeqakRQMz0g&usqp=CAU" alt="thumnailOfUser" class="card-img-top p-1" style="width: 100%; height: 50%;">
									<div class="card-body p-1">
										<h6 class="card-title font-weight-bold">커뮤니티 생성</h6>
										<p class='card-text'>커뮤니티를 생성하고, 다양한 정보를 교류해보세요.</p>
										<p class='card-text'>NEW,COMMUNITY,FREE</p>
										<a href="#" class="btn btn-primary btn-block" onclick="createForm()">New Community</a>
										
									</div>
								</div>
								<!-- 커뮤니티 생성폼 -->
								<div id="createForm" class="card bg-light p-1" style="width: 250px; display: none">
									<div class="card-body p-1">
										<form id="form-community" method="POST" action="createCommunity.do">
											<div id="tag-box"></div>
											<div class="form-group">
												<div class="input-group mb-3 input-group-sm">
													<input type="text" id="commu-title" class="form-control" name="title" required placeholder="Title">
													<div class="valid-feedback">Valid.</div>
    												<div class="invalid-feedback">Please fill out this field.</div>
												</div>
								        	</div>
											<div class="form-group">
												<div class="input-group mb-3 input-group-sm">
													<input type="text" id="commu-intro" class="form-control" name="intro" placeholder="Intro">
												</div>
								        	</div>
											<div class="form-group">
												<div class="input-group mb-3 input-group-sm">
													<input type="text" id="commu-password" class="form-control" name="password" placeholder="Password">
												</div>
								        	</div>
											<div class="form-group">
												<div class="input-group mb-3 input-group-sm">
													<input type="text" id="commu-tags" class="form-control" name="tags" placeholder="Tags " 
															 data-toggle="modal" data-target="#tag-list" style="width: 130px;" readonly="readonly">
												</div>
								        	</div>
								        	<button type="button" class="btn btn-primary btn-block" id="new-community">New Community</button>
										</form>
									</div>
								</div>
								<!-- 커뮤니티 태그 선택폼 -->
								<div class="modal fade" id="tag-list" tabindex="-1"
									aria-labelledby="hashtag-list" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="hashtag-list">HashTag</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body" id="tagArea">
												
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">Close</button>
												<button type="button" class="btn btn-primary" id="save">Save</button>
											</div>
										</div>
									</div>
								</div>
								<!-- 커뮤니티 비밀번호 질의 폼 -->
								<div class="modal fade" id="checkPassword-form" tabindex="-1"
									aria-labelledby="hashtag-list" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-body" id="checkPassword-body">
												<div class="input-group mb-3 input-group-sm">
													<input type="password" id="checkPassword-password" class="form-control" placeholder="Password">
													<input type="hidden" id="checkPassword-commuNo" value="">
												</div>
												<div class="row">
													<div class="col-6">
														<button type="button" class="btn btn-secondary btn-block" data-dismiss="modal">Close</button>
													</div>
													<div class="col-6">
														<button type="button" class="btn btn-primary btn-block" id="checkPassword-btn">Check</button>
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
		</div>
	</div>
</div>
<script type="text/javascript" src="../resources/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
// main페이지 랜딩과 동시에 전체 커뮤니티 리스트 조회
retrieveCommunity();

function retrieveCommunity() {
	commonAjax('/community/retrieveCommunity.do', '', 'get', function(result){
		console.log('ajax 결과값 result ---->', result);
		
		var communuty = '';
		
		$.each(result, function (key, value) {
			/* 커뮤니티 번호, 커뮤니티 생성자 번호는 입장시 쿼리스트링에 붙여서 가야함. */
			/* 태그표시, 게스트수표시, 이미지표시, 만들어진날짜표시 추가해야함. */
			communuty  +="<div class='col-xl-2 col-lg-3 col-md-4 col-sm-6 col-12 d-flex justify-content-center p-2'>"
					   + "<div class='card bg-light p-1' style='width:100%'>"
					   + "<div id='checkPassword-"+value.commuNo+"' style='display:none;'>"+value.commuPassword+"</div>"
		     		   + "<img src='../../resources/contentfile/"+ value.commuImg +"' download alt='thumnailOfUser' class='card-img-top p-1' style='width:100%; height:50%;'>"
		    		   + "<div class='card-body p-1'>"
		         	   + "<h6 class='card-title font-weight-bold'>" + value.commuTitle + "</h6>"
		         	   + "<p class='card-text'>" + value.commuIntro + "</p>"
		         	   + "<p class='card-text'>" + 
		         	   $.each(value.tags, function (tag) {
		         		   tag
					   })	
					   + "</p>"
		         	   + "<a href='#' class='btn btn-outline-info btn-block' onclick='checkCommuPassword("+ value.commuNo +")'>JOIN</a>"
		     		   + "</div></div></div>";
		})
		$("#commuListArea").append(communuty);
	})
}



// 커뮤니티 리스트에서 특정 커뮤니티 입장시 실행
function goCommunity(commuNo) {
	location.href="/community/goCommunity.do?communityNo="+commuNo;
}



// 커뮤니티 카드 클릭시 비밀번호 유/무 체크 및 해당하는 로직 실행
function checkCommuPassword(commuNo) {
	
	
	var checkPassword = $("#checkPassword-"+commuNo).text();
	// 공개방
	if(checkPassword == 'n'){
		goCommunity(commuNo);
	// 비밀방
	} else {
		$("#checkPassword-commuNo").val(commuNo);	    
		$("#checkPassword-form").modal('show');
	}
}



// 커뮤니티 비밀번호 검사 및 해당하는 로직 실행
$("#checkPassword-btn").click(function () {
	// 입력된 비밀번호
	var communityNo = $("#checkPassword-commuNo").val();
	// 서버로 보낼 데이터 (커뮤니티 번호, 입력된 비밀번호)
	var paramData = {
			commuNo : communityNo,
			password : $("#checkPassword-password").val()
	}
	// 서버로 전송 및 결과값을 받아 로직 실행
	commonAjax('/community/checkPassword.do', paramData, 'get', function(result){
		console.log('--- ajax 결과값 result ---');
		// 비밀번호 일치
		if(result) {
			console.log('password일치!');
			$("#checkPassword-password").val('');
			goCommunity(communityNo);
		// 비밀번호 불일치
		} else {
			console.log('password불일치!');
			$("#checkPassword-password").val('');
			$("#checkPassword-password").attr('placeholder', 'Password mismatch');
			$("#checkPassword-password").attr('style', 'border: solid 3px red;');
		}
	})
})



// 비밀번호 모달창이 닫히는 경우 실행
$('#checkPassword-form').on('hidden.bs.modal', function () {
	$("#checkPassword-password").attr('placeholder', 'Password');
	$("#checkPassword-password").attr('style', 'none;');
})



// 커뮤니티 생성 폼
function createForm() {
	$("#defaultForm").hide();
	$("#tagForm").hide();
	$("#createForm").show();
	$("#commu-title").val('');
	$("#commu-content").val('');
	$("#commu-password").val('');
	
	// 태그리스트 가져오기
	getAllTags();
}




// 태그 선택을 마치고 확인을 누르면 createForm으로 이동하고 태그인풋자리에 선택된 태그를 나열해준다.
function getAllTags() {
	// ajax로 태그 조회
	commonAjax('/community/retrieveAllTags.do', '', 'get', function(result){
		console.log('--- ajax AllTags 결과값 result ---');
		console.log(result);
		
		var tagFront = '<h4>FrontEnd</h4>';
		var tagBack = '<h4>BackEnd</h4>';
		var tagDB = '<h4>DataBase</h4>';
		var tagMobile = '<h4>Mobile</h4>';
		
		// 태그폼에 출력
		$.each(result, function (key, value) {
			if(value.categoryName == '프론트앤드') {
				tagFront += "<div class='custom-control custom-checkbox mb-3'>"
						 + "<input value="+value.tagNo+" data-tag-no="+value.tagNo+" data-tag-name="+value.tagName+" type='checkbox' class='custom-control-input' id="+value.tagNo+" required='required' >"
						 + "<label class='custom-control-label' for="+value.tagNo+">"+value.tagName+"</label>"
						 + "</div>";				
			} else if(value.categoryName == '백앤드') {
				tagBack += "<div class='custom-control custom-checkbox mb-3'>"
					 + "<input value="+value.tagNo+" data-tag-no="+value.tagNo+" data-tag-name="+value.tagName+" type='checkbox' class='custom-control-input' id="+value.tagNo+" required='required' >"
					 + "<label class='custom-control-label' for="+value.tagNo+">"+value.tagName+"</label>"
					 + "</div>";
			} else if(value.categoryName == '데이터베이스') {
				tagDB += "<div class='custom-control custom-checkbox mb-3'>"
					 + "<input value="+value.tagNo+" data-tag-no="+value.tagNo+" data-tag-name="+value.tagName+" type='checkbox' class='custom-control-input' id="+value.tagNo+" required='required' >"
					 + "<label class='custom-control-label' for="+value.tagNo+">"+value.tagName+"</label>"
					 + "</div>";
			} else if(value.categoryName == '모바일') {
				tagMobile += "<div class='custom-control custom-checkbox mb-3'>"
					 + "<input value="+value.tagNo+" data-tag-no="+value.tagNo+" data-tag-name="+value.tagName+" type='checkbox' class='custom-control-input' id="+value.tagNo+" required='required' >"
					 + "<label class='custom-control-label' for="+value.tagNo+">"+value.tagName+"</label>"
					 + "</div>";
			}
		})
		
		$("#tagArea").append(tagFront);
		$("#tagArea").append(tagBack);
		$("#tagArea").append(tagDB);
		$("#tagArea").append(tagMobile);
	})
	
}



// 태그 중복선택 가능하도록 만들것
$('#save').click(function () {
	// 태그 폼 초기화	
	var $tagbox = $("#tag-box").empty();
	// 태그를 담을 변수 초기화
	var tags = [];
	// 입력된 태그 조회
	$("input[type='checkbox']:checked").each(function () {
		var tagNo = $(this).data("tag-no");
		var tagName = $(this).data("tag-name");
		
		tags.push(tagName);
		
		var $input = $("<input>");
		$input.attr("type", 'hidden')
		$input.attr('name', 'tags')
		$input.attr('value', tagNo);
		$tagbox.append($input);
	})
	// 조회한 태그에 #붙이기
	var tagsText = tags.map(function (value, index) {
		return '#' +value;
	}).join("   ");
	// 태그 폼에 표시
	$("#commu-tags").attr('placeholder', tagsText);
	// 태그 리스트 숨기기
	$("#tag-list").modal("hide");
})



// 커뮤니티 타이틀 중복검사
$('#commu-title').change(function () {
	// 입력된 타이틀
	$title = $('#commu-title');
	// 입력란 초기화
	var title = $title.val();
	// 서버에 입력된 타이틀 전송 및 중복검사 결과를 받아 로직 실행
	commonAjax('/community/checkTitle.do', {title: title}, 'get', function(result){
		// 중복 x -> data속성에 true추가
		if(result){
			$title.css({
				border : '1px solid black'
			}).attr('data', 'true');
		// 중복 o -> data속성에 false추가
		} else {
			$title.css({
				border : '1px solid red'
			}).attr('data', 'false');	
		}
	})
})



// 커뮤니티 생성전 타이틀 중복체크 및 결과에 따른 로직 실행
$('#new-community').click(function (event) {
	var status = $('#commu-title').attr('data');
	
	// 중복아닐경우 submit 실행
	if('true' == status){
		$('#new-community').attr('type', 'submit').submit();
	// 중복일 경우 알람창 실행
	// @@ 모달창으로 바꿀까?
	} else if ('false' == status){
		event.preventDefault();
		alert('커뮤니티 제목이 중복되었습니다!');
	}
})




// ajax 기본폼
function commonAjax(url, parameter, type, calbak, contentType){
	$.ajax({
		url: url,
		data: parameter,
		type: type,
		contentType : contentType!=null?contentType:'application/x-www-form-urlencoded; charset=UTF-8',
		success: function (res) {
			calbak(res);
		},
		error : function(err){
			console.log('error');
			calbak(err);
		}
	});
}
</script>
</body>
</html>
				
				
				
				
				
				
				
				
				
				