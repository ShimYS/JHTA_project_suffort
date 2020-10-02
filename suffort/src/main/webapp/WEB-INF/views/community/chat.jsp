<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
<style type="text/css">
/* Chat containers */
.container {
	border: 2px solid #dedede;
	background-color: #f1f1f1;
	border-radius: 5px;
	padding: 10px;
	margin: 10px 0;
}

/* Darker chat container */
.darker {
	border-color: #ccc;
	background-color: #ddd;
}

/* Clear floats */
.container::after {
	content: "";
	clear: both;
	display: table;
}

/* Style images */
.container img {
	float: left;
	max-width: 60px;
	width: 100%;
	margin-right: 20px;
	border-radius: 50%;
}

/* Style the right image */
.container img.right {
	float: right;
	margin-left: 20px;
	margin-right: 0;
}

/* Style time text */
.time-right {
	float: right;
	color: #aaa;
}

/* Style time text */
.time-left {
	float: left;
	color: #999;
}

div {
	border: 1px solid red;
}

</style>
<meta charset="UTF-8">
<title>Community Inside</title>
</head>
<body>
	<div class="container-fluid">
		<div class="header">
			<div class="row">
				<div class="col-12 bg-dark">
					<%@ include file="../common/navbar.jsp"%>
				</div>
			</div>
		</div>
		<div class="body" style="margin-top: 73px;">
			<div class="row">
				<!-- 사이드바 include -->
				<div class="col-2 bg-light">
					<%@ include file="../common/sidebar-community.jsp"%>
				</div>
				<!-- content 시작 -->
				<div class="col-10" id="content-div">
					<div class="row">
						<div class="col-12">
							<div class="card mt-3" >
								<div class="card-header">
									<div class="row">
										<div class="col-8">
											<h1 id="communityTitle"></h1>
											<input type="hidden" id="sessionId" value="">
											<!-- 최초 웹소켓 연결시 서버로부터 반환받아서 이곳에 넣어두기 -->
											<input type="hidden" id="communityNo" value="${communityNo }">
											<input type="hidden" id="userNo" value="${userNo }">
										</div>
										<div class="col-4 d-flex">
											<div class="row">
												<div class="col-6">
													
													<div id="comGuestList"></div>
													
													<!-- 최근 접속자 프로필사진 중복해서 출력 -->
													<!-- 사람모양의 이미지 + 방 현재 접속자 수 출력 -->
													<!-- 클릭하면 전체 접속자 보이게하고 그 중 현재 접속자는 우측 초록불 출력 -->
													
												</div>
												<div class="col-6">
													<div class="dropdown">
														<div data-toggle="dropdown">
															<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-gear-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
																<path fill-rule="evenodd" d="M9.405 1.05c-.413-1.4-2.397-1.4-2.81 0l-.1.34a1.464 1.464 0 0 1-2.105.872l-.31-.17c-1.283-.698-2.686.705-1.987 1.987l.169.311c.446.82.023 1.841-.872 2.105l-.34.1c-1.4.413-1.4 2.397 0 2.81l.34.1a1.464 1.464 0 0 1 .872 2.105l-.17.31c-.698 1.283.705 2.686 1.987 1.987l.311-.169a1.464 1.464 0 0 1 2.105.872l.1.34c.413 1.4 2.397 1.4 2.81 0l.1-.34a1.464 1.464 0 0 1 2.105-.872l.31.17c1.283.698 2.686-.705 1.987-1.987l-.169-.311a1.464 1.464 0 0 1 .872-2.105l.34-.1c1.4-.413 1.4-2.397 0-2.81l-.34-.1a1.464 1.464 0 0 1-.872-2.105l.17-.31c.698-1.283-.705-2.686-1.987-1.987l-.311.169a1.464 1.464 0 0 1-2.105-.872l-.1-.34zM8 10.93a2.929 2.929 0 1 0 0-5.86 2.929 2.929 0 0 0 0 5.858z"/>
															</svg>
														</div>
														<div class="dropdown-menu dropdown-menu-right">
															<a class="dropdown-item" id="edit-commuinfo" href="#" data-toggle="modal" data-target="#EditModal" style="display: none">Edit Info</a>
															<a class="dropdown-item" id="edit-commuimg" href="#" style="display: none">Edit Img</a>
															<a class="dropdown-item" href="#" >Add People</a>
															<a class="dropdown-item" href="#">Show People</a>
															<div class="dropdown-divider"></div>
															<a class="dropdown-item" href="#" id="communityTitle2" onclick="socketClose()"></a>
															<a class="dropdown-item" href="#" id="communityTitle3" onclick="departAndClose()"></a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									
								</div>
								<div class="card-body mb-3 pb-0 b-0">
									<div id="chattingArea" style="overflow:auto;">
									
									<!-- 대화 정보가 출력되는 곳 -->
									</div>
								</div>
								<div class="card-footer mb-3 pb-0 b-0">
									
										<div class="input-group mb-3 input-group-lg">
											
											<!-- 웹소켓으로 파일 업로드 
											<div class="input-group mb-3 input-group-sm">
												<input type="file" id="fileUpload">
												<button onclick="fileSend()" id="sendFileBtn">파일올리기</button>
											</div>
											-->
											
											<!-- 파일 업로드 테스트 -->
											<form id="fileForm" method="post" enctype="multipart/form-data">
												<input type="file" name="file" >
												<input type="hidden" name="communo"  value="${communityNo }">
												<input type="hidden" name="userno"  value="${userNo }">
												<input type="button" value="Upload" onclick="ajaxFileUpload()">
											</form>

										
											<input id="chatting" type="text" class="form-control" placeholder="Message"
												aria-label="Message" aria-describedby="button-addon2"
												style="width: 50px;">
											<div class="input-group-append">
												<button class="btn btn-outline-secondary" type="button"
													id="sendBtn" onclick="send()">Button</button>
											</div>
										</div>
								</div>
							</div>
							
						</div>
					</div>
					<!-- Edit모달 -->
					<div class="modal fade" id="EditModal">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
								<div class="modal-body">
									<form id="form-community">
										<div class="form-group">
											<div class="input-group mb-3 input-group-sm">
												<input type="text" id="commu-title" class="form-control" name="title" value="onmessage에서 받아서 설정">
											</div>
										</div>
										<div class="form-group">
											<div class="input-group mb-3 input-group-sm">
												<input type="text" id="commu-intro" class="form-control" name="intro" value="onmessage에서 받아서 설정">
											</div>
										</div>
										<div class="form-group">
											<div class="input-group mb-3 input-group-sm">
												<input type="password" id="commu-password" class="form-control" name="password" placeholder="Password">
											</div>
										</div>
										<!-- 이미지 수정 다른곳에서 구현하기
										<div class="form-group">
											<div class="input-group mb-3 input-group-sm">
												<input type="file" id="commu-image" class="form-control-file border" name="image" placeholder="Choose Image only">
											</div>
										</div>
										-->
										<div class="form-group" style="display: none;">
											<div class="input-group mb-3 input-group-sm">
												<input type="hidden" id="commu-no" value="${communityNo }" name="communo">
											</div>
										</div>
										<div class="form-group" style="display: none;">
											<div class="input-group mb-3 input-group-sm">
												<input type="hidden" id="bj-no" value="" name="bjno">
											</div>
										</div>
										<button type="button" class="btn btn-primary btn-block" data-dismiss="modal" onclick="updateCommunity()">Edit</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
		
	  
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<script type="text/javascript">
// inside페이지 랜딩과 동시에 실행
connect();

