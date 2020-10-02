<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse text-left" style="background-image: url('https://whale-store.pstatic.net/20191111_63/1573440818118JES0l_PNG/nightwhale_img02.png'); height: 1000px;" >
	<div class="sidebar-sticky pt-3" >
		<ul class="nav flex-column mt-3" style="width: 250px;">
		  <c:forEach var="category" items="${categories }">
		  
		  <li class="nav-item mt-4">
            <a data-tag-no="" class="nav-link text-white navbar-toggler" href="#"  data-toggle="collapse" data-target="#navbarToggleExternalContent-${category.no }" aria-controls="navbarToggleExternalContent-${category.no }" aria-expanded="false" aria-label="Toggle navigation">
              <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true" focusable="false" width="24px" height="24px" style="-ms-transform: rotate(360deg); -webkit-transform: rotate(360deg); transform: rotate(360deg);" preserveAspectRatio="xMidYMid meet" viewBox="0 0 24 24"><g fill="white" stroke="#626262" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"/><path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"/></g></svg>
              <span class="ml-2 font-weight-bold" style="font-size: 18px;">${category.name }</span>
            </a>
            <div class="collapse" id="navbarToggleExternalContent-${category.no }">
			    <div class="bg-white p-4">
			      <c:forEach var="tag" items="${category.catTags }">
				      <a href="#" data-tag-no="${tag.tagNo }"><span class="text-secondary" style="font-size: 13px;"># ${tag.tagName }</span></a>
				      <hr>
			      </c:forEach>
			    </div>
			 </div>
            
          </li>
		  </c:forEach>
		  
		  <li class="nav-item mt-4">
            <a class="nav-link active main" href="#">
            	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-activity"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path><polyline points="9 22 9 12 15 12 15 22"></polyline></svg>
				<span class="ml-2 font-weight-bold" style="font-size: 18px;">메인</span>
            </a>
          </li>
     	  <li class="nav-item mt-4">
            <a class="nav-link text-muted" href="#">
            	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-activity"><path d="M2 16.1A5 5 0 0 1 5.9 20M2 12.05A9 9 0 0 1 9.95 20M2 8V6a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2h-6"></path><line fill="white" x1="2" y1="20" x2="2" y2="20"></line></svg>
				<span class="ml-2 font-weight-bold" style="font-size: 18px;">커뮤니티</span>
            </a>
          </li>
		</ul>
	</div>
</nav>

