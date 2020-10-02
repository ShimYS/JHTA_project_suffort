<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
    <style>
        html, body {
            height: 100%;
        }

        #content {
            overflow-y:auto;
            height:100%;
        }

        .btn {
            border-radius: 2px;
            color: white; /* Add a text color */
            cursor: pointer; /* Add a pointer cursor on mouse-over */
        }

        .thumbnail {
            padding: 20px;
            font-size: 30px;
            width: 50px;
            text-align: center;
            text-decoration: none;
        }

        .thumbnail:hover {
            opacity: 0.7;
        }
               
        .dropdown-btn {
		    padding: 6px 8px 6px 16px;
		    text-decoration: none;
		    font-size: 20px;
		    color: #f1f1f1;
		    display: block;
		    border: none;
		    background: none;
		    width:100%;
		    text-align: left;
		    cursor: pointer;
		    outline: none;
		}
		
		/* Dropdown container (hidden by default). Optional: add a lighter background color and some left padding to change the design of the dropdown content */
		.dropdown-container {
		  padding-left: 8px;
		}
		
		/* Optional: Style the caret down icon */
		.fa-caret-down {
		  float: right;
		  padding-right: 8px;
		}
		
		.responsive {
		  width: 100%;
		  height: auto;
		}
		
		a {
		    text-decoration: none;
		    color: white;
		}
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
        <!-- navbar -->
		<div class="header">
			<div class="row">
				<div class="col-12 bg-dark">
					<%@ include file="../common/navbar.jsp"%>
				</div>
			</div>
        </div>
                
        
        <div class="row" style="margin-top: 85px;">
            <!-- sidebar -->
            <div class="col-2 m-0 p-0" id="sidebar" >
                <div style="position: fixed;">
                    <div class="row m-0 p-0" id="sidebarW">
                    	<!-- sidebar-header -->
                        <div class="col-12 bg-secondary m-0 p-0"  id="sidebar-header" >
                        	
							<!-- 무엇을 넣어야 할까? -->

                        </div>
                        <!-- sidebar-body -->
                        <div class="col-12 bg-secondary" id="sidebar-body">
                        	<!-- community-thumbnail -->
                        	<div class="mt-3 d-flex justify-content-center">
                                <img id="sidebar-communityImg" class="responsive" src="" style="max-width: 300px; width : 100%;">
                            </div>
                            <!-- user list -->
                            <button class="dropdown-btn mt-3 font-weight-bold">User
                                <i class="fa fa-caret-down"></i>
                            </button>
                            <div id="sidebar-users" class="dropdown-container flex-column">
                            	
                            	<!-- 사이드바 유저 리스트 출력 위치 -->
                            	
                            </div>
							<!-- my community list -->
                            <button class="dropdown-btn mt-3 font-weight-bold">Community
                                <i class="fa fa-caret-down"></i>
                            </button>
                            <div id="sidebar-communities" class="dropdown-container flex-column">
                            	
								<!-- 사이드바 커뮤니티 리스트 출력 위치 -->

                            </div>
							<!-- content list -->
                            <button class="dropdown-btn mt-3 font-weight-bold">Content
                                <i class="fa fa-caret-down"></i>
                            </button>
                            <div id="sidebar-contents" class="dropdown-container flex-column">
                            	
                            	<!-- @@@@@@@@@@@@@@ 검색기능 추가해야함 @@@@@@@@@@@@@@ -->
                            	
                                <div>
                                    <a href="#" class="ml-3" onclick="selectContent('image')" data-toggle="modal" data-target="#ContentsModal">#Image</a>
                                </div>
                                <div>
                                    <a href="#" class="ml-3" onclick="selectContent('file')" data-toggle="modal" data-target="#ContentsModal" >#File</a>
                                </div>
                                <div>
                                    <a href="#" class="ml-3" onclick="selectContent('text')" data-toggle="modal" data-target="#ContentsModal" >#Text</a>
                                </div>
                                 
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- chat -->
            <div class="col-10 d-flex justify-content-center flex-column m-0 p-0" >
                <!-- header -->
                <div class="bg-secondary sticky-top" id="header">
                    <div class="row justify-content-between">
                        <div class="col-4 m-1">
                            <div class="mb-1">
                                <h5 class="font-weight-bold" id="communityTitle" ></h5>
                                <input type="hidden" id="sessionId" value="">
								<!-- 최초 웹소켓 연결시 서버로부터 반환받아서 이곳에 넣어두기 -->
								<input type="hidden" id="communityNo" value="${communityNo }">
								<input type="hidden" id="userNo" value="${userNo }">
                            </div>
                            <div>
                                <h6 class="font-weight-light" id="communityIntro" style="display: inline-block;"></h6>
                                <h6 class="font-weight-lighter small" id="communityTags" style="display: inline-block;"></h6>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="row align-content-center" style="height: 100%;">
                                <div class="col-9 text-right">
                                    <img src="https://www.clipartmax.com/png/middle/252-2526984_%ED%94%84%EB%A0%8C%EC%A6%88%ED%8C%9D-%EB%9D%BC%EC%9D%B4%EC%96%B8-png-%ED%94%BC%ED%81%AC%EB%8B%89%EB%9D%BC%EC%9D%B4%EC%96%B8-%ED%9B%84%EB%93%9C%EB%9D%BC%EC%9D%B4%EC%96%B8-kakao-friends-ryan-png.png" 
                                    	style="width: 50px;">
                                    <span id="userName">
                                        
                                    </span>
                                    <span class="ml-2 font-italic" id="community-guest-cnt"></span>
                                </div>
                                <div class="col-3 text-center">
                                    <div class="dropdown">
                                        <div data-toggle="dropdown">
                                            <i class="fas fa-bars m-2 btn"></i>
                                        </div>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a class="dropdown-item" id="edit-commuinfo" href="#" data-toggle="modal" data-target="#EditModal" style="display: none">Edit Info</a>
                                            <a class="dropdown-item" id="edit-commuimg" href="#" data-toggle="modal" data-target="#EditImgModal" style="display: none">Edit Img</a>
                                            <a class="dropdown-item" id="edit-commutag" href="#" data-toggle="modal" data-target="#EditTagModal" style="display: none" onclick="getAllTags()">Edit Tag</a>
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

                <!-- body -->
                <div class="p-2 bg-right align-content-stretch" style="height: 698px; position: relative;" id="content">
                    <div id="chattingArea">
                    	
                    	<!-- 컨텐츠 출력 위치 -->
                    	             
                    </div>
                </div>

                <!-- footer -->
                <div style="bottom: 0;" class="pl-3 pr-5" id="footer">
                    <div class="row">
                        <div class="col-12">
                            <div class="input-group">
                                <input id="chatting" type="text" class="form-control input chat_input" placeholder="Write your message here..." />
                                <span class="input-group-btn">
                                    <button class="btn btn-primary" id="sendBtn" onclick="send()">Send</button>
                                </span>
                            </div>
                            <div class="input-group">
								<form id="fileForm" method="post" action="#" enctype="multipart/form-data" class="btn-block">			                                
	                                <div class="form-group m-0">
	                               		<input type="file" name="file" >
										<input type="hidden" name="communo"  value="${communityNo }">
										<input type="hidden" name="userno"  value="${userNo }">
										<input type="button" value="Upload" onclick="ajaxFileUpload()">
									</div>
	                            </form>                                                                               
                            </div>
                        </div>                    						                               									
                       
                    </div>
                </div>
                <!-- Edit모달 -->
				<div class="modal fade" id="EditModal">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h1>Edit Community Form</h1>
							</div>
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
				<!-- Edit img 모달 -->
				<div class="modal fade" id="EditImgModal">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h3>Edit Community Image Form</h3>
							</div>
							<div class="modal-body">
								<form id="form-communityImg" method="post" action="#" enctype="multipart/form-data" class="btn-block">
									<div class="form-group">
										<div class="input-group mb-3 input-group-sm">
											<input type="file" id="commu-image" class="form-control-file border" name="image" placeholder="Choose Image only">
										</div>
									</div>
									
									<div class="form-group" style="display: none;">
										<div class="input-group mb-3 input-group-sm">
											<input type="hidden" id="commu-no" value="${communityNo }" name="communo">
										</div>
									</div>
									<button type="button" class="btn btn-primary btn-block" data-dismiss="modal" onclick="updateCommunityImg()">Edit</button>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- Edit tag 모달 -->
				<div class="modal fade" id="EditTagModal">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="hashtag-list">HashTag</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body" id="tagArea" >
								
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary" id="save">Save</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 컨텐츠 모달 -->
				<div class="modal fade" id="ContentsModal" style="max-height: 700px;">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h3>Content List</h3>
							</div>
							<div class="modal-body" id="contentModalBody">
								
								<!-- 컨텐츠 모음 -->
								
							</div>
						</div>
					</div>
				</div>
            </div>
        </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
