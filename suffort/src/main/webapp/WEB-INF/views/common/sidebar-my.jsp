<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style type="text/css">
    	.sample {
    		padding-top:7px;
			padding-left:3px;
			padding-right:0px
    	}
    	
    	#sticky {
    		position: sticky;
    		position: -webkit-sticky;
    		top: 120px;
    	}
    	
    	input[type="file"] {
		  width: 90px;
		  height: 38px;
		  border-radius: 2px;
		  border: 1px solid #ccc;
		  margin-right: 5px;
		}
		
    </style>
    
<div style="height: 800px;" class="text-white" id="sticky">
	<c:choose>
		<c:when test="${not empty param.userNo and param.userNo ne LOGIN_USERS.no   }">
		
			<div class="text-center mt-5 mb-2">
				<c:choose>
					<c:when test="${empty user.img }"> <!-- 남의 저장된 사진이 없는 경우 -->
						<c:choose>
							<c:when test="${user.gender eq 'M'}">
								<img src="../../resources/img/kakao_lion_mask.png" width="250px;" />
							</c:when>
							<c:when test="${user.gender eq 'F'}">
								<img src="../../resources/img/kakao_apeach_mask.png" width="250px;" />
							</c:when>
						</c:choose>
					</c:when>
					
					<c:when test="${not empty user.img}"> <!-- 남의 저장된 사진이 있는 경우 -->
						<img src="/resources/img/uploadimg/${user.img}" width="250px;" height="250px;" class="logo-pre"/>
					</c:when>
				</c:choose>
			</div>
			
			<div class="row" style="font-size:14px; padding:0px; margin:0px;">
				
					<div class="row border-bottom pb-5 mb-2">
						<div class="col-2 sample">
							&emsp;이름
						</div>
						<div class="col-4 mb-2 pr-0">
							<input type="hidden" class="form-control form-control-sm user-info text-center" value="${user.no }" name="no" id="user-no" disabled />
							<input type="text" class="form-control form-control-sm user-info text-center" value="${user.name }" name="name" id="user-name" disabled />
						</div>
						
						<div class="col-2 sample pr-1">
							&emsp;성별
						</div>
						<div class="col-4 mb-2 radio sample" id="user-gender">
							<c:choose>
								<c:when test="${user.gender eq 'M'}">
									<input type="radio" class="  radio-sm user-info text-center" value="M" name="gender" checked disabled /> 남 &ensp;
									<input type="radio" class="  radio-sm user-info text-center" value="F" name="gender" disabled /> 여
								</c:when>
								
								<c:when test="${user.gender eq 'F' }">
									<input type="radio" class="  radio-sm user-info text-center" value="M" name="gender" disabled/> 남 &ensp;
									<input type="radio" class="  radio-sm user-info text-center" value="F" name="gender" checked disabled/> 여
								</c:when>
							</c:choose>
						</div>
						
						<div class="col-3 sample ">
							&emsp;이메일
						</div>
						<div class="col-9 mb-2" style="padding-left:3px;">
							<input type="text" class="form-control form-control-sm user-info" value="${user.email }" name="email" id="user-email" disabled />
						</div>
						
						<div class="col-3 sample ">
							&emsp;생년월일
						</div>
						<div class="col-9 mb-2">
							<input type="date" class="form-control form-control-sm user-info" value='<fmt:formatDate value="${user.birth }" pattern="yyyy-MM-dd"/>' name="birth" id="user-birth" disabled />
						</div>
		
						<div class="col-3 sample ">
							&emsp;Git 주소
						</div>
						<div class="col-9 mb-2">
							<input type="text" class="form-control form-control-sm user-info" value="${user.gitAddr }" name="gitAddr" id="user-git" disabled />
						</div>
						
					</div>
				
			</div>
			
			<div class="row mb-5">
				<div class="col-12">
					<div class="d-flex justify-content-center mt-5"><h5><a href="/common/career.do?userNo=${user.no }" class="text-white-50">경력 / 자격증 보러가기</a></h5></div>
				</div>
			</div>
			
		</c:when>
		
		
		
		
		<c:otherwise>
			<div class="row" style="font-size:14px; padding:0px; margin:0px;">
				<form id="info-submit" method="POST" action="/board/userinfoupdate.do" enctype="multipart/form-data">
				
				<div class="text-center mt-5 mb-5" id="preview">
					<c:choose>
						<c:when test="${empty LOGIN_USERS.img }"> <!-- 내 저장된 사진이 없는 경우 -->
							<c:choose>
								<c:when test="${LOGIN_USERS.gender eq 'M'}">
									<img src="../../resources/img/kakao_lion_mask.png" width="250px;" height="250px;" class="logo-pre"/>
								</c:when>
								<c:when test="${LOGIN_USERS.gender eq 'F'}">
									<img src="../../resources/img/kakao_apeach_mask.png" width="250px;" height="250px;" class="logo-pre"/>
								</c:when>
							</c:choose>
						</c:when>
						<c:when test="${not empty LOGIN_USERS.img }"> <!-- 내 저장된 사진이 있는 경우 -->
							<img src="../../resources/img/uploadimg/${LOGIN_USERS.img}" width="250px;" height="250px;" class="logo-pre"/>
						</c:when>
					</c:choose>
					
					<div class="offset-8"  style="margin-right:17px">
						<input type="file" class="form-control form-control-sm user-info text-center img-pre mt-1" accept=".jpg, .png" value="../../resources/img/uploadimg/${LOGIN_USERS.img }" name="upfile" class="logo-pre" id="user-img" disabled />
					</div>
				</div>
				
					<div class="row border-bottom ">
						<div class="col-2 sample">
							&emsp;이름
						</div>
						<div class="col-4 mb-2 pr-0">
							<input type="hidden" class="form-control form-control-sm user-info text-center" value="${LOGIN_USERS.no }" name="no" id="user-no" disabled />
							<input type="text" class="form-control form-control-sm user-info text-center" value="${LOGIN_USERS.name }" name="name" id="user-name" disabled />
						</div>
						
						<div class="col-2 sample pr-1">
							&emsp;성별
						</div>
						<div class="col-4 mb-2 radio sample" id="user-gender">
							<c:choose>
								<c:when test="${LOGIN_USERS.gender eq 'M'}">
									<input type="radio" class="  radio-sm user-info text-center" value="M" name="gender" checked disabled /> 남 &ensp;
									<input type="radio" class="  radio-sm user-info text-center" value="F" name="gender" disabled /> 여
								</c:when>
								
								<c:when test="${LOGIN_USERS.gender eq 'F' }">
									<input type="radio" class="  radio-sm user-info text-center" value="M" name="gender" disabled/> 남 &ensp;
									<input type="radio" class="  radio-sm user-info text-center" value="F" name="gender" checked disabled/> 여
								</c:when>
							</c:choose>
						</div>
						
						<div class="col-3 sample ">
							&emsp;이메일
						</div>
						<div class="col-9 mb-2" style="padding-left:3px;">
							<input type="text" class="form-control form-control-sm user-info" value="${LOGIN_USERS.email }" name="email" id="user-email" disabled />
						</div>
						
						<div class="col-3 sample ">
							&emsp;생년월일
						</div>
						<div class="col-9 mb-2" style="">
							<input type="date" class="form-control form-control-sm user-info" value='<fmt:formatDate value="${LOGIN_USERS.birth }" pattern="yyyy-MM-dd"/>' name="birth" id="user-birth" disabled />
						</div>
		
						<div class="col-3 sample ">
							&emsp;Git 주소
						</div>
						<div class="col-9 mb-2">
							<input type="text" class="form-control form-control-sm user-info" value="${LOGIN_USERS.gitAddr }" name="gitAddr" id="user-git" disabled />
						</div>
						
						<div class="col-12 mb-5 text-right" >
							<c:if test="${pageContext.request.requestURI ne '/WEB-INF/views/board/userBoardWrite.jsp'}">
									<a class="btn btn-success btn-sm " id="modify-user-btn">수정</a>	
									<button type="reset" class="btn btn-danger btn-sm " id="cancel-user-btn">리셋</button>	
									<button type="submit" class="btn btn-primary btn-sm " id="confirm-user-btn" >확인</button>	
							</c:if>
						</div>
					</div>
					<div class=" mb-5"></div>
				</form>
		
				
		
			</div>
			<div class="row mb-5">
				<div class="col-12">
				
					<div class="d-flex justify-content-center"><h5><a href="/common/career.do" class="text-white-50">경력 / 자격증 보러가기</a></h5></div>
				</div>
			
			</div>
			
			<div class="text-center mb-5">
					<a class="btn btn-lg btn-warning" id="user-delete" href="/user/userDelete.do?userNo=${LOGIN_USERS.no }">회원 탈퇴</a><!-- redirect:https://nid.naver.com/user2/help/externalAuth.nhn?lang=ko_KR -->
			</div>
		</c:otherwise>
	</c:choose>
