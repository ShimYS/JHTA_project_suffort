<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script type="text/javascript" src="/resources/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/resources/bootstrap/js/bootstrap.min.js"></script>
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
			<div class="col-2 bg-light" style="background-image: url('https://whale-store.pstatic.net/20191111_63/1573440818118JES0l_PNG/nightwhale_img02.png');" >
				<%@ include file="../common/sidebar-my.jsp" %>
			</div>
			<div class="col-10" id="content-div">
				<div class="row mt-5">
					<div class="col-12">
						<nav class="nav nav-pills flex-column flex-sm-row">
  							<a class="flex-sm-fill text-sm-center nav-link active" href="/common/career.do">경력</a>
  							<a class="flex-sm-fill text-sm-center nav-link" href="/common/license.do">자격증</a>
  						</nav>
					</div>
				</div>
				
				<input type="hidden" id="user-no" value="${param.userNo }" />
				<c:choose>
					<c:when test="${empty param.userNo }">
						<div class="row mt-3">
							<div class="col-12">
								<div class="card mb-3">
									<div class="card-header">
										<h5 class="card-title mb-0">※ 경력 추가</h5>
									</div>
								
								    <form id="career-submit" method="POST" action="/common/usercareerupdate.do" >
		 								  <div class="card-body "> 
										    	<div class="col-12">
													<div class="row mt-4 text-center">
														<div class="col-3 mb-2">
															회사명
														</div>
														<div class="col-3 mb-2 form-group">
															<input type="text" class="form-control form-control-sm career-info text-center" value="" name="companyName" id="company-name" placeholder="회사명을 입력하세요" />
														</div>
														<div class="col-2 mb-2 mt-1" >
															근속월수
														</div>
														<div class="col-3 mb-2 mt-1 form-group">
															<input type="number" class="form-control form-control-sm career-info text-center" value="" name="month" id="work-month" placeholder="ex.12"  />
														</div>
														
														<div class="col-3 mb-2 text-center" style="padding-top:7px;" >
															직위
														</div>
														<div class="col-3 mb-2 form-group" style="text-align-last:center;">
															<select class="custom-select " id="rank" name="jobContent">
																<option selected disabled hidden value="">	&emsp;&emsp;&emsp;&emsp; -- 직위를 선택하세요 --</option>
																<option id="intern" value="인턴">				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;인턴</option>
																<option id="staff" value="사원">				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;사원</option>
																<option id="supervisor" value="주임">			&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;주임</option>
																<option id="assis" value="대리">				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;대리</option>
																<option id="manager" value="과장">			&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;과장</option>
																<option id="deputy" value="차장">				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;차장</option>
																<option id="general" value="부장 이상">			&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;부장 이상</option>
															</select>
														</div>
														<div class="col-2 mt-2 mb-2 text-center">
															직책
														</div>
														<div class="col-3 mb-4 mt-1 form-group">
															<input type="text" class="form-control form-control-sm career-info text-center" value="" name="jobPosition" id="job-position" placeholder="ex.개발 및 서버관리"  />
															<input type="hidden" class="form-control form-control-sm career-info text-center" value="${LOGIN_USERS.no }" name="userNo" />
														</div> 
													</div>
													
												</div>
										  </div>
										  <div class="card-footer bg-white">
												<div class="col-12 text-right" >
													<c:if test="${pageContext.request.requestURI ne '/WEB-INF/views/board/userBoardWrite.jsp'}">
															<button type="reset" class="btn btn-danger " id="cancel-career-btn">리셋</button>	
															<button type="submit" class="btn btn-primary " id="confirm-career-btn">추가</button>	
													</c:if>
												</div>
										  </div>
								    </form>
								    
								</div>							  
							</div>
						</div>
						
					</c:when>
				</c:choose>
				
				<div class="row mt-5">
					<div class="col-12">
						<table class="table table-hover" id="table-career">
					
						  <thead class="text-center">
						    <tr>
						      <th scope="col">회사명</th>
						      <th scope="col">근속월수</th>
						      <th scope="col">직위</th>
						      <th scope="col">직책</th>
						      <th scope="col">#</th>
						    </tr>
						  </thead>
						  
						  <tbody class="text-center">
						  <!-- ajax -->
						  </tbody>
						</table>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function(){

	var param = {};
	var userNo = $("#user-no").val();
	if (userNo) {
		param["userNo"] = userNo;
	}
	
  	$.ajax({
		type: "GET",
		url: "/common/careerajax.do",
		data:param,
		dataType: "json",
		success: function (results) {
			 var $tbody = $("#table-career tbody").empty();
			 $.each(results, function(index, result) {
				 console.log(result);
				 var tr = "<tr id='career-row-"+result.no+"'>";
					tr += "<td>"+result.companyName+"</td>";
					tr += "<td>"+result.month+"</td>";
					tr += "<td>"+result.jobContent+"</td>";
					tr += "<td>"+result.jobPosition+"</td>";
					if (!userNo) {
						tr += "<td><button class='btn btn-danger btn-sm' data-no='"+result.no+"'>삭제</button></td>";
					} else {
						tr += "<td></td>";						
					}
					tr += "<tr>";
					
					$tbody.append(tr);
			 })
			 
		 } 
	})
	 
	
	$("tbody").on("click", "button", function() {
		var careerNo = $(this).data("no");
		$.ajax({
			type: "GET",
			url: "/common/careerajaxdel.do",
			data:{careerNo:careerNo},
			success: function (results) {
				$("#career-row-" + careerNo).remove();
			}
		})
	})
	
	
	
	$("#career-submit").submit(function() {
		var $nameField = $("#company-name");
		var $monthField = $("#work-month");
		var $rankField = $("#rank option:selected");
		var $positionField = $("#job-position");

		if ($nameField.val() == "") {
			alert("회사명은 필수입력값입니다");
			$nameField.focus();
			return false;
		}
		if ($monthField.val() == "") {
			alert("근속월수는 필수입력값입니다");
			$monthField.focus();
			return false;
		}
		if ($rankField.val() == "") {
			alert("직위는 필수입력값입니다");
			$rankField.focus();
			return false;
		}
		if ($positionField.val() == "") {
			alert("직책은 필수입력값입니다");
			$positionField.focus();
			return false;
		}
		
		return true;
	})
	
	
	$("#work-month").change(function() {
		var $monthField = $("#work-month");
		
		if ($monthField.val() > 1200) {
			alert("경력은 100년 이하까지만 기입 가능합니다");
			$monthField.focus();
			$monthField.val('Default value');
		}
		
	})
		
	

	
	
})


</script>
</body>
</html>