/* websocket object */
var ws;

/* init() */
$(function() {
	checkUserSession();
});

/* 브라우저 세션 검사 */
function checkUserSession() {
	commonAjax('/community/checkUserSession.do', '', 'get', function(result) {
		console.log('userSession', result);
		// 로그인된 경우
		if('true' == result){
			contentHeight();
		    connect();
		// 로그인이 되어있지 않은 경우
		} else {
			location.href = "/community/main.do";
		}
	})
}

$(window).resize(function() {
    contentHeight();
});

/* 높이, 넓이 설정 */
function contentHeight () {
    // content 높이 
    var headerH = $('#header').outerHeight();
    var footerH = $('#footer').outerHeight();
    var contentH = window.innerHeight-headerH-footerH-120;
    $('#content').css('height', contentH);

    // sidebar 높이
    $('#sidebar-header').css('height', headerH);
    $('#sidebar-body').css('height', window.innerHeight-headerH);

    // sidebar 넓이
    var sidebarW = $('#sidebar').width();
    $('#sidebarW').css('width', sidebarW);
}    

/* 파일업로드 폼 js */
function bs_input_file() {
    $(".input-file").before(
        function() {
            if ( ! $(this).prev().hasClass('input-ghost') ) {
                var element = $("<input type='file' class='input-ghost' style='visibility:hidden; height:0'>");
                element.attr("name",$(this).attr("name"));
                element.change(function(){
                    element.next(element).find('input').val((element.val()).split('\\').pop());
                });
                $(this).find("button.btn-choose").click(function(){
                    element.click();
                });
                $(this).find("button.btn-reset").click(function(){
                    element.val(null);
                    $(this).parents(".input-file").find('input').val('');
                });
                $(this).find('input').css("cursor","pointer");
                $(this).find('input').mousedown(function() {
                    $(this).parents('.input-file').prev().click();
                    return false;
                });
                return element;
            }
        }
    );
}

