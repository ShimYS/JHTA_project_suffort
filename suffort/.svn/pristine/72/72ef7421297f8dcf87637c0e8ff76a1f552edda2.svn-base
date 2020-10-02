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
    	
    </style>

<div style="height: 800px;" class="text-white" id="sticky">
	
			<div class="row" style="font-size:14px; padding:0px; margin:0px;">
				<form id="info-company-submit" method="POST" action="/board/companyinfoupdate.do" enctype="multipart/form-data">
				
	<div class="text-center mt-5 mb-5" id="preview">
		<c:choose>
<%-- 			<c:when test="${LOGIN_USERS.logo eq '../../resources/img/comp_default_logo_1.png' }"> --%>
			<c:when test="${LOGIN_USERS.logo eq '../../resources/img/suffort.png' }">
				<img src="/resources/img/comp_default_logo_1.png" width="250px;" height="250px;" class="logo-pre"/>
			</c:when>
<%-- 			<c:when test="${LOGIN_USERS.logo ne '../../resources/img/comp_default_logo_1.png' }"> --%>
			<c:when test="${LOGIN_USERS.logo ne '../../resources/img/suffort.png' }">
				<img src="/resources/img/uploadimg/${LOGIN_USERS.logo}" width="250px;" height="250px;" class="logo-pre"/>
<%-- 				<input type="image" src="../../resources/img/uploadimg/${LOGIN_USERS.logo}" value="../../resources/img/uploadimg/${LOGIN_USERS.logo }" class="logo-pre" width="250px;" height="250px;" disabled /> --%>
				
			</c:when>
		</c:choose>
<%-- 							<input type="file" class="form-control form-control-sm company-info text-center img-pre" accept=".jpg, .png" value="${LOGIN_USERS.logo }" name="logo" id="company-logo" disabled /> --%>
							<input type="file" class="form-control form-control-sm company-info text-center img-pre" accept=".jpg, .png" value="../../resources/img/uploadimg/${LOGIN_USERS.logo }" name="upfile" class="logo-pre" id="company-logo" disabled />
	</div>
				
					<div class="row border-bottom">
						<!-- 로고, 첨부파일 자리 -->
						<div class="col-3 pl-2 sample">
							&emsp;기업명
						</div>
						<div class="col-9 pl-2 mb-2">
							<input type="hidden" class="form-control form-control-sm company-info text-center" value="${LOGIN_USERS.no }" name="no" id="company-no" disabled />
							<input type="text" class="form-control form-control-sm company-info text-center" value="${LOGIN_USERS.name }" name="name" id="company-name" disabled />
						</div>
						
						<div class="col-3 pl-2 sample">
							&emsp;소개
						</div>
						<div class="col-9 pl-2 mb-2">
							<textarea rows="3" class="form-control form-control-sm company-info" name="content" id="company-content" disabled>${LOGIN_USERS.content }</textarea>
						</div>
						
						<div class="col-3 sample ">
							&emsp;홈페이지
						</div>
						<div class="col-9 mb-2" >
							<input type="text" class="form-control form-control-sm company-info text-center" value="${LOGIN_USERS.url }" name="url" id="company-url" disabled />
						</div>
						
						<div class="col-3 sample" style="padding-top:9px;">
							&emsp;기업규모
						</div>
						<div class="col-9 mb-2">
							<select class="custom-select company-info" id="company-size" name="size" disabled >
							<c:choose>
								<c:when test="${not empty LOGIN_USERS.size}">
									<option value="${LOGIN_USERS.size }" id="company-selected-size">${LOGIN_USERS.size }</option>
								</c:when>
								
								<c:otherwise>
									<option selected disabled>						-- 규모를 선택하세요 -- </option>
								</c:otherwise>
							</c:choose>
								<option id="company-size-big" value="대기업">대기업</option>
								<option id="company-size-mid" value="중견기업">중견기업</option>
								<option id="company-size-ms" value="중소기업">중소기업</option>
								<option id="company-size-start" value="스타트업">스타트업</option>
							</select>
						</div>
		
						<div class="col-3 pl-2 sample ">
							&emsp;주소
						</div>
						<div class="col-9 mb-2">
							<input type="text" class="form-control form-control-sm company-info text-center" value="${LOGIN_USERS.address }" name="address" id="company-address" disabled />
						</div>

						<div class="col-3 sample ">
							&emsp;설립일
						</div>
						<div class="col-9 mb-2">
							<input type="date" class="form-control form-control-sm company-info " value='<fmt:formatDate value="${LOGIN_USERS.startedDate }" pattern="yyyy-MM-dd"/>' name="startedDate" id="company-started-date" disabled/>
						</div>
						
						<div class="col-3 pl-2 sample ">
							&emsp;매출액
						</div>
						<div class="col-9 mb-2">
							<input type="text" class="form-control form-control-sm company-info text-center" value="${LOGIN_USERS.income }" name="income" id="company-income" disabled />
						</div>

						
						<div class="col-12 mb-5 text-right" >
							<c:if test="${pageContext.request.requestURI ne '/WEB-INF/views/board/userBoardWrite.jsp'}">
									<a class="btn btn-success btn-sm " id="modify-company-btn">수정</a>	
									<button type="reset" class="btn btn-danger btn-sm " id="cancel-company-btn">리셋</button>	
									<button type="submit" class="btn btn-primary btn-sm " id="confirm-company-btn" >확인</button>	
							</c:if>
						</div>
						
					</div>
					<div class="mb-5"></div>				
				</form>
				
				
			</div>

			<div class="text-center mb-5">
					<a class="btn btn-lg btn-warning" id="company-delete" href="/company/companyDelete.do?companyNo=${LOGIN_USERS.no }">회원 탈퇴</a><!-- redirect:https://nid.naver.com/user2/help/externalAuth.nhn?lang=ko_KR -->
			</div>


</div>

<script type="text/javascript">

 $(function() {
	 $("#company-delete").click(function(){
		 alert("기업 탈퇴는 관리자에게 문의 바랍니다");
	 })
	 
	 $('#confirm-company-btn').hide();
	 $('#cancel-company-btn').hide();
	
	 
	 
	 $('#modify-company-btn').click(function() {
		 event.preventDefault();
		 // 바로 전송을 막기 위한 이벤트 정지?
		 
		 $('.company-info').attr('disabled', false);
		 $('#company-selected-size').hide();
		 
		 $('#modify-company-btn').hide();
		 $('#confirm-company-btn').show();
		 $('#cancel-company-btn').show();
	 })

	 
	$("#company-started-date").change(function() {
		var $companyStartedField = $("#company-started-date");
		var today = new Date();
		var realToday = today.getFullYear() + "-" + ( ("0" + (today.getMonth() + 1)).slice(-2) ) + "-" + ("0" + today.getDate()).slice(-2);
		
		if ($companyStartedField.val() > realToday) {
			alert("미래 날짜는 입력할 수 없습니다");
			$companyStartedField.focus();
			$companyStartedField.val('Default value');
			return false;
		}
		return true;
	})
	 
	 
	$('#confirm-company-btn').click(function() {
		 
		$('#info-company-submit').submit();
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