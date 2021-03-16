<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>
<!DOCTYPE html>
<html>
<body>
<br>
<br>

	<c:if test="${sessionScope.id == null}">
				
	</c:if>
			
	<c:if test="${sessionScope.id != null}">
	  	<!-- Mamba 푸터 시작 -->
	  	<footer id="footer">
	    	<div class="footer-top">
	      		<div class="container">
	        		<div class="row">
	
	          			<div class="col-lg-3 col-md-6 footer-info">
	            			<h3>성역을 지켜라</h3>
	            			<p>
		              			서울시 금천구 대한민국 <br><br>
		              			가산디지털2로 123 우)08505<br>
				              	<strong>연락처:</strong> 012-3456-7890<br>
				              	<strong>이메일:</strong> postelian@gmail.com<br>
				            </p>
	            			<div class="social-links mt-3">
								<a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
					            <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
					            <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
					            <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
					            <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
				            </div>
	          			</div>
	
	          			<div class="col-lg-2 col-md-6 footer-links">
	            			<h4>바로가기1</h4>
	           				<ul>
								<li><i class="bx bx-chevron-right"></i> <a href="#">처음으로</a></li>
					            <li><i class="bx bx-chevron-right"></i> <a href="#">기능1</a></li>
					            <li><i class="bx bx-chevron-right"></i> <a href="#">기능2</a></li>
					            <li><i class="bx bx-chevron-right"></i> <a href="#">기능3</a></li>
					            <li><i class="bx bx-chevron-right"></i> <a href="#">기능4</a></li>
	           				</ul>
	          			</div>
	
	          			<div class="col-lg-3 col-md-6 footer-links">
	            			<h4>바로가기2</h4>
	            			<ul>
	              				<li><i class="bx bx-chevron-right"></i> <a href="#">기능5</a></li>
					            <li><i class="bx bx-chevron-right"></i> <a href="#">기능6</a></li>
					            <li><i class="bx bx-chevron-right"></i> <a href="#">기능7</a></li>
					            <li><i class="bx bx-chevron-right"></i> <a href="#">기능8</a></li>
					            <li><i class="bx bx-chevron-right"></i> <a href="#">기능9</a></li>
	            			</ul>
	          			</div>
	
	          			<div class="col-lg-4 col-md-6 footer-newsletter">
	            			<h4>뉴스레터</h4>
	            			<p>구독신청 란인데, 딱히 필요 없어 보임</p>
	            			<form action="" method="post">
	              				<input type="email" name="email"><input type="submit" value="구독신청">
	            			</form>
	          			</div>
	        		</div>
	      		</div>
	    	</div>
	
			<div class="container">
		      	<div class="copyright">
		        	&copy; Copyright <strong><span>KOSMO76기 1팀</span></strong>. All Rights Reserved
		      	</div>
		      	<div class="credits">
		        	Designed by <a href="https://bootstrapmade.com/">김광회</a>
		      	</div>
			</div>
		</footer>
	  	<!-- Mamba 푸터 종료 -->
	</c:if>
	
<!-- 참고내용 -->
	<%-- <footer style = "background-color: #f7f7f7; color: black; padding: 20px;" >
		<div class = "container">
			<br>
			<div class = "row">	<!-- 12등분하기 : col-sm-합칠숫자 -->
				<div class = "col-sm-8">
					<h6>
					상호명 : OneTeam<br>
					대표이사 : 김광회<br>
					사업장주소 : 경기도 광명시 안재로1번길(하안동)<br>
					본 사이트의 콘텐츠는 저작권법의 보호를 받는 바 무단 전재, 복사, 배포 등을 금합니다.<br>
					Copyright &copy; 2021 김광회(Kim, Gwang Hoe). All rights Reserved.<br>
					</h6>
				</div>
				<div class = "col-sm-4">
					<div align = "center">
						<a href = "http://www.facebook.com" target = "_blank"><img width = "50" src = "${path}pj_images/facebook_icon.png"></a>
						<a href = "http://www.instagram.com" target = "_blank"><img width = "50" src = "${path}pj_images/instagram_icon.png"></a>
						<a href = "http://www.twitter.com" target = "_blank"><img width = "50" src = "${path}pj_images/twitter_icon.png"></a>
					</div>
				</div>
			</div>
		</div>
	</footer> --%>
</body>
</html>