$(function() {
    bs_input_file();
});


/* websocket connect */

function connect() {
	// 웹소켓 연결 (with 방번호, 유저번호)
	ws = new WebSocket("ws://192.168.10.221:80/community/inside/"
			+ $("#communityNo").val() + "&" + $("#userNo").val());
	
	// 웹소켓 에러시 실행
	ws.onerror = function(error) {
		// 에러메시지 출력
		console.log(error);
	}
	// 웹소켓 연결 중 실행
	ws.onopen = function() {
		console.log('##### 웹소켓 연결 #####');

		// 서버로부터 값을 받았을 때 실행
		ws.onmessage = function(data) {
			// 서버로부터 받은 data에서 메시지 꺼내기
			var message = data.data;
			console.log('* 서버로부터 받은 메세지 *', message);
			
			// 서버로부터 받은 메세지 null검사
			if (message != null && message.trim() != '') {
				console.log('* 메세지 null 체크통과 *')
				// 메세지를 JSONObject로 변환
				var object = JSON.parse(message);
				
				// 받아온 웹소켓세션아이디 히든에 숨기기
				$("#sessionId").val(object.sessionId);
				
				// 메세지타입이 'connect' => (handshake 성공 후)
				if (object.type == "connect") {
					console.log('##### 메세지 -> connect type #####');
					var myUserNo = $('#userNo').val();
					var myName = '';
					
					// 커뮤니티 타이틀 
					$("#communityTitle").text(object.community.title);
					$("#communityTitle2").text('Leave #' + object.community.title);
					$("#communityTitle3").text('Depart #' + object.community.title);
					$("#commu-title").val(object.community.title);
					// 커뮤니티 인트로
					$("#communityIntro").text(object.community.intro);
					$("#commu-intro").val(object.community.intro);
					// 커뮤니티 이미지
					$("#sidebar-communityImg").attr("src", '../../resources/contentfile/'+object.community.img);
					
					// 커뮤니티 생성자
					$("#bj-no").val(object.community.userNo);						
					
					
					// 사이드바 유저리스트 - 커뮤니티 유저명단 출력					
					$("#sidebar-users").text('');
					var userList = '';
					for(var i = 0; i < object.communityGuests.length; i++) {
						var name = object.communityGuests[i].userName;
						var userNo = object.communityGuests[i].userNo;
						var mark = '';
						var who = '';
						var color = '';
						var userNoCheck = false;
						
						for (var j = 0; j < object.currentUser.length; j++) {
							if(userNo == object.currentUser[j].userNo) {
								userNoCheck = true;
							}
						}
						
						if(userNoCheck) {
							color = 'crimson';
						} else {
							color = 'dimgray';
						}
						
						if(userNo == myUserNo) {
							myName = name;
						}
						
						if (object.communityGuests[i].CommunitiesGrade == '방장') {
							// 커뮤니티장(방장)
							var mark = ' (bj)';
						}
						
						if ($("#userNo").val == userNo) {
							var who = ' (you)';
						}
						
						userList += "<div>"
							+"<i class='fas fa-heart ml-3' style='font-size:15px;color: "+ color +";'></i>"
	                        +"<a href='#' >" + name + mark + who +"</a>"
	                    	+"</div>";
					}

					$("#sidebar-users").append(userList);
					
					$("#userName").text('').text(myName);												

					// 커뮤니티 접속 인원수 표시
					var currentGuestCnt = object.currentUser.length;
					var communityGuestCnt = object.communityGuests.length;
					$("#community-guest-cnt").text('').append(currentGuestCnt +"/"+ communityGuestCnt);
					
					// 기존 컨텐츠 출력
					// @@ 컨텐츠의 유저번호와 히든의 유저번호가 일치하면 우측정렬, 불일치하면 좌측정렬 
					$("#chattingArea").text('');
					$.each(object.contents, function(key, content) {
						savedAppendMessage(key, content);
					})
					
					console.log('size',object.tags.length);
					
					// 태그 컨텐츠 출력
					if(object.tags != 0) {
						var comtags = '[ ';
						for(var i=0; i<object.tags.length; i++) {
							comtags += object.tags[i].tagName
							if(i != object.tags.length-1){
								comtags	+= ", "
							};
						}
						comtags += " ]";
						$('#communityTags').text('').append(comtags);
					}
					
					// 커뮤니티 수정 버튼 활성/비활성 표시 ('커뮤니티장'은 수정 버튼 활성화, 일반회원은 비활성화)
					var bjNo = $("#bj-no").val();
					var userNo = $("#userNo").val();
					if(bjNo == userNo){
						$("#edit-commuinfo").show();
						$("#edit-commuimg").show();
						$("#edit-commutag").show();
					}					

				// 메세지타입이 'message' (서버로부터 컨텐츠 수신)
				} else if (object.type == "message") {
					console.log('##### 메세지 -> message type #####');
					// 컨텐츠 출력 함수 실행
					appendMessage(object);
					
					
//@@@@@@@@@@@@@@@/////////////////////////////////////
					// 메세지타입이 'update' (커뮤니티정보 수정 후)
				} else if (object.type == "update") {
					console.log('##### 메세지 -> update type #####');
					if('error' == object.status) {
						// @@ 경고창 띄워주기.
						alert('업데이트 권한이 없습니다!');
					} else {
						// 수정된 커뮤니티 타이틀 설정
						console.log('update-object',object.community.no);
						var idCode = '#name-'+object.community.no;
						$(idCode).text(object.community.title);
						
						$("#communityTitle").text(object.community.title);
						$("#communityTitle2").text('Leave #' + object.community.title);
						$("#communityTitle3").text('Depart #' + object.community.title);
						$("#commu-title").val(object.community.title);
						// 수정된 커뮤니티 인트로 설정
						$("#communityIntro").text(object.community.intro);
						$("#commu-intro").val(object.community.intro);
						
						// 수정된 커뮤니티 생성자 설정
						$("#bj-no").val(object.community.userNo); 
					}

										
					// 메세지타입이 'remove' (특정 웹소켓세션 제거 후)
				} else if (object.type == "remove") {
					console.log('##### 메세지 -> remove type #####');
					
					$("#sidebar-users").text('');
					var userList = '';
					for(var i = 0; i < object.communityGuests.length; i++) {
						var name = object.communityGuests[i].userName;
						var userNo = object.communityGuests[i].userNo;
						var mark = '';
						var who = '';
						var color = '';
						var userNoCheck = false;
						
						for (var j = 0; j < object.currentUser.length; j++) {
							if(userNo == object.currentUser[j].userNo) {
								userNoCheck = true;
							}
						}
						
						if(userNoCheck) {
							color = 'crimson';
						} else {
							color = 'dimgray';
						}
						
						if(userNo == myUserNo) {
							myName = name;
						}
						
						
						if (object.communityGuests[i].CommunitiesGrade == '방장') {
							// 커뮤니티장(방장)
							var mark = ' (bj)';
						}
						
						if ($("#userNo").val == userNo) {
							var who = ' (you)';
						}
						
						userList += "<div>"
							+"<i class='fas fa-heart ml-3' style='font-size:15px;color: "+ color +";'></i>"
	                        +"<a href='#' >" + name + mark + who +"</a>"
	                    	+"</div>";
					}

					$("#sidebar-users").append(userList);
					
					$("#userName").text('').text(myName);
					
					// 커뮤니티 접속자 출력
					/*
					$("#sidebar-users").text('');
					for (var i = 0; i < object.currentUser.length; i++) {
						var name = object.currentUser[i].userName;
						var userNo = object.currentUser[i].userNo;
						var mark = '';
						var who = '';
						
						if (object.currentUser[i].CommunitiesGrade == '방장') {
							// 커뮤니티장(방장)
							var mark = ' (bj)';
						}
						
						if ($("#userNo").val == userNo) {
							var who = ' (you)';
						}
						
						///////////////////////////// 지금은 접속된 유저정보만 가져오지만 => 커뮤니티의 모든 유저 가져와서 활성, 비활성 체크해서 색으로 구분해주기 ///////////////////////
						///////////////////////////// @@ 게스트 출력 코딩, 유저누르면 유저 디테일 정보 보여주기 ////////////////////////// 
						$("#sidebar-users").append(
										"<div>"
										+"<i class='fas fa-heart ml-3' style='font-size:15px;color: crimson;'></i>"
				                        +"<a href='#' >" + name + mark + who + "</a>"
				                    	+"</div>"
						);
					}
					*/
					
					// 커뮤니티 접속 인원수 표시
					var currentGuestCnt = object.currentUser.length;
					var communityGuestCnt = object.communityGuests.length;
					$("#community-guest-cnt").text('').append(currentGuestCnt +"/"+ communityGuestCnt);
					
				} else if (object.type == "close") {
					console.log('##### 메세지 -> close type #####');
					socketClose();
					
				} else if (object.type == "fileUpload") {
					console.log('##### 메세지 -> fileUpload type #####');
					appendMessage(object);
					
				} else if (object.type == "imageUpdate") {
					console.log('##### 메세지 - > imageUpdate type #####');
					updatecommunityImage(object);
				} else if (object.type == "tagUpdate") {
					console.log('##### 메세지 - > tagUpdate type #####');
					updatecommunityTags(object);
				} else if (object.type == "tome") {
					console.log('##### 메세지 - > tome type #####');
					myCommuAndNewContents(object);
				} else if (object.type == "toyou") {
					console.log('##### 메세지 - > toyou type #####');
					myCommuAndNewContents(object);
				} else if (object.type == "who") {
					console.log('##### 메세지 - > who type #####');
					whoAreYou(object);
				}
			}
		};
	}
	
	// 의도적인 웹소켓 해제가 아닌경우 실행 (예: 새로고침)
	ws.onclose = function() {
		// 웹소켓 연결을 재요청
		console.log('??');
		connect();
	};
}