// 웹소켓 객체
var ws;

// 웹소켓 연결
function connect() {
	// 웹소켓 연결 (with 방번호, 유저번호)
	ws = new WebSocket("ws://192.168.10.221/community/inside/"
			+ $("#communityNo").val() + "&" + $("#userNo").val());
	
	// 웹소켓 에러시 실행
	ws.onerror = function(error) {
		// 에러메시지 출력
		console.log(error);
	}
	// 웹소켓 연결 중 실행
	ws.onopen = function() {
		console.log('소켓 연결됨!');

		// 서버로부터 값을 받았을 때 실행
		ws.onmessage = function(data) {
			console.log('서버에서 메세지 받음');
			console.log(data);
			// 서버로부터 받은 data에서 메시지 꺼내기
			var message = data.data;
			console.log('data객체 : ', message);
			// 서버로부터 받은 메세지 null검사
			if (message != null && message.trim() != '') {
				console.log('--- message null 체크 후 출력 함수 진입 ---')
				// 메세지를 JSONObject로 변환
				var object = JSON.parse(message);
				console.log('data객체 JSONObject로 변환 : ', object);
				// 받아온 웹소켓세션아이디 히든에 숨기기
				$("#sessionId").val(object.sessionId);
				
				// ################## 메세지 타입에 따라서 로직을 분리 ##################
				
				// 메세지타입이 'connect' => (handshake 성공 후)
				if (object.type == "connect") {
					// 커뮤니티 타이틀 
					$("#communityTitle").text(object.community.title);
					$("#communityTitle2").text('Leave #' + object.community.title);
					$("#communityTitle3").text('Depart #' + object.community.title);
					$("#commu-title").val(object.community.title);
					// 커뮤니티 인트로
					$("#commu-intro").val(object.community.intro);
					// @@ 커뮤니티 intro 소개란 만들어지면 값 넣는 코드 이자리에 추가해야함
					// 커뮤니티 생성자
					$("#bj-no").val(object.community.userNo);
					
					
					// 커뮤니티 접속자 출력
					$("#comGuestList").text('');
					for (var i = 0; i < object.currentUser.length; i++) {
						// 커뮤니티장(방장)
						if (object.currentUser[i].CommunitiesGrade == '방장') {
							var name = object.currentUser[i].userName;
							$("#comGuestList").append("<p><strong>" + name + "</strong></p>");
							// 커뮤니티 일반회원
						} else {
							var name = object.currentUser[i].userName;
							$("#comGuestList").append("<p>" + name + "</p>");
						}
					}
					// 커뮤니티 접속 인원수 표시
					var currentGuestCnt = object.currentUser.length;
					var communityGuestCnt = object.communityGuests.length;
					$("#comGuestList").append("<p>" + currentGuestCnt +"/"+ communityGuestCnt + "</p>");
					
					
					// 커뮤니티 사이드바 참여중인 커뮤니티와 새로운 컨텐츠 개수 표시
					// @@ myCommuAndNewContents() 실행
					myCommuAndNewContents(object);
					
					// 커뮤니티 참여중인 유저 리스트와 상세정보 제공
					// @@ 게스트 출력 코딩 할곳 
					// @@ 세션아이디 히든으로 숨기기

					// 기존 컨텐츠 표시
					// @@ 컨텐츠의 유저번호와 히든의 유저번호가 일치하면 우측정렬, 불일치하면 좌측정렬 
					$("#chattingArea").text('');
					$.each(object.contents, function(key, content) {
						savedAppendMessage(key, content);
					})
					
					// 커뮤니티 수정 버튼 활성/비활성 표시 ('커뮤니티장'은 수정 버튼 활성화, 일반회원은 비활성화)
					var bjNo = $("#bj-no").val();
					var userNo = $("#userNo").val();
					if(bjNo == userNo){
						$("#edit-commuinfo").show();
						$("#edit-commuimg").show();
					}
					
					
					
				// 메세지타입이 'message' (서버로부터 컨텐츠 수신)
				} else if (object.type == "message") {
					console.log('=== message type인 경우 ===')
					// 컨텐츠 출력 함수 실행
					appendMessage(object);
					
					
					
					
					// 메세지타입이 'update' (커뮤니티정보 수정 후)
				} else if (object.type == "update") {
					console.log('=== update type인 경우 ===');
					if('error' == object.status) {
						// @@ 경고창 띄워주기.
						alert('업데이트 권한이 없습니다!');
					} else {
						// 수정된 커뮤니티 타이틀 설정
						$("#communityTitle").text(object.community.title);
						$("#communityTitle2").text('Leave #' + object.community.title);
						$("#communityTitle3").text('Depart #' + object.community.title);
						$("#commu-title").val(object.community.title);
						// 수정된 커뮤니티 인트로 설정
						$("#commu-intro").val(object.community.intro);
						// @@ 커뮤니티 intro 소개란 만들어지면 값 넣는 코드 이자리에 추가해야함
						// 수정된 커뮤니티 생성자 설정
						$("#bj-no").val(object.community.userNo);
					}
					
					
					
					
					// 메세지타입이 'remove' (특정 웹소켓세션 제거 후)
				} else if (object.type == "remove") {
					console.log('=== remove type인 경우 ===');
					// @@ 디자인 수정 필요 
					// 커뮤니티 접속자 출력
					$("#comGuestList").text('');
					for (var i = 0; i < object.currentUser.length; i++) {
						// 커뮤니티장(방장)
						if (object.currentUser[i].CommunitiesGrade == '방장') {
							var name = object.currentUser[i].userName;
							$("#comGuestList").append("<p><strong>" + name + "</strong></p>");
							// 일반회원
						} else {
							var name = object.currentUser[i].userName;
							$("#comGuestList").append("<p>" + name + "</p>");
						}
					}
					// 커뮤니티 접속 인원수 표시
					var currentGuestCnt = object.currentUser.length;
					var communityGuestCnt = object.communityGuests.length;
					$("#comGuestList").append("<p>" + currentGuestCnt +"/"+ communityGuestCnt + "</p>");
				} else if (object.type == "close") {
					console.log('=== close type인 경우 ===');
					socketClose();
					
				} else if (object.type == "fileUpload") {
					console.log('=== fileUpload type인 경우 ===');
					appendMessage(object);
				} else if (object.type == "myCommuNewContents") {
					myCommuAndNewContents(object);
				}
			}
		};
	}
	
	// 의도적인 웹소켓 해제가 아닌경우 실행 (예: 새로고침)
	ws.onclose = function() {
		// 웹소켓 연결을 재요청
		connect();
	};

}



