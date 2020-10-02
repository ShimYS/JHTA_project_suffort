<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
<meta charset="UTF-8">
	
</head>
<body>
<div class="container">
		<h1>채팅방</h1>
		<div>
			<!-- 방생성 백업
			<table class="inputTable">
				<tr>
					<th>방 제목</th>
					<th><input type="text" name="roomTitle" id="roomTitle"></th>
					<th><button id="createRoom">방 만들기</button></th>
				</tr>
			</table>
			 -->
			<form id="form-login" method="POST" action="/createRoom.do">
				<div class="form-group">
					<label for="input-id">방 제목</label>
					<input type="text" class="form-control" placeholder="방제목을 입력하세요" name="roomTitle" id="roomTitle" >
				</div>
				<div style="margin-top:30px">
					<button type="submit" class="btn btn-primary float-right">방 생성</button>
				</div>
			</form>
		</div>
		<div id="roomContainer" class="roomContainer">
			<table id="roomList" class="roomList"></table>
		</div>
	</div>
</body>
<script type="text/javascript" src="/resources/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
	// 페이지 랜딩시 방 리스트 불러오기
	createAndRetrieveRoom();
	
	// 방 생성 및 방 리스트 반환받아 화면에 출력하기
	$("#createRoom").click(function () {
		createAndRetrieveRoom();
	})
	
	/* 방생성 백업
	// 방생성 및 방리스트 조회용 함수
	function createAndRetrieveRoom() {
		// 인풋 박스에서 방 제목을 읽어온다. 
		var data = {roomTitle : $('#roomTitle').val()};
		// ajax로 방 생성
		commonAjax('/createRoom.do', data, 'post', function(result){
			var tag;
			// '방 리스트 = result'를 반환받음
			// 반환받은 방 리스트를 화면에 출력
			[].forEach.call(result, function(obj,index){
				var roomTitle = obj.title;
				var roomNumber = obj.no;
				tag += "<tr>"+
							"<td class='num'>"+ (index+1) +"</td> "+
							"<td class='room'>"+ roomTitle +"</td> "+
							"<td class='go'><button type='button' onclick='goRoom(\""+roomNumber+"\", \""+roomTitle+"\")'>참여</button></td>" +
						"</tr>";	
			});
			// 출력할 페이지의 값을 모두제거 한 후 출력한다.
			$("#roomList").empty().append(tag);
		});
		// 인풋 박스 초기화
		$("#roomTitle").val("");
	}
	*/
	
	<!-- 방 중복 검사 -->
	
	<!-- 방 생성 버튼 누를때 이름 null 인지 검사 -->
	
	
	// 방 참여 버튼 클릭시 방번호, 방제목을 가지고 페이지 이동을 해준다.
	function goRoom(number, title){
		location.href="/joinRoom.do?roomTitle="+title+"&"+"roomNumber="+number;
	}
	
	// ajax함수
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
</html>
<!-- 
<!--
				<div class="col-3 pl-5">
					${roomNumber}
					${userNo}
				</div>
				<div id="content-div-tagbar" class="col-6">
					<form action="writeDo.php" method="POST" id="tag-form" style="width: 100%; padding-top: 15px;">
						<input type="hidden" value="" name="tag" id="rdTag" />
						<div class="input-group" id="search-bar" style="width: 60%">
							<input id="tag" type="text" placeholder="write tag name" class="form-control"/>
	                    		<div class="input-group-append">
	                    			<button class="input-group-text btn btn-sm btn-primary">#</button>
	                    		</div>
						</div>
						<div>
	                    <ul id="tag-list"></ul>
						</div>
					</form>
				</div>
				<div class="row pl-3">
					<div class="col-4">
						<div class="card" style="width: 21rem; height: 380px;">
							<div class="card-body">
								<a class="d-flex justify-content-center mt-5 pt-1" href="#"
								 data-toggle="modal" data-target="#add-community-modal">
								<img src="../../resources/img/plus.png" class="card-img" alt="..." style="width: 200px;'height: 200px;"></a>
							</div>
						</div>
					</div>
					
					

					<div class="modal fade" id="add-community-modal">
						<div class="modal-dialog">
							<div class="modal-content">
								
						        <div class="modal-header">
						          <h4 class="modal-title">Create Community</h4>
						          <button type="button" class="close" data-dismiss="modal">&times;</button>
						        </div>
						       
						        <form id="form-community" method="POST" action="createCommunity.do">
							        <div class="modal-body">
							        <p>create community free style!</p>
							        	<div class="form-group">
							        		<label>Title</label>
							        		<input type="text" id="commu-title" name="title"/>
							        	</div>
							        	<div class="form-group">
							        		<label>Content</label>
							        		<textarea id="commu-content" name="content">
							        		</textarea>
							        	</div>
							        	<div class="form-group">
							        		<label>Password</label>
							        		<input type="text" id="commu-password" name="password"/>
							        	</div>
							        	<div class="form-group">
							        		<div class="float-left">
							        		<label>Tag</label>
							        		<input id="commu-tag" type="text"/>
							        		</div>
							        		<div class="float-left" style="width: 100px; background-color: red;">ddd</div>
							        		
							        	</div>
									</div>
							        
							        <div class="modal-footer">
							          <button type="submit" class="btn btn-danger">Create</button>
							        </div>
						        </form>
							</div>
						</div>
					</div>
					
				</div>
				-->
				<!-- 
					$(document).ready(function () {

    var tag = {};
    var counter = 0;

    // 태그를 추가한다.
    function addTag (value) {
        tag[counter] = value; // 태그를 Object 안에 추가
        counter++; // counter 증가 삭제를 위한 del-btn 의 고유 id 가 된다.
    }

    // 최종적으로 서버에 넘길때 tag 안에 있는 값을 array type 으로 만들어서 넘긴다.
    function marginTag () {
        return Object.values(tag).filter(function (word) {
            return word !== "";
        });
    }

    // 서버에 넘기기
    $("#tag-form").on("submit", function (e) {
        var value = marginTag(); // return array
        $("#rdTag").val(value); 
        
        $(this).submit();
    });

    $("#tag").on("keypress", function (e) {
        var self = $(this);

        // input 에 focus 되있을 때 엔터 및 스페이스바 입력시 구동
        if (e.key === "Enter" || e.keyCode == 32) {

            var tagValue = self.val(); // 값 가져오기

            // 값이 없으면 동작 ㄴㄴ
            if (tagValue !== "") {

                // 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
                var result = Object.values(tag).filter(function (word) {
                    return word === tagValue;
                })
            
                // 태그 중복 검사
                if (result.length == 0) { 
                    $("#tag-list").append("<li class='tag-item'>"+tagValue+"<span class='del-btn' idx='"+counter+"'>x</span></li>");
                    addTag(tagValue);
                    self.val("");
                } else {
                    alert("태그값이 중복됩니다.");
                }
            }
            e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
        }
    });
    // 삭제 버튼 
    // 삭제 버튼은 비동기적 생성이므로 document 최초 생성시가 아닌 검색을 통해 이벤트를 구현시킨다.
    $(document).on("click", ".del-btn", function (e) {
        var index = $(this).attr("idx");
        tag[index] = "";
        $(this).parent().remove();
    });
})

$(function() {
	
	$("#add-community").click(function() {
		$("#add-community-modal").modal("show");
	});
})
				 -->
 -->