/* 의도적인 웹소켓 해제 */

function socketClose() {
	location.href = "/community/main.do";
}

/* 커뮤니티 탈퇴 (퇴실이 아닌 해당 커뮤니티에서의 본인 접속기록 제거) */

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

/* 웹소켓서버에 텍스트 데이터 전송 */

function send() {
	var msg = $("#chatting").val();
	if(!msg){
		$("#chatting").focus();
		return;
	}
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

/* input 폼에서 사용자가 'ENTER'입력시 서버로 메세지 전송 */

$("#chatting").keydown(function (key) {
	if(key.keyCode == 13){
		send();
	}
});

/* 접속한 유저 정보 알림 */
function whoAreYou(content) {
	console.log('who', content);
	mainValue = "<div class='media border p-1 mb-1 bg-danger' >"
				+"<img src='../../resources/contentfile/default08.jpg' class='mr-2 rounded-circle' style='width:50px;'>"
				+"<div class='media-body'>"
				+"<p>"+content.who.userName+"</p>"
				+"</div></div>";
	$("#chattingArea").append(mainValue);
}


/* connect 타입일때의 컨텐츠 출력 */
function savedAppendMessage(key, content) {	
	// 해당 세션의 유저번호를 조회 (내 컨텐츠, 타인의 컨텐츠 식별 용도)
	var $myUserNo = $("#userNo").val();
	var bg = $myUserNo == content.userNo ? 'powderblue' : ''; 
	
	var mainValue = '';
	if (content.communityFiles) {
		mainValue =	"<div class='media border p-1 mb-1' style='background-color: "+bg+"'>"
				    +"<img src='../../resources/contentfile/default08.jpg' class='mr-2 rounded-circle' style='width:50px;'>"
				    +"<div class='media-body'>"
				    +"<h6>"+ content.userName +" <small><i>Posted on"+ content.registeredDate +"</i></small></h6>"
				    +"<a href='/resources/contentfile/"+content.communityFiles.name+"' style='color:coral;' download>"+content.communityFiles.name.substring(17)+"</a>"
				    +"</div></div>";		
		
	} else if (content.communityWritings) {
		mainValue = "<div class='media border p-1 mb-1' style='background-color: "+bg+"'>"
					+"<img src='../../resources/contentfile/default08.jpg' class='mr-2 rounded-circle' style='width:50px;'>"
					+"<div class='media-body'>"
					+"<h6>"+ content.userName +" <small><i>Posted on"+ content.registeredDate +"</i></small></h6>"
					+"<p>"+content.communityWritings.talk+"</p>"
					+"</div></div>";
		
	} else if (content.communityImgs) {
		mainValue = "<div class='media border p-1 mb-1' style='background-color: "+bg+"'>"
					+"<img src='../../resources/contentfile/default08.jpg' class='mr-2 rounded-circle' style='width:50px;'>"
					+"<div class='media-body'>"
					+"<h6>"+ content.userName +" <small><i>Posted on"+ content.registeredDate +"</i></small></h6>"
					+"<img src='../../resources/contentfile/"+content.communityImgs.name+"' download style='max-width: 500px;'>"
					+"</div></div>";
	} else if (content.communityVideos) {
		// 구현해야함(테이블생성, 서비스, dao, vo 전부 아니면 text를 잘 활용하던지)
	}

	$("#chattingArea").append(mainValue).children('div:last').attr("tabindex", -1).focus();
}


/* 실시간 컨텐츠 표시 */
function appendMessage(content) {
	console.log('##### 신규 컨텐츠 출력 #####');
	console.log(' 신규 컨텐츠 출력 ', content);
	
	// 해당 세션의 유저번호를 조회 (내 컨텐츠, 타인의 컨텐츠 식별 용도)
	var $myUserNo = $("#userNo").val();
	var bg = $myUserNo == content.userNo ? 'powderblue' : ''; 

	var mainValue = '';	
	if ('Files' == content.mainValue) {
		mainValue =	"<div class='media border p-1 mb-1' style='background-color: "+bg+"'>"
				    +"<img src='../../resources/contentfile/default08.jpg' class='mr-2 rounded-circle' style='width:50px;'>"
				    +"<div class='media-body'>"
				    +"<h6>"+ content.contents.name +" <small><i>Posted on"+ content.contents.registeredDate +"</i></small></h6>"
				    +"<a href='/resources/contentfile/"+content.contents.communityFiles.name+"' download>"+content.contents.communityFiles.name.substring(17)+"</a>"
				    +"</div></div>";		
		
	} else if ('Writings' == content.mainValue) {
		mainValue = "<div class='media border p-1 mb-1' style='background-color: "+bg+"'>"
					+"<img src='../../resources/contentfile/default08.jpg' class='mr-2 rounded-circle' style='width:50px;'>"
					+"<div class='media-body'>"
					+"<h6>"+ content.users.name +" <small><i>Posted on"+ content.contents.registeredDate +"</i></small></h6>"
					+"<p>"+content.contents.communityWritings.talk+"</p>"
					+"</div></div>";
		
	} else if ('Images' == content.mainValue) {
		mainValue = "<div class='media border p-1 mb-1' style='background-color: "+bg+"'>"
					+"<img src='../../resources/contentfile/default08.jpg' class='mr-2 rounded-circle' style='width:50px;'>"
					+"<div class='media-body'>"
					+"<h6>"+ content.contents.name +" <small><i>Posted on"+ content.contents.registeredDate +"</i></small></h6>"
					+"<img src='../../resources/contentfile/"+content.contents.communityImgs.name+"' style='max-width: 500px;'>"
					+"</div></div>";
	} else if ('Videos' == content.mainValue) {
		// 구현해야함(테이블생성, 서비스, dao, vo 전부 아니면 text를 잘 활용하던지)
	}
	
	$("#chattingArea").append(mainValue).children('div:last').attr("tabindex", -1).focus();

}


/* 웹소켓서버에 커뮤니티 수정 데이터 전송 */
function updateCommunity() {
	// 서버로 전송할 데이터 (수정할 데이터, 커뮤니티 번호, 커뮤니티장 번호, 타입)
	var option = {
		type : "update",
		communityNo : $("#commu-no").val(),
		communityPassword : $("#commu-password").val(),
		communityIntro : $("#commu-intro").val(),
		communityTitle : $("#commu-title").val(),
		bjNo : $("#bj-no").val()
	};
	ws.send(JSON.stringify(option));
}

function updateCommunityImg() {
	var formData = new FormData($('#form-communityImg')[0]);
	
	$.ajax({
		type: "POST", 
		enctype: 'multipart/form-data',
		url: '/community/communityImageUpdate.do', 
		data: formData, 
		dataType: "JSON",
		processData: false, 
		contentType: false, 
		cache: false, 
		success: function (result) {
			console.log('commu image',result);
			
			var communityNo = result.commuNo+'';
			var imageName = result.commuImg+'';
			// 웹소켓으로 커뮤니티 번호와 파일이름을 전송해서 해당 커뮤니티 참가자에게 전송
			var option = {
				type: "imageUpdate",
				communityNo : communityNo,
				imageName : imageName
		 	}
			ws.send(JSON.stringify(option));
		},
		error: function (e) {
			alert('커뮤니티 이미지 업데이트 실패!');
		}
	});
}

/* 커뮤니티 컨트롤러에 바이너리 데이터 전송 */

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
			console.log('파일 전송에 실패!!');
		} 
	});
}

