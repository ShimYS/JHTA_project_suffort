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
							사용자 회원가입
						</div>
						<!-- form 구분 안에 submit 버튼 넣고, 목적지 확인하고, name 값은 vo의 변수명과 동일한지 확인 -->
						<!-- Form의 변수명과 같게 변경, users.xml, UserDao, UserService, Impl, mybatis-config까지 전부 바꾸기 -->
						<form id="form-user" method="POST" action="/user/usercompleted.do">
							<div class="form-group">
								<label for="user-id">ID</label>
								<input type="text" class="form-control" placeholder="ID를 입력하세요" name="userId" id="user-id" />
								<div class="check_font mar-btm" id="id_check"></div>
							</div>
							<div class="form-group">
								<label for="user-password">PWD</label>
								<input type="password" class="form-control mar-btm" placeholder="비밀번호를 입력하세요" name="loginWayPwd" id="user-password"/>
							</div>
							<div class="form-group">
								<label for="user-password-check">PWD 재입력</label>
								<input type="password" class="form-control" placeholder="비밀번호를 다시 입력하세요" name="" id="user-password-check"/>
								<div class="mar-btm" id="pwd-check"></div>
							</div>
							<div class="form-group">
								<label for="user-name">이름</label>
								<input type="text" class="form-control mar-btm" placeholder="이름을 입력하세요" name="userName" id="user-name" />
							</div>
							<div class="form-group">
								<label for="gender-id">성별</label>
								<div class="radio mar-btm" id="gender-id">
									<input type="radio" id="gender-male" name="userGender" value="M">
									<label for="gender-male">남성</label>
									&emsp;
									<input type="radio" id="gender-female" name="userGender" value="F">
									<label for="gender-female">여성</label>
								</div>
							</div>
							<div style="margin-top:30px">
								<a href="/user/userloginform.do" class="btn btn-danger float-left">취소</a>
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
<script type="text/javascript" src="/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#form-user").submit(function() {
		var $idField = $("#user-id");
		var $passwordField = $("#user-password");
		var $passwordCheckField = $("#user-password-check");
		var $nameField = $("#user-name");
		var $genderField = $('input[name="gender"]:checked').val();

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
			alert("이름은 필수입력값입니다");
			$nameField.focus();
			return false;
		}
		if ($genderField.val() == "") {
			alert("성별은 필수입력값입니다");
			$genderField.focus();
			return false;
		}
		
		return true;
	})
	
	
	
	$("#user-id").blur(function() {
		var userId = $("#user-id").val();
		
		$.ajax({
			url: '/user/userCheckId.do',
			data: "userId=" + userId,
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
	$("#user-password").on("click keyup focus blur propertychange", function() {
		
		// 확인에 값이 없을 때
		if ($("#user-password-check").val() == "") {
			// 밑글을 없앰
			$("#pwd-check").empty()
			
		// 확인에 값이 있긴 한데
		} else {

			// 본글이 없으면
			if($("#user-password").val() == "" ) {
				// 밑글을 없애고
				$("#pwd-check").empty()
			}
			
			// 본글이 있긴 한데 확인란과 틀리면
			if ($("#user-password").val() != $("#user-password-check").val()) {
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
	$("#user-password-check").on("click keyup focus blur propertychange", function() {
		
		// 확인에 값이 없을 때
		if ($("#user-password-check").val() == "") {	// 값이 없을때
			// 밑글을 없앰
			$("#pwd-check").empty()
			
		// 확인에 값이 있긴 한데
		} else {

			// 본글이 없으면
			if($("#user-password").val() == "" ) {
				// 밑글을 없애고
				$("#pwd-check").empty()
			}
			
			// 본글이 있긴 한데 확인란과 틀리면
			if ($("#user-password").val() != $("#user-password-check").val()) {
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