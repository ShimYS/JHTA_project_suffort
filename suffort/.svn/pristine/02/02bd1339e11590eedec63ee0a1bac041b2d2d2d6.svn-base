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
<title>Admin Community List</title>
<style type="text/css">
            @font-face {
    font-family: 'paybooc-Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/paybooc-Bold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
            
.card {
	margin-top : 20px;
	box-shadow: 13px 15px 9px -7px #7d7d7d;
}                

#commTitle {
  width        : 200px;     /* 너비는 변경될수 있습니다. */
  text-overflow: ellipsis;  /* 위에 설정한 px 보다 길면 말줄임표처럼 표시합니다. */
  white-space  : nowrap;    /* 줄바꿈을 하지 않습니다. */
  overflow     : hidden;    /* 내용이 길면 감춤니다 */
  display      : block;     /* ie6이상 현재요소를 블럭처리합니다. */
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
			<div class="col-12">
				<%@ include file="../common/navbar.jsp" %>		
			</div>
		</div>
	</div>

	<div class="body" style="margin-top: 72px;">
		<div class="row">
			<div class="col-2"  style=" background-image: url('https://whale-store.pstatic.net/20191111_63/1573440818118JES0l_PNG/nightwhale_img02.png');">
				<%@ include file="../common/sidebar-admin.jsp" %>
			</div>
			<div class="col-10 mt-3" id="content-div">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-header">
								<div class="row">
									<div class="col">
										<h6>커뮤니티 리스트</h6>
									</div>
								</div>
							</div>
							<div class="card-body">
								<table class="table table-borderless text-center table-hover">
									<thead>
										<tr>
											<th>번호</th>
											<th>제목</th>
											<th>유저(등급)</th>
											<th>공개여부</th>
											<th>비밀번호</th>
											<th>개설일</th>
											<th>최근활동</th>
											<th></th>
										</tr>
									</thead>
									<tbody id="community-list">
										
									</tbody>
								</table>
							</div>
						</div>
					</div>
					
					<!--<div class="col-4">
						 커뮤니티에서 사용한 태그 조회 	
						<div class="row">
							<div class="col">
								<div class="card">
									<div class="card-header">
										<div class="row">
											<div class="col">
												<h6>태그</h6>
											</div>
											<div class="col-auto">
												<select class="custom-select custom-select-sm">
													<option>최근 등록</option>
													<option>빈도</option>
												</select>
											</div>
										</div>
									</div>
									<div class="card-body">
										<table class="table table-borderless">
											<tr>
												<td>Java</td>
												<td>일상</td>
												<td>Python</td>
												<td>C++</td>
												<td>mySQL</td>
											</tr>
											<tr>
												<td>Java</td>
												<td>일상</td>
												<td>Python</td>
												<td>C++</td>
												<td>mySQL</td>
											</tr>
										</table>
									</div>
								</div>
							</div>
						</div>-->				
						
						<!-- 커뮤니티에서 업로드한 파일 조회 	
						<div class="row">
							<div class="col">
								<div class="card">
									<div class="card-header">
										<div class="row">
											<div class="col">
												<h6>파일</h6>
											</div>
											<div class="col-auto">
												<a href="" class="button btn-light btn-sm">더 보기></a>
											</div>
										</div>
									</div>
									<div class="card-body">
										<div class="row">
											<div class="col">
												<div class="media">
													<div class="file-thumnail">
														<img src="">이미지
													</div>
													<div class="media-body">
														<h6><a href="">apple.jpg</a></h6>
														<div>
															<span>Hong</span>
															<span>업로드 시간</span>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div> 		
					</div>-->	
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript" src="/resources/jquery/jquery.min.js"></script>	
<script type="text/javascript" src="/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
communityList();
function communityList() {
	$.ajax ({
		type:"get",
		url:"/manager/commlist.do",
		success:function(result) {
			console.log(result);
			
			$.each(result, function(index, community) {
				
				var row = "";
				if (community.commuActived == 'Y') {
					row += '<tr class="text-dark font-weight-bold">'
				} else if (community.commuActived == 'N') {
					row += '<tr class="text-muted">'
				}
				row +="<td>"+community.commuNo+"</td>";
				row +="<td id='commTitle'>"+community.commuTitle+"</a></td>";
				row +="<td>"+community.userId+"("+community.guestGrade+")</td>";
				row +="<td>"+community.commuRange+"</td>";
				if (community.password == null) {
					row +="<td></td>";
				} else {
					row +="<td>"+community.password+"</td>";
				}
				row +="<td>"+community.commuRigisteredDate+"</td>";
				if (community.guestActivedDate == null) {
					row +="<td></td>";
				} else {
					row +="<td>"+community.guestActivedDate+"</td>";
				}
				if (community.commuActived == 'Y') {
					row +="<td><button class='btn btn-danger btn-sm' data-no="+community.commuNo+" data-actived='N'>정지</button></td>";
				}
				if (community.commuActived == 'N') {
					row += "<td><button class='btn btn-success btn-sm' data-no="+community.commuNo+" data-actived='Y'>활성</button></td>"
				}
				row +="</tr>";
				
				$("#community-list").append(row);
			})
		}
	})
}

$("#community-list").on("click","button", function() {
	var $button = $(this);
	console.log($button);
	
	var communityNo = $(this).data("no");
	var communityActived = $(this).attr("data-actived");
	$.ajax({
		type:"get",
		url:"/manager/changeCommActive.do",
		data : {no: communityNo, actived: communityActived},
		dataType:"json",
		success:function(result) {
			console.log(result);
			if (result.actived == 'Y') {
				$button.removeClass("btn-success").addClass("btn-danger").attr('data-actived', 'N').text("정지");
				$button.parents('tr').removeClass('text-muted').addClass('text-dark font-weight-bold');
			}
			if (result.actived == 'N') {
				$button.removeClass("btn-danger").addClass("btn-success").attr('data-actived', 'Y').text("활성");
				$button.parents('tr').removeClass('text-dark').removeClass('font-weight-bold').addClass('text-muted');
			}
		}
		
	})
})

</script>
</body>
</html>