/* 커뮤니티 이미지 수정 */
function updatecommunityImage(object) {
	$("#sidebar-communityImg").attr("src", '../../resources/contentfile/'+object.imageName);
}


/* 사이드바 */
function myCommuAndNewContents(object) {
	// @@ 사이드바에 해당하는 유저가 참여중인 커뮤니티 리스트와 각각의 리스트에 새로 등록된 컨텐츠 카운트 출력
	var userNo = $('#userNo').val();
    
	// connect 타입일때 실행
	if(object.type == "tome"){
		console.log('tome',object);
		$("#sidebar-communities").text('');
		for(var i=0; i<object.myCommuAndNewContentsCnt.length; i++){
			var communityTitle = object.myCommuAndNewContentsCnt[i].communityTitle;
			var contentCnt = object.myCommuAndNewContentsCnt[i].contentCnt;
			var communityNo = object.myCommuAndNewContentsCnt[i].communityNo;
			
			$("#sidebar-communities").append(
					"<div>"
		        	+ "<a href='/community/inside.do?communityNo="+communityNo+"&userNo="+userNo+"' class='ml-3' id='name-"+communityNo+"'>#" + communityTitle + "</a>"
		        	+ "<span class='badge badge-danger' id='cnt-"+ communityNo +"'>" + contentCnt + "</span>"
		    		+ "</div>"
			);		
		}
		
	// 커뮤니티 컨텐츠에 변경이 발생할때하면 카운트 값 수정
	} else {
		var idCode = '#cnt-'+object.myCommuAndNewContentsCnt.communityNo;
		$(idCode).text(object.myCommuAndNewContentsCnt.contentCnt);
		// 사이드바에 표시
		// 커뮤니티 번호로 식별해서 해당 커뮤니티만 개수 변경
	}
}