// 의도적으로 웹소켓 해제를 할 경우
function socketClose() {
	location.href = "/community/main.do";
}




// @@ 아무런 컨텐츠도 적지않고 메세지 전송버튼을 누르면 메세지 입력창 포커스효과 및 외곽선 색바꾸고, 메시지 입력창 내부에 경고입력 또는 모달 또는 alert



// 해당 커뮤니티 탈퇴 (퇴실이 아닌 해당 커뮤니티에서의 본인 접속기록 제거)
function departAndClose() {
	var option = {
		type : "depart",
		communityNo : $("#communityNo").val(),
		userNo : $("#userNo").val()
	}
	console.log(' --- departAndClose ---');
	console.log(option);
	// 웹소켓서버에 탈퇴요청 (with 방번호, 유저번호) 
	ws.send(JSON.stringify(option));
	socketClose();
}



// 웹소켓서버에 텍스트 데이터 전송
function send() {
	// 서버로 전송할 데이터 (input 폼 값, 커뮤니티 번호, 유저번호, 타입)
	var option = {
		type : "message",
		communityNo : $("#communityNo").val(),
		sessionId : $("#sessionId").val(),
		userNo : $("#userNo").val(),
		msg : $("#chatting").val()
	}
	// JSON으로 변환해서 전송
	ws.send(JSON.stringify(option))
	// input 폼 초기화
	$('#chatting').val("");
}



