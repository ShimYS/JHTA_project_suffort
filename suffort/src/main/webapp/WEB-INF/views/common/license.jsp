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
			<div class="col-2 bg-light" style="background-image: url('https://whale-store.pstatic.net/20191111_63/1573440818118JES0l_PNG/nightwhale_img02.png');">
				<%@ include file="../common/sidebar-my.jsp" %>
			</div>

			<div class="col-10" id="content-div">
				<div class="row mt-5">
					<div class="col-12">
						<nav class="nav nav-pills flex-column flex-sm-row">
  							<a class="flex-sm-fill text-sm-center nav-link" href="/common/career.do">경력</a>
  							<a class="flex-sm-fill text-sm-center nav-link active" href="/common/license.do">자격증</a>
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
										<h5 class="card-title mb-0">※ 자격증 추가</h5>
									</div>
								
								    <form id="license-submit" method="POST" action="/common/userlicenseupdate.do" >
		 								  <div class="card-body "> 
										    	<div class="col-12">
													<div class="row mt-4 text-center">
														<div class="col-3 mb-2">
															자격증 이름
														</div>
														<div class="col-3 mb-2 form-group">
															<input type="text" class="form-control form-control-sm license-info text-center" value="" name="name" id="license-name" placeholder="자격증 이름을 입력하세요" />
														</div>
														
														<div class="col-2 mb-2 mt-1" >
															등급
														</div>
														<div class="col-3 mb-2 form-group "style="text-align: center; text-align-last: center; float:center;">
															<select class="custom-select " id="license-grade" name="grade">
																<option selected disabled hidden value="">	&emsp;&emsp;&emsp;&emsp; -- 종류를 선택하세요 -- </option>
																<option id="one-grade" value="1종">			&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;1종</option>
																<option id="two-grade" value="2종">			&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;2종</option>
																<option id="not-grade" value="종류없음">		&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;종류없음</option>
															</select>
														</div>
													</div>
													
													<div class="row text-center">
														<div class="col-3 mb-2">
															발행처
														</div>
														<div class="col-3 mb-2 form-group">
															<input type="text" class="form-control form-control-sm license-info text-center" value="" name="company" id="license-company" placeholder="ex. 한국산업인력공단" />
														</div>
														<div class="col-2 mt-2 mb-2 text-center">
															취득일
														</div>
														<div class="col-3 mb-4 mt-1 form-group">
															<input type="date" class="form-control form-control-sm license-info text-center" value='<fmt:formatDate value="" pattern="yyyy-MM-dd"/>' name="registeredDate" id="license-registered-date"  />
															<input type="hidden" class="form-control form-control-sm license-info text-center" value="${LOGIN_USERS.no }" name="userNo" />
														</div>
														<div class="offset-1"></div>
													</div>

													
												</div>
										  </div>
										  <div class="card-footer bg-white">
												<div class="col-12 text-right" >
													<c:if test="${pageContext.request.requestURI ne '/WEB-INF/views/board/userBoardWrite.jsp'}">
															<button type="reset" class="btn btn-danger " id="cancel-license-btn">리셋</button>	
															<button type="submit" class="btn btn-primary " id="confirm-license-btn">추가</button>	
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
						<table class="table table-hover" id="table-license">
					
						  <thead class="text-center">
						    <tr>
						      <th scope="col">자격증 이름</th>
						      <th scope="col">등급</th>
						      <th scope="col">발행처</th>
						      <th scope="col">취득일</th>
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
		url: "/common/licenseajax.do",
		data: param,
		dataType: "json",
		success: function (results) {
			 var $tbody = $("#table-license tbody").empty();
			 $.each(results, function(index, result) {
				 console.log(result);
				 var tr = "<tr id='license-row-"+result.no+"'>";
					tr += "<td>"+result.name+"</td>";
					tr += "<td>"+result.grade+"</td>";
					tr += "<td>"+result.company+"</td>";
					tr += "<td>"+result.registeredDate+"</td>";

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
		var licenseNo = $(this).data("no");
		$.ajax({
			type: "GET",
			url: "/common/licenseajaxdel.do",
			data:{licenseNo:licenseNo},
			success: function (results) {
				$("#license-row-" + licenseNo).remove();
			}
		})
	})
	


	
	$("#license-registered-date").change(function() {
		var $registeredField = $("#license-registered-date");
		var today = new Date();
		var realToday = today.getFullYear() + "-" + ( ("0" + (today.getMonth() + 1)).slice(-2) ) + "-" + ("0" + today.getDate()).slice(-2);
		
		if ($registeredField.val() > realToday) {
			alert("미래 날짜는 입력할 수 없습니다");
			$registeredField.focus();
			$registeredField.val('Default value');
			return false;
		}
		return true;
	})
	
	
	
	
	$("#license-submit").submit(function() {
		var $nameField = $("#license-name");
		var $gradeField = $("#license-grade option:selected");
		var $companyField = $("#license-company");
		var $registeredField = $("#license-registered-date");
		var today = new Date();
		var realToday = today.getFullYear() + "-" + ( ("0" + (today.getMonth() + 1)).slice(-2) ) + "-" + ("0" + today.getDate()).slice(-2);

		if ($nameField.val() == "") {
			alert("자격증은 필수입력값입니다");
			$nameField.focus();
			return false;
		}
		if ($gradeField.val() == "") {
			alert("등급은 필수입력값입니다");
			$gradeField.focus();
			return false;
		}
		if ($companyField.val() == "") {
			alert("발행처는 필수입력값입니다");
			$companyField.focus();
			return false;
		}
		if ($registeredField.val() == "") {
			alert("취득일은 필수입력값입니다");
			$registeredField.focus();
			return false;
		}
		
		return true;
	})
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
})


</script>
</body>
</html>