/* 커뮤니티 타입별 컨텐츠 조회 */
function selectContent(type) {	
	var type = type;
	var paramData = {
			communityNo : $('#communityNo').val(),
			type : type
	}
	commonAjax('/community/selectContent.do', paramData, 'get', function(result){
		var contentModalBody = $('#contentModalBody');
		var contents = '';
		console.log(result);
		if(result.length != 0) {
			$.each(result, function (key, value) {
				var date = new Date(value.contentRegisteredDate);
				if(type == 'image') {
					contents += "<div class='card mt-1' style='width:100%; height:auto;' >"
							+ "<img src='../../resources/contentfile/"+ value.contentName +"' >"
							+ "<div class='card-body'>"
							+ "<h6 class='card-title'>"+ value.userName +"</h6>"
							+ "<p class='card-text'>"+ date +"</p>"
							+ "</div>"
							+ "</div>"
				} else if( type == 'file') {
					contents += "<div class='card mt-1'>"
							+ "<div class='card-body'>"
							+ "<a class='text-info' href='/resources/contentfile/"+ value.contentName +"' download>"+ value.contentName.substring(17) + "</a>"
						 	+ "<h6 class='card-title mt-3'>"+ value.userName +"</h6>"
						  	+ "<p class='card-text'>"+ date +"</p>"
						  	+ "</div>"
							+ "</div>"
				} else if (type == 'text') {
					contents += "<div class='card mt-1'>"
						 	+ "<div class='card-body'>"
							+ "<p>"+ value.contentName +"</p>"
						    + "<h6 class='card-title'>"+ value.userName +"</h6>"
						    + "<p class='card-text'>"+ date +"</p>"
						 	+ "</div>"
							+ "</div>"
				}
				
			})			
		} else{
			contents += "<div class='card mt-1'>"
				+ "<div class='card-body'>"
			 	+ "<h6 class='card-title mt-3'>해당 타입의 컨텐츠가 존재하지 않습니다.</h6>"
			  	+ "</div>"
				+ "</div>"
		}
		contentModalBody.text('').append(contents);
	})
}