</div>
		
<script type="text/javascript">

	

	
	
	
 $(function() {
	 $("#user-delete").click(function(){
		 alert("탈퇴가 완료되었습니다. 잔여 정보 삭제를 원하는 네이버 회원은 suffort 사이트를 연결해제 해주시기 바랍니다");
	 })
	 
	 $('#confirm-user-btn').hide();
	 $('#cancel-user-btn').hide();
	
	 
	 
	 $('#modify-user-btn').click(function() {
		 event.preventDefault();
		 // 바로 전송을 막기 위한 이벤트 정지?
		 
		 $('.user-info').attr('disabled', false);
		 $('#modify-user-btn').hide();
		 $('#confirm-user-btn').show();
		 $('#cancel-user-btn').show();
	 })
	 
	 
	$("#user-birth").change(function() {
		var $userBirthField = $("#user-birth");
		var today = new Date();
		var realToday = today.getFullYear() + "-" + ( ("0" + (today.getMonth() + 1)).slice(-2) ) + "-" + ("0" + today.getDate()).slice(-2);
		
		if ($userBirthField.val() > realToday) {
			alert("미래 날짜는 입력할 수 없습니다");
			$userBirthField.focus();
			$userBirthField.val('Default value');
			return false;
		}
		return true;
	})

	
	$('#confirm-user-btn').click(function() {

		$('#info-submit').submit();
	})
	 
	
	 
	$(".img-pre").on('change', function(){
	    readInputFile(this);
	});
	
	function readInputFile(input) {
	    if(input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	        	$('.logo-pre').attr('src', e.target.result);
	        }
	        reader.readAsDataURL(input.files[0]);
	        
	    }
	}
	 

 })
</script>