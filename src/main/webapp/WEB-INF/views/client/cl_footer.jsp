<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../common/setting.jsp" %>
<!DOCTYPE html>
<html>
<body>
<br>
<br>
	<c:if test="${sessionScope.id == null}">
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
	            			<h4>SERVICE</h4>
	           				<ul>
								<li><i class="bx bx-chevron-right"></i> <a href="#">서비스 신청</a></li>
					            <li><i class="bx bx-chevron-right"></i> <a href="#">서비스 내용</a></li>
	           				</ul>
	           				<br>
	           				<h4>CUSTOMER SUPPORT</h4>
	            			<ul>
	              				<li><i class="bx bx-chevron-right"></i> <a href="#">FAQ</a></li>
					            <li><i class="bx bx-chevron-right"></i> <a href="#">고객 문의</a></li>
	            			</ul>
	          			</div>
	
	          			<div class="col-lg-3 col-md-6 footer-links">
	            			<h4>회원가입</h4>
	            			<br>
	            			<h4>로그인</h4>
	          			</div>
	
	          			<div class="col-lg-4 col-md-6 footer-newsletter">
	            			<form action="" method="post">
	              				<input type="email" name="email"><input type="submit" value="검색">
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
		        	Designed by <a href="https://bootstrapmade.com/">KOSMO76기 1팀</a>
		      	</div>
			</div>
		</footer>
	  	<!-- Mamba 푸터 종료 -->
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
	            			<h4>SERVICE</h4>
	           				<ul>
								<li><i class="bx bx-chevron-right"></i> <a href="#">서비스 신청</a></li>
					            <li><i class="bx bx-chevron-right"></i> <a href="#">서비스 내용</a></li>
	           				</ul>
	           				<br>
	           				<h4>CUSTOMER SUPPORT</h4>
	            			<ul>
	              				<li><i class="bx bx-chevron-right"></i> <a href="#">FAQ</a></li>
					            <li><i class="bx bx-chevron-right"></i> <a href="#">고객 문의</a></li>
	            			</ul>
	          			</div>
	
	          			<div class="col-lg-3 col-md-6 footer-links">
	            			<h4>MY PAGE</h4>
	            			<ul>
	              				<li><i class="bx bx-chevron-right"></i> <a href="#">내정보</a></li>
					            <li><i class="bx bx-chevron-right"></i> <a href="#">서비스 정보</a></li>
	            			</ul>
	          			</div>
	
	          			<div class="col-lg-4 col-md-6 footer-newsletter">
	            			<form action="" method="post">
	              				<input type="email" name="email"><input type="submit" value="검색">
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
		        	Designed by <a href="https://bootstrapmade.com/">KOSMO76기 1팀</a>
		      	</div>
			</div>
		</footer>
	  	<!-- Mamba 푸터 종료 -->
	</c:if>
	
</body>
</html>