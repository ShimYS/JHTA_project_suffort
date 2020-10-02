<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
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
			<div class="col-2 bg-light">
				<%@ include file="../common/sidebar-my.jsp" %>
			</div>
			<div class="col-10" id="content-div">
				<div class="row">
					<div class="col-12">
						<div class="jumbotron mt-3"><!-- 수정누르면 내용 변경 -->
						  <h2 style="display: inline;">${LOGIN_USERS.name }님의 포트폴리오</h2>
						</div>
					</div>
				</div>
				<form id="form-new-board" method="post" action="userBoardWrite.do" >
					
					<div id="tag-box">
					</div>
					<div class="row">
						<div class="col-12 d-flex justify-content-center">
							<div class="input-group mb-3" style="width: 1300px;">
			                	<div class="input-group-prepend" >
			                   	 <label class="input-group-text d-flex justify-content-center" style="width: 100px;">작성자</label>
			                 	</div>            
			                  	<input type="text" class="form-control" id="board-writer" name="aaa" value="${LOGIN_USERS.name }" disabled>              
			                </div>
			            </div>
						
					</div>
					<div class="row">
						<div class="col-12 d-flex justify-content-center">
							<div class="input-group mb-3" style="width: 1300px;">
			                	<div class="input-group-prepend" >
			                   	 <label class="input-group-text d-flex justify-content-center" style="width: 100px;">Git 주소</label>
			                 	</div>            
			                  	<input type="text" class="form-control" id="board-git" name="userBoardGit">              
			                </div>
			            </div>
						
					</div>
					<div class="row">
						<div class="col-12 d-flex justify-content-center">
							<div class="input-group mb-3" style="width: 1300px;">
			                	<div class="input-group-prepend" >
			                   	 <a class="input-group-text d-flex justify-content-center btn btn-info" data-toggle="modal" data-target="#tag-list" style="width: 130px;">해시태그 선택</a>
			                 	</div>            
			                  	<input type="text" class="form-control" id="userboard-tag" disabled="disabled">              
			                </div>
			            </div>
					</div>
					<div class="row">
						<div class="col-12 d-flex justify-content-center">
							<div class="input-group mb-3" style="width: 1300px;">
							  <div class="input-group-prepend">
							    <button class="btn btn-outline-secondary dropdown-toggle " id="userboard-access" type="button" data-toggle="dropdown">공개범위</button>
							    <div class="dropdown-menu" id="userboard-access-list">
							      <a class="dropdown-item" href="#" data-access="전체공개">전체공개</a>
							      <a class="dropdown-item" href="#" data-access="비공개">비공개</a>
							      <a class="dropdown-item" href="#" data-access="회원공개">회원공개</a>
							    </div>
							  </div>
							  <input type="text" class="form-control" name="userBoardAccess" id="access-content" readonly>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-12 d-flex justify-content-center">
							<div class="input-group mb-3" style="width: 1300px;">
			                	<div class="input-group-prepend" >
			                   	 <label class="input-group-text d-flex justify-content-center" style="width: 100px;">제 목</label>
			                 	</div>            
			                  	<input type="text" class="form-control" id="board-title" name="userBoardTitle">               
			                </div>
			            </div>
						
					</div>
					<div class="row justify-content-md-center">
						<div class="col_c" style="margin-bottom: 30px">
			                <div class="input-group">                 
			                  <textarea id="ckeditor" name="userBoardContent"></textarea> 
			                </div>
			            </div> 
					
					</div>	
					
					<div class="row">
						<div class="col-12 text-center mb-5">
							<button type="submit" class="btn btn-outline-secondary" style="width: 20%; font-weight: bold"> 등   록 </button>
						</div>
					</div>
				</form>			
		    </div>
		    
		    
		</div>
	</div>
	
	<div class="modal fade" id="tag-list" tabindex="-1" aria-labelledby="hashtag-list" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="hashtag-list">해시태그</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      	<c:forEach var="category" items="${categories }">
	      	
		        <h4>${category.name }</h4>
		        <c:forEach var="tag" items="${category.catTags }">
		        <div class="custom-control custom-checkbox mb-3" >
			    	<input name="chk" value="${tag.tagNo }" data-tag-no="${tag.tagNo }" data-tag-name="${tag.tagName }" type="checkbox" class="custom-control-input" id="tag-${tag.tagNo }" required="required" ><!-- 체크박스 제한은 jquery에서 -->
			    	<label class="custom-control-label" for="tag-${tag.tagNo }">${tag.tagName }</label>
			    </div>
		        </c:forEach>
		        <hr>
	        
	      	</c:forEach>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary" id="save">Save changes</button>
	      </div>
	    </div>
	  </div>
	</div>
	
</div>

<script type="text/javascript" src="/resources/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">

$(function(){
	$("#userboard-access-list a").click(function(){
		var access = $(this).data("access");
		var content = $("#access-content").val(access) 
	})
	
	$("input[name=chk]").change(function(){
		var cnt = 2;
		if(cnt == $("input[name=chk]:checkbox:checked").length){
			$(":checkbox:not(:checked)").attr("disabled","disabled");
		} else {
			$("input[name=chk]:checkbox").removeAttr("disabled");
		}
	});
	
	
	
	
    $("#save").click(function(){
    	
		var $tagbox = $("#tag-box").empty();
    	
		var tags = [];
		
    	$("input[type='checkbox']:checked").each(function() {
			var tagNo = $(this).data("tag-no");
			var tagName = $(this).data("tag-name");
			
			tags.push(tagName);
			
			var $input = $("<input>");
			$input.attr("type", 'hidden')
			$input.attr('name', 'tags')
			$input.attr('value', tagNo);
			$tagbox.append($input);
			
			
		});
    	
    	var tagsText = tags.map(function(value, index) {
    		return "#" +value;
    	}).join("   ");
    	$("#userboard-tag").val(tagsText);
    	

    	$("#tag-list").modal("hide");
    	
    })    
	
	
    CKEDITOR.replace( 'ckeditor', {//해당 이름으로 된 textarea에 에디터를 적용
        width:'1300px',
        height:'400px',
        filebrowserImageUploadUrl: '/board/imageUpload.do' //여기 경로로 파일을 전달하여 업로드 시킨다.
    });
    
    
    CKEDITOR.on('dialogDefinition', function( ev ){
        var dialogName = ev.data.name;
        var dialogDefinition = ev.data.definition;
     
        switch (dialogName) {
            case 'image': //Image Properties dialog
                //dialogDefinition.removeContents('info');
                dialogDefinition.removeContents('Link');
                dialogDefinition.removeContents('advanced');
                break;
        }
    });
    
    $("#form-new-board").submit(function() {
		var $titleField = $("#board-title");
		var $writerField = $("#board-writer");
		var $hashtagField = $("#userboard-tag");
		if($titleField.val() == "") {
			alert("제목은 필수 입력 사항입니다.");
			$writerField.focus();
			return false;
		}
		
		if($writerField.val() == "") {
			alert("작성자는 필수 입력 사항입니다.");
			$writerField.focus();
			return false;
		}
		if($hashtagField.val() == "") {
			alert("해시태그는 필수 입력 사항입니다.");
			$hashtagField.focus();
			return false;
		}
		
		return true;
	});
    
});

</script>
</body>
</html>