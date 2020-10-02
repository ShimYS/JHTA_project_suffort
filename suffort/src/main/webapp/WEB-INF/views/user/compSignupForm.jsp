<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<head>
<title>Insert title here</title>
<style type="text/css">
	.mar-btm {
		margin-bottom: 25px;
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
	<div class="header">
		<div class="row">
			<div class="col-12 bg-dark">
				<%@ include file="../common/navbar.jsp" %>	
			</div>
		</div>
	</div>
	
	<div class="body" style="margin-top:72px">
		<div class="row">
			<div class="offset-4"></div>
			<div class="col-4" >
				<div class="card" style="margin-top:100px; margin-bottom:100px">
					<div class="card-body">
						<c:choose>
							<c:when test="${param.error eq 'already' }">
								<div class="alert alert-danger">
									<strong>회원가입 실패</strong> 이미 존재하는 아이디입니다
								</div>
							</c:when>
						</c:choose>
						<div class="text-center" style="margin-top:20px; margin-bottom:20px">
							기업 회원가입
						</div>
						<!-- form 구분 안에 submit 버튼 넣고, 목적지 확인하고, name 값은 vo의 변수명과 동일한지 확인 -->
						<!-- Form의 변수명과 같게 변경, companies.xml, CompaniesDao, CompanyService, Impl, mybatis-config까지 전부 바꾸기 -->
						<form id="form-company" method="POST" action="compcompleted.do">
							<div class="form-group">
								<label for="company-id">ID</label>
								<input type="text" class="form-control " placeholder="ID를 입력하세요" name="compId" id="company-id"/>
								<div class="check_font mar-btm" id="id_check"></div>
							</div>
							<div class="form-group">
								<label for="company-password">PWD</label>
								<input type="password" class="form-control" placeholder="비밀번호를 입력하세요" name="compPassword" id="company-password"/>
							</div>
							<div class="form-group">
								<label for="company-password-check">PWD 재입력</label>
								<input type="password" class="form-control" placeholder="비밀번호를 다시 입력하세요" name="" id="company-password-check"/>
								<div class="mar-btm" id="pwd-check"></div>
							</div>
							<div class="form-group">
								<label for="company-name">기업명</label>
								<input type="text" class="form-control mar-btm" placeholder="기업명을 입력하세요" name="compName" id="company-name" />
							</div>
							<div class="form-group">
								<label for="company-content" style="margin-top:10px">기업 소개</label>
								<textarea rows="4" class="form-control mar-btm" placeholder="기업 소개를 입력하세요" name="compContent" id="company-content"> </textarea>
							</div>
							<div class="form-group">
								<label for="company-url">기업 URL</label>
								<input type="text" class="form-control mar-btm" placeholder="기업의 홈페이지 주소를 입력하세요" name="compUrl" id="company-url" />
							</div>
							<div class="form-group">
								<label for="scale">기업 규모</label>
								<div class="radio mar-btm" id="scale">
									<input type="radio" id="company-size-big" name="compSize" value="대기업">
									<label for="company-size-big">대기업</label>
									&emsp;
									<input type="radio" id="company-size-mid" name="compSize" value="중견기업" >
									<label for="company-size-mid">중견기업</label>
									&emsp;
									<input type="radio" id="company-size-ms" name="compSize" value="중소기업" >
									<label for="company-size-ms">중소기업</label>
									&emsp;
									<input type="radio" id="company-size-start" name="compSize" value="스타트업">
									<label for="company-size-start">스타트업</label>
								</div>
							</div>
							<div class="form-group">
								<label for="company-address">기업 주소</label>
								<input type="text" class="form-control mar-btm" placeholder="기업의 위치를 입력하세요" name="compAddress" id="company-address" >
							</div>
							<div style="margin-top:30px">
								<a href="/user/comploginform.do" class="btn btn-danger float-left">취소</a>
								<button type="submit" class="btn btn-success float-right">회원가입</button>
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
<script type="texㅜt/javascript" src="/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#form-company").submit(function() {
		var $idField = $("#company-id");
		var $passwordField = $("#company-password");
		var $passwordCheckField = $("#company-password-check");
		var $nameField = $("#company-name");
		var $contentField = $("#company-content");
		var $urlField = $("#company-url");
		var $sizeField = $('input[name="Compsize"]:checked').val();
		var $addressField = $("#company-address");

		if ($idField.val() == "") {
			alert("아이디는 필수입력값입니다");
			$idField.focus();
			return false;
		}
		if ($passwordField.val() == "") {
			alert("비밀번호는 필수입력값입니다");
			$passwordField.focus();
			return false;
		}
		if ($passwordCheckField.val() != $passwordField.val()) {
			alert("비밀번호 재입력란을 확인해주세요")
			$passwordCheckField.focus();
			return false;
		}
		if ($nameField.val() == "") {
			alert("기업명은 필수입력값입니다");
			$nameField.focus();
			return false;
		}
		if ($contentField.val() == "") {
			alert("기업 소개는 필수입력값입니다");
			$contentField.focus();
			return false;
		}
		if ($urlField.val() == "") {
			alert("기업 홈페이지는 필수입력값입니다");
			$urlField.focus();
			return false;
		}
		if ($sizeField.val() == "") {
			alert("기업 규모는 필수입력값입니다");
			$sizeField.focus();
			return false;
		}
		if ($addressField.val() == "") {
			alert("기업 주소는 필수입력값입니다");
			$addressField.focus();
			return false;
		}
		
		return true;
	})
	

	
	$("#company-id").blur(function() {
		var compId = $("#company-id").val();
		
		$.ajax({
			url: '/user/compCheckId.do',
			data: "compId=" + compId,
			type: 'POST',
			success: function(data) {
				console.log("0=중복 , 1=중복x : " + data);
				
				if (data == "0") {
					$("#id_check").text("이미 사용중인 아이디입니다");
					$("#id_check").css("color", "red");
				} else if (data = "1") {
					$("#id_check").text("사용 가능한 아이디입니다");
					$("#id_check").css("color", "green");
				}
			}
		})
	})

	

	// 비밀번호 작성
	$("#company-password").on("click keyup focus blur propertychange", function() {
		
		// 확인에 값이 없을 때
		if ($("#company-password-check").val() == "") {
			// 밑글을 없앰
			$("#pwd-check").empty()
			
		// 확인에 값이 있긴 한데
		} else {

			// 본글이 없으면
			if($("#company-password").val() == "" ) {
				// 밑글을 없애고
				$("#pwd-check").empty()
			}
			
			// 본글이 있긴 한데 확인란과 틀리면
			if ($("#company-password").val() != $("#company-password-check").val()) {
				$('#pwd-check').text("비밀번호가 일치하지 않습니다");
				$('#pwd-check').css("color","red");
			// 본글이 있고 확인란과 일치하면
			} else {
				$('#pwd-check').text("비밀번호가 일치합니다");
				$('#pwd-check').css("color","green");
			}
		}
		
	})

	// 비밀번호 확인 중
	$("#company-password-check").on("click keyup focus blur propertychange", function() {
		
		// 확인에 값이 없을 때
		if ($("#company-password-check").val() == "") {	// 값이 없을때
			// 밑글을 없앰
			$("#pwd-check").empty()
			
		// 확인에 값이 있긴 한데
		} else {

			// 본글이 없으면
			if($("#company-password").val() == "" ) {
				// 밑글을 없애고
				$("#pwd-check").empty()
			}
			
			// 본글이 있긴 한데 확인란과 틀리면
			if ($("#company-password").val() != $("#company-password-check").val()) {
				$('#pwd-check').text("비밀번호가 일치하지 않습니다");
				$('#pwd-check').css("color","red");
			// 본글이 있고 확인란과 일치하면
			} else {
				$('#pwd-check').text("비밀번호가 일치합니다");
				$('#pwd-check').css("color","green");
			}
		}
		
	})
	
	
	
})
</script>
</body>
</html>