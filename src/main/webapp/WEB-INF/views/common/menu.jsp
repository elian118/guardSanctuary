<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>
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
				        <li><a class="nav-link scrollto" href="http://localhost/guardSanctuary/cl_main.do">일반모드로</a>
						</li>
					</ul>
					<i class="bi bi-list mobile-nav-toggle"></i>
				</nav>
			</c:if>
			
			<c:if test="${sessionScope.id != null}">
		      	<nav id="navbar" class="navbar">
		        	<ul>
						<li><a class="nav-link scrollto active" href="#">홈</a></li>
				        <li><a class="nav-link scrollto" href="#">대메뉴1</a></li>
				        <li><a class="nav-link scrollto" href="#">대메뉴2</a></li>
				        <li><a class="nav-link scrollto" href="#">대메뉴3</a></li>
				        <li><a class="nav-link scrollto" href="#">대메뉴4</a></li>
				        <li class="dropdown"><a href="#"><span>대메뉴5</span> <i class="bi bi-chevron-down"></i></a>
				            <ul>
				              	<li><a href="#">중메뉴1</a></li>
				              	<li class="dropdown"><a href="#"><span>중메뉴2</span> <i class="bi bi-chevron-right"></i></a>
						            <ul>
						                <li><a href="#">소메뉴1</a></li>
						                <li><a href="#">소메뉴2</a></li>
						                <li><a href="#">소메뉴3</a></li>
						                <li><a href="#">소메뉴4</a></li>
						                <li><a href="#">소메뉴5</a></li>
						            </ul>
				            	</li>
				              	<li><a href="#">중메뉴3</a></li>
				              	<li><a href="#">중메뉴4</a></li>
				              	<li><a href="#">중메뉴5</a></li>
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

<!-- 아래는 참고용 -->
	<!-- <nav class="navbar navbar-expand-md bg-info navbar-dark fixed-top">
	Brand
	<a class="navbar-brand" href="./main.do">Home</a>
	
	Toggler/collapsibe Button
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
	  <span class="navbar-toggler-icon"></span>
	</button>
	
	Navbar links
	<div class="collapse navbar-collapse" id="collapsibleNavbar">
	    <ul class="navbar-nav">
			<li class="nav-item">
				<a class="nav-link" id = "news" href="#">Menu1</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" id = "news" href="#">Menu2</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" id = "news" href="#">Menu3</a>
			</li>
			<li>
				<a class="nav-link" id = "news" href="#">Menu4</a>
			</li>
			<li>
				<a class="nav-link" id = "news" href="#">Menu5</a>
			</li>
	    </ul>
  	</div>
	
	<div class="navbar-nav ml-auto">
	    <ul class="nav navbar-nav">
			<li class = "dropdown">	아래쪽으로 리스트가 추가되어 나옴
				<a href = "#" class = "nav-link dropdown-toggle" data-toggle = "dropdown" id = "navbardrop">접속하기<span class = "caret"></span></a>
				caret : 아래 화살표 클릭시 아이콘이 나오도록 함
				<div class = "dropdown-menu">
					<input type="button" class="btn dropdown-item" data-toggle="modal" data-target="#login-section" value = "로그인">
					<input type="button" class="btn dropdown-item" data-toggle="modal" data-target="#regist" value = "회원가입">
				</div>
			</li>
	    </ul>
  	</div>
</nav>
 -->
<c:if test = "${selectCnt == -1}">
	<script type = "text/javascript">
		alert("* 비밀번호를 확인해주세요!! *");	
	</script>
</c:if>
<c:if test = "${selectCnt == 0}">
	<script type = "text/javascript">
		alert("* 존재하지 않는 ID입니다!! *");
	</script>
</c:if>
<c:if test = "${insertCnt == 1}">
	<script type = "text/javascript">
		alert("* 회원가입에 성공했습니다. 로그인하세요!! *");
	</script>
</c:if>

</body>
</html>