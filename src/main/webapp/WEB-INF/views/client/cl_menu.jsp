<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../common/setting.jsp" %>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name = "viewport" content = "width=device-width, initial-scale=1">

<script type="text/javascript" src = "https://code.jquery.com/jquery-3.5.1.min.js">

</script>

<body>
<!-- Mamba 부트스트랩 적용 시작 -->
  	<!-- ======= Top Bar ======= 필요 없어보임 -->
  	<!-- <section id="topbar" class="d-flex align-items-center">
    	<div class="container d-flex justify-content-center justify-content-md-between">
      		<div class="contact-info d-flex align-items-center">
        		<i class="bi bi-envelope-fill"></i><a href="mailto:contact@example.com">info@example.com</a>
        		<i class="bi bi-phone-fill phone-icon"></i> +1 5589 55488 55
      		</div>
	      	<div class="social-links d-none d-md-block">
	        	<a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
	        	<a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
	        	<a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
	        	<a href="#" class="linkedin"><i class="bi bi-linkedin"></i></i></a>
	      	</div>
    	</div>
  	</section> -->

  	<!-- ======= Header ======= -->
  	<header id="header" class="d-flex align-items-center">
    	<div class="container d-flex align-items-center">

	      	<div class="logo me-auto">
	        	<h1><a href="#"><img src="${path}images/shield_logo.png" alt="" class="img-fluid"></a></h1>
	        	<!-- Uncomment below if you prefer to use an image logo -->
	        	<!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
	      	</div>
			
			<c:if test="${sessionScope.id == null}">
				<nav id="navbar" class="navbar">
					<ul>
						<li class="dropdown"><a href="#">SERVICE<span></span> <i class="bi bi-chevron-down"></i></a>
				            <ul>
				              	<li><a href="#">서비스 신청</a></li>
				              	<li><a href="#">서비스 내용</a></li>
				            </ul>
						</li>
						<li class="dropdown"><a href="#"><span>CUSTOMER SUPPORT</span> <i class="bi bi-chevron-down"></i></a>
				            <ul>
				              	<li><a href="#">FAQ</a></li>
				              	<li class="dropdown"><a href="#">고객문의</a></li>
				            </ul>
						</li>
						<li><a class="nav-link scrollto" href="#">회원가입</a></li>
						<li><a class="nav-link scrollto" href="#">로그인</a></li>
				        <li><a class="nav-link scrollto" href="http://localhost/guardSanctuary/main.do">관리자모드로</a>
						</li>
					</ul>
					<i class="bi bi-list mobile-nav-toggle"></i>
				</nav>
			</c:if>
			
			<c:if test="${sessionScope.id != null}">
		      	<nav id="navbar" class="navbar">
		        	<ul>
				        <li class="dropdown"><a href="#">SERVICE<span></span> <i class="bi bi-chevron-down"></i></a>
				            <ul>
				              	<li><a href="#">서비스 신청</a></li>
				              	<li><a href="#">서비스 내용</a></li>
				            </ul>
						</li>
				        <li class="dropdown"><a href="#"><span>CUSTOMER SUPPORT</span> <i class="bi bi-chevron-down"></i></a>
				            <ul>
				              	<li><a href="#">FAQ</a></li>
				              	<li class="dropdown"><a href="#">고객문의</a></li>
				            </ul>
						</li>
				        <li class="dropdown"><a href="#"><span>MY PAGE</span> <i class="bi bi-chevron-down"></i></a>
				            <ul>
				            	<li class="dropdown"><a href="#"><span>내정보</span> <i class="bi bi-chevron-right"></i></a>
						            <ul>
						                <li><a href="#">회원 수정</a></li>
				              			<li><a href="#">회원 탈퇴</a></li>
						            </ul>
				            	</li>
				            	<li class="dropdown"><a href="#"><span>서비스 정보</span> <i class="bi bi-chevron-right"></i></a>
						            <ul>
						                <li><a href="#">계약 정보</a></li>
				              			<li><a href="#">서비스 리포트 확인</a></li>
				              			<li><a href="#">소득증명서 출력</a></li>
						            </ul>
				            	</li>
				            </ul>
						</li>
				        <li><a class="nav-link scrollto" href="#" onclick = "document.userLogout.submit();">로그아웃</a>
				        	<form action = "logout.do" method = "post" name = "userLogout">
								<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">
							</form>
						</li>
					</ul>
					<i class="bi bi-list mobile-nav-toggle"></i>
				</nav>
				<!-- .navbar -->
			</c:if>
		</div>
	</header><!-- End Header -->
<!-- Mamba 부트스트랩 적용 종료 -->


</body>
</html>