// input 폼에서 사용자가 'ENTER'입력시 서버로 메세지 전송
$("#chatting").keydown(function (key) {
	if(key.keyCode == 13){
		send();
	}
});



// connect 타입일때의 컨텐츠 출력
function savedAppendMessage(key, content) {
	console.log('--- appedMessage() 실행 ---');

	var mainValue = '';
	if (content.communityFiles) {
		mainValue = "<a href='/resources/contentfile/"+content.communityFiles.name+"' download>"+content.communityFiles.name.substring(17)+"</a>";
	} else if (content.communityWritings) {
		mainValue = content.communityWritings.talk;
	} else if (content.communityImgs) {
		mainValue = "<a href='/resources/contentfile/"+content.communityImgs.name+"'><img src='../../resources/contentfile/"+content.communityImgs.name+"' class='card-img-top' alt='...' style='width: 500px;'height: 500px;'>"+content.communityImgs.name.substring(17)+"</a>"
	}

	// 해당 세션의 유저번호를 조회 (내 컨텐츠, 타인의 컨텐츠 식별 용도)
	var $myUserNo = $("#userNo").val();
	
	// 저장된 컨텐츠 표시
	if ($myUserNo == content.userNo) {
		// 내 컨텐츠인 경우
		$("#chattingArea").append(
			"<div class='container darker'>"
			+ "<img src='https://i.pinimg.com/236x/e2/b7/da/e2b7da6bc749ba2d7ebdfda28fac6009.jpg' style='width:60px; height:60px;' alt='Avatar' class='right'>"
			+ "<p>"
			+ mainValue
			+ "</p>"
			+ "<span class='time-left'>"
			+ content.registeredDate
			+ "</span>"
			+ "</div>");

	} else {
		// 타인의 컨텐츠인 경우
		$("#chattingArea").append(
			"<div class='container'>"
			+ "<img src='https://ncache.ilbe.com/files/attach/new/20200213/377678/3722063412/11233230392/93ef9bac3f17f6460c4b4f6123f13636_11233230564.jpeg' style='width:60px; height:60px;' alt='Avatar'>"
			+ "<p>"
			+ mainValue
			+ "</p>"
			+ "<span class='time-right'>"
			+ content.registeredDate
			+ "</span>"
			+ "</div>");
	}
}