/* 사이드바 바디 드롭다운 */
var dropdown = document.getElementsByClassName("dropdown-btn");
var i;

for (i = 0; i < dropdown.length; i++) {
  dropdown[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var dropdownContent = this.nextElementSibling;
    if (dropdownContent.style.display === "block") {
      dropdownContent.style.display = "none";
    } else {
      dropdownContent.style.display = "block";
    }
  });
};

/* tag */
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

$('#save').click(function () {
	// 태그 폼 초기화	
	var $tagbox = $("#tag-box").empty();
	// 태그를 담을 변수 초기화
	var tagNoList = [];
	var tagNameList = [];
	// 입력된 태그 조회
	$("input[type='checkbox']:checked").each(function () {
		var tagNo = $(this).data("tag-no");
		var tagName = $(this).data("tag-name");
		tagNoList.push(tagNo);
		tagNameList.push(tagName);
	});
	
	var option = {
		type : "tagUpdate",
		communityNo : $("#communityNo").val(),
		tagName : tagNameList,
		tagNoList : tagNoList
	}
	
	// 태그 리스트 숨기기
	$("#EditTagModal").modal("hide");
	
	// JSON으로 변환해서 전송
	ws.send(JSON.stringify(option));
})

/* 업데이트된 태그 정보를 커뮤니티 화면에 출력 */
function updatecommunityTags(object) {	
	
	// 태그 컨텐츠 출력
	if(object.tags != 0) {
		var comtags = '[ ';
		for(var i=0; i<object.tagName.length; i++) {
			comtags += object.tagName[i]
			if(i != object.tagName.length-1){
				comtags	+= ", "
			};
		}
		comtags += " ]";
		$('#communityTags').text('').append(comtags);
	}
}

/* ajax 기본폼 */
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







































