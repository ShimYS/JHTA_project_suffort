<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <script type="text/javascript" src="/resources/jquery/jquery.min.js"></script>
<!-- 
	!!!! 사용 전 필독 !!!!
	
	1. 중간중간 padding-top, ml, pl 이런 간격 조정하는 클래스, 스타일 같은 것들이 들어가 있습니다.
	   그림 파일이 바뀌거나 다른 조정사항이 있으면 바뀌는거 보고 수동으로 간격 맞춰주셔야 합니다.
	   
	2. 메뉴 드랍박스 부분에서 로그인여부에 따라서 a태그 표시 바뀌는거 만들어주세요.
	
	3. 가운데 있는 col-5 div (아이디 : nav-div-searchbar) 부분은 'home.jsp에서는 $(function() { $("#nav-div-searchbar").hide(); }); 넣어서 감춰주세요.
	
	@Author 민석
-->
<!-- fixed-top -->
<nav class="navbar navbar-expand-sm navbar-light fixed-top"  style="box-shadow:0px 7px 7px black; background-image: url('https://whale-store.pstatic.net/20191111_63/1573440818118JES0l_PNG/nightwhale_img02.png');" >
	<div class="d-flex justify-content-between w-100 row">
		<div class="col-3 pl-5">
			<a class="navbar-brand" href="/home.do">
		 		<img src="/resources/img/suffort_logo.png" alt="Logo" style="width:100px; margin-top:20px">
			</a>
		</div>
		 
		<div id="nav-div-searchbar" class="col-5">
			<form style="width: 100%; padding-top: 5px;" class="form-inline d-flex justify-content-center" method="get" action="/search.do">
				<div class="input-group" style="width: 60%; padding-top:10px">
					<input type="text" class="form-control" name="keyword" placeholder="Search With Title">
			     	<div class="input-group-prepend">
			       		<button class="input-group-text btn btn-sm btn-primary">↲</button>
			     	</div>
		   		</div>
			</form>
		</div> 
		
		<div class="col-3 d-flex justify-content-end " style="padding-top:5px">
			<div class="pt-3 text-white">
				<c:choose>
					<c:when test="${not empty LOGIN_COMPANY }">
						${LOGIN_COMPANY.name }님 환영합니다.					
					</c:when>
					<c:when test="${not empty LOGIN_USERS }">
						${LOGIN_USERS.name }님 환영합니다.					
					</c:when>
				</c:choose>
			</div>&emsp;
			<ul class="navbar-nav">
		   		<li class="nav-item dropdown">
		     		<a class="nav-link dropdown-toggle pt-3 pr-3 text-white" href="#" id="navbardrop" data-toggle="dropdown">MENU</a>
		     		<div class="dropdown-menu">
		     			<c:if test="${LOGIN_TYPE ne 'company' }">
				       		<a class="dropdown-item" href="/community/main.do">Community</a>
		     			</c:if>
				       	
				       	<a class="dropdown-item" href="/board/userTotalBoard.do">All List</a>
			       		<c:if test="${not empty LOGIN_USERS }">
				       	<c:choose>
				       		<c:when test="${(LOGIN_TYPE eq 'naver') or (LOGIN_TYPE eq 'user') }">
						       	<a class="dropdown-item" href="/board/userMyPage.do">My List</a>
				       		
				       		</c:when>
				       		<c:when test="${LOGIN_TYPE eq 'company' }">
						       	<a class="dropdown-item" href="/board/compMyPage.do?companyNo=${LOGIN_USERS.no }">My List</a>
				       		
				       		</c:when>
				       		<c:when test="${LOGIN_TYPE eq 'admin' }">
						       	<a class="dropdown-item" href="/manager/adminboardlist.do">ADMIN</a>
				       		
				       		</c:when>
				       	</c:choose>
			       		</c:if>
		<!-- !!! 로그인 여부에 따라 바뀌는곳 여기 !!! -->
						<c:choose>
							<c:when test="${not empty LOGIN_COMPANY or not empty LOGIN_USERS }">
								<c:choose>
									<c:when test="${not empty LOGIN_COMPANY }">
						      			<a class="dropdown-item" href="/user/logout.do">Log-out</a>
									
									</c:when>
									<c:when test="${not empty LOGIN_USERS }">
									
						      			<a class="dropdown-item" id="logout" href="/logout.do">Log-out</a>
									</c:when>
								</c:choose>
							</c:when>
							<c:otherwise>
				       			<a class="dropdown-item" href="/user/totallogin.do">Log-in</a>
							</c:otherwise>
						</c:choose>
		     		</div>
		   		</li>
		   		<li class="nav-item">
		   			
		   			<c:choose>
				       		<c:when test="${(LOGIN_TYPE eq 'naver') or (LOGIN_TYPE eq 'user') }">
					     		<a class="nav-link" href="/board/userMyPage.do">
					  				<img class="" src="/resources/img/user_icon_2_white.png" alt="Logo" style="width:40px;">
					  			</a>
		  				   </c:when>
		  				   <c:when test="${LOGIN_TYPE eq 'company' }">
		  				   		<a class="nav-link" href="/board/compMyPage.do?companyNo=${LOGIN_USERS.no }">
					  				<img class="" src="/resources/img/user_icon_2_white.png" alt="Logo" style="width:40px;">
					  			</a>
		  				   </c:when>
		  				   <c:otherwise>
			  				   <a class="nav-link" href="#">
					  				<img class="" src="/resources/img/user_icon_2_white.png" alt="Logo" style="width:40px;">
					  		   </a>
		  				   </c:otherwise>
		  			</c:choose>
		   		</li>
		 	</ul>
		</div> 
	</div>
</nav>
<script type="text/javascript">
$(function(){
	$("#logout").click(function(){
		confirm("로그아웃되었습니다.");
	})
	
})

</script>