// 실시간 컨텐츠 표시
function appendMessage(content) {
	console.log('=== message type인 경우 ===')

	var mainValue = '';
	if ('Writings' == content.mainValue) {
		mainValue = content.msg;
	} else if ('Files' == content.mainValue) {
		mainValue = "<a href='/resources/contentfile/"+content.contents.communityFiles.name+"' download>"+content.contents.communityFiles.name.substring(17)+"</a>";
	} else if ('Images' == content.mainValue) {
		mainValue = "<a href='/resources/contentfile/"+content.contents.communityImgs.name+"'><img src='../../resources/contentfile/"+content.contents.communityImgs.name+"' class='card-img-top' alt='...' style='width: 500px;'height: 500px;'>"+content.contents.communityImgs.name.substring(17)+"</a>"
	}
	
	// 해당 세션의 유저번호를 조회 (내 컨텐츠, 타인의 컨텐츠 식별 용도)
	var $myUserNo = $("#userNo").val();

	// 저장된 컨텐츠 표시
	if ($myUserNo == content.userNo) {
		// 내 컨텐츠인 경우
		$("#chattingArea").append(
			"<div class='container darker'>"
			+ "<img src='https://i.pinimg.com/236x/e2/b7/da/e2b7da6bc749ba2d7ebdfda28fac6009.jpg' style='width:60px; height:60px;' alt='Avatar' class='right'>"
			+ "<p>"
			+ mainValue
			+ "</p>"
			+ "<span class='time-left'>"
			+ content.registeredDate
			+ "</span>"
			+ "</div>");

	} else {
		// 타인의 컨텐츠인 경우
		$("#chattingArea").append(
			"<div class='container'>"
			+ "<img src='https://ncache.ilbe.com/files/attach/new/20200213/377678/3722063412/11233230392/93ef9bac3f17f6460c4b4f6123f13636_11233230564.jpeg' style='width:60px; height:60px;' alt='Avatar'>"
			+ "<p>"
			+ mainValue
			+ "</p>"
			+ "<span class='time-right'>"
			+ content.registeredDate
			+ "</span>"
			+ "</div>");
	}
}



// 웹소켓서버에 커뮤니티 수정 데이터 전송
function updateCommunity() {
	// 서버로 전송할 데이터 (수정할 데이터, 커뮤니티 번호, 커뮤니티장 번호, 타입)
	var option = {
		type : "update",
		communityNo : $("#commu-no").val(),
		communityPassword : $("#commu-password").val(),
		communityIntro : $("#commu-intro").val(),
		communityTitle : $("#commu-title").val(),
		bjNo : $("#bj-no").val()
	}
	ws.send(JSON.stringify(option))
}


// 커뮤니티 컨트롤러에 바이너리 데이터 전송
function ajaxFileUpload() {
	// 입력된 바이너리 데이터
	var formData = new FormData($('#fileForm')[0]); 
	
	$.ajax({ 
		type: "POST", 
		enctype: 'multipart/form-data',
		url: '/community/multipartUpload.do', 
		data: formData, 
		dataType: "JSON",
		processData: false, 
		contentType: false, 
		cache: false, 
		success: function (result) {
			// 컨트롤러에서 파일등록 후 결과값을 받는다.
			var communityNo = result.communitiesNo+'';
			var contentNo = result.no+'';
			var userNo = result.userNo+'';
			// 웹소켓서버에 파일등록 데이터를 전송
			// 서버로 전송할 데이터 (커뮤니티 번호, 컨텐츠 번호, 유저번호, 타입)
			var option = {
			type: "fileUpload",
			communityNo : communityNo,
			contentNo : contentNo,
			userNo : userNo
		 	}
			ws.send(JSON.stringify(option));
		}, 
		error: function (e) {
			// 파일등록이 실패할 경우 실행
			console.log('');
		} 
	});
}

//////////////////////// 사이드바 ///////////////////////////////

function myCommuAndNewContents(object) {
	// @@ 사이드바에 해당하는 유저가 참여중인 커뮤니티 리스트와 각각의 리스트에 새로 등록된 컨텐츠 카운트 출력
	
	// connect 타입일때 실행
	if(object.type == "connect"){
		for(var i=0; i<object.myCommuAndNewContentsCnt.length; i++){
			console.log('new',object);
			// 사이드바에 표시
			// 표시될 공간을 지우고 전부 새로쓰기
			// 각 커뮤니티별로 id에 커뮤니티번호 식별 해주자
		}
	// 커뮤니티 컨텐츠에 변경이 발생할때 실행
	} else {
		for(var i=0; i<object.myCommuAndNewContentsCnt.length; i++){
			console.log('new',object);
			// 사이드바에 표시
			// 커뮤니티 번호로 식별해서 해당 커뮤니티만 개수 변경
		}	
	}
}




// ################# 사용하지 않는 코드 (정상적인 동작은 하나, 바이너리 데이터 전송용량 문제로 사용안함. 문제해결시 사용할 것) #################
// 바이너리 데이터를 서버로 전송
function fileSend() {
	 var file = document.querySelector("#fileUpload").files[0];
	 var reader = new FileReader();
	 reader.onload = function() {
		 var option = {
			type: "fileUpload",
			communityNo : $("#communityNo").val(),
			sessionId : $("#sessionId").val(),
			userNo : $("#userNo").val()
		 }
		//ws.binaryType ="arraybuffer";
		console.log(reader.result);
		//var bufView = new Uint8Array(reader.result);
		//var bufView = new Int32Array(reader.result);
		var blobView = new Blob([reader.result], { type: file.type});
		//console.log(bufView);
		//console.log(blobView);
		//var bufView = new Uint16Array(reader.result);
		//console.log(bufView);
		 ws.send(blobView);
		 ws.send(JSON.stringify(option)); //파일 보내기전 메시지를 보내서 파일을 보냄을 명시한다.
		 console.log('----- file send() 종료 -----');
	 }
	 reader.readAsArrayBuffer(file);
	 //reader.readAsDataURL(file);
	 //reader.readAsBinaryString(file);
}
</script>
</body>
</html>