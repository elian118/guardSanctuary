<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
<!-- The Modal : 로그인 -->
<div class= "container">
	<div class="modal fade" id="login-section">
		<div class="modal-dialog">
			<div class="modal-content">
	    
	    	<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">로그인</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			
			<!-- Modal body -->
			<div class="modal-body" class = "box01">
				<form action = "loginPro.do" method = "post" name = "loginform" onsubmit = "return loginCheck();">
					<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">
					<div align = "center">
						<br>
						<br>
						<table>
							<tr>
								<td align = "right" style = "vertical-align: middle;"><label for = "id"><b>아이디&nbsp;</b></label></td>
								<td>
									<input class = "form-control" type = "text" name = "id" id = "input_id">					
								</td>
							</tr>
							<tr>
								<td align = "right" style = "vertical-align: middle;"><label for = "pwd"><b>비밀번호&nbsp;</b></label></td>
								<td>
									<input class = "form-control" type = "password" name = "pwd" id = "input_pwd">					
								</td>
							</tr>
							<tr>
								<td colspan = "2" align = "center">
									<input id = "check_remember" type = "checkbox"><label for = "check_remember">&nbsp;ID 기억하기</label>
								</td>
								
							</tr>
							
							<tr>
								<td colspan = "2">
								<br>
									<div class = "button" align = "center">
										<input type = "submit"  class = "btn btn-info" value = "로그인" onsubmit = "mainCheck();">&nbsp;
									<a href = "#" data-toggle="modal" data-target="#regist"><input type = "button" class = "btn btn-info" value = "회원가입"></a>
										<br>
										<br>
									</div>
								</td>
							</tr>
						</table>
					</div>
				</form>
			</div>
	
			<!-- Modal footer -->
	    	<div class="modal-footer">
	      		<button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
	      	</div>
	      
	   		</div>
		</div>
	</div>
</div>
<!-- 모달 종료 : 로그인 -->

<!-- The Modal : 회원가입 -->
<div class= "container">
	<div class="modal fade" id="regist">
		<div class="modal-dialog">
			<div class="modal-content">
	    
	    	<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">회원 가입</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			
			<!-- Modal body -->
			<div class="modal-body">
				<div align = "center">
					<form action = "signInAction.do" method = "post" name = "signInform" onsubmit = "return signInCheck();">
						<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">
						<input type = "hidden" name = "hiddenId" value = "0">	<!-- 원리는 모르겠으나, 알아서 생성된 코드 같다. -->
						<div align = "center">
							<br>
							<table>
								<tr>
									<td align = "right"><label for = "id"><b>아이디&nbsp;</b></label></td>
									<td>
										<input type = "text" name = "id" id = "id" size = "10">
										<input type = "button" class = "btn btn-dark" value = "중복확인"  onclick = "confirmId();">
									</td>
								</tr>
								<tr>
									<td align = "right"><label for = "pwd"><b>비밀번호&nbsp;</b></label></td>
									<td>
										<input type = "password" name = "pwd">					
									</td>
								</tr>
								<tr>
									<td align = "right"><label for = "rePwd"><b>비밀번호 확인&nbsp;</b></label></td>
									<td>
										<input type = "password" name = "rePwd" id = "rePwd">					
									</td>
								</tr>
								<tr>
									<td align = "right"><label for = "name"><b>이름&nbsp;</b></label></td>
									<td>
										<input type = "text" name = "name" id = "name">					
									</td>
								</tr>
								<tr>
									<td align = "right"><label for = "birth"><b>생년월일&nbsp;</b></label></td>
									<td>
										<input type = "date" name = "birth" id = "birth">
									</td>
								</tr>
								<tr>
									<td align = "right"><label for = "hp1"><b>연락처&nbsp;</b></label></td>
									<td>
										<input type = "text" id = "hp1" name = "hp1" onkeyup = "nextHp1();" size = "3" maxlength = "3">
										-
										<input type = "text" id = "hp2" name = "hp2" onkeyup = "nextHp2();" size = "4" maxlength = "4">
										-
										<input type = "text" id = "hp3" name = "hp3" onkeyup = "nextHp3();" size = "4" maxlength = "4">					
									</td>
								</tr>
								<tr>
									<td align = "right"><label for = "email1"><b>이메일&nbsp;</b></label></td>
									<td>
										<input type = "text" name = "email1" id = "email1" size = "5">
										@
										<input type = "text" name = "email2" id = "email2" size = "8">	
										<select name = "email3" onchange = "selectEmailChk();">
											<option value = "0">직접 입력</option>
											<option value = "naver.com">네이버</option>
											<option value = "google.com">구글</option>
											<option value = "daum.net">다음</option>
											<option value = "kakao.com">카카오</option>
											<option value = "nate.com">네이트</option>
										</select>
									</td>
								</tr>
								<tr>
									<td align = "right"><label for = "zipcode"><b>우편번호&nbsp;</b></label></td>
									<td>
										<input type = "text" name = "zipcode" id = "zipcode" size = "5" onkeyup = "nextAddress();">&nbsp; 
										<input type = "button" class = "btn btn-dark" value = "우편번호 찾기">
									</td>
								</tr>
								<tr>
									<td align = "right"><label for = "address"><b>상세 주소&nbsp;</b></label></td>
									<td>
										<input type = "text" name = "address" id = "address">					
									</td>
								</tr>
								
								<tr>
									<td colspan = "2">
									<br>
										<div class = "button" align = "center">
											<input type = "submit" class = "btn btn-info" value = "회원 가입">
											&nbsp;&nbsp;<input class = "btn btn-info" type = "reset" value = "다시 입력">	
										</div>
										<br>
									</td>
								</tr>
							</table>
						</div>
					</form>
				</div>
			</div>
	
			<!-- Modal footer -->
	    	<div class="modal-footer">
	      		<button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
	      	</div>
	      
	   		</div>
		</div>
	</div>
</div>
<!-- 모달 종료 : 회원가입 -->

<!-- The Modal : 회원탈퇴 -->
<div class= "container">
	<div class="modal fade" id="withdrawl-section">
		<div class="modal-dialog">
			<div class="modal-content">
	    
	    	<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">회원 탈퇴</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			
			<!-- Modal body -->
			<div class="modal-body" class = "box01">
				<p>탈퇴하시려면 비밀번호를 입력하세요.</p>
				<form action = "deleteClientAction.cl" method = "post" name = "passwdform" onsubmit = "return passwdCheck();">
					<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">
					<div align = "center">
						<br>
						<table>
							<tr>
								<td align = "right"><label for = "pwd"><b>비밀번호&nbsp;</b></label></td>
								<td>
									<input type = "password" name = "pwd" id = "del_pwd">					
								</td>
							</tr>
							<tr>
								<td colspan = "2" align = "center">
									<br><br>
									<input type = "submit"  class = "btn btn-info" value = "회원 탈퇴">&nbsp;
									<input type = "reset"  class = "btn btn-info" value = "재입력">
								</td>
						</table>
						<br>
					</div>
				</form>
			</div>
	
			<!-- Modal footer -->
	    	<div class="modal-footer">
	      		<button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
	      	</div>
	      
	   		</div>
		</div>
	</div>
</div>
<!-- 모달 종료 : 회원 탈퇴 -->

<!-- The Modal : 회원 정보 수정 인증 -->
<div class= "container">
	<div class="modal fade" id="modify-section">
		<div class="modal-dialog">
			<div class="modal-content">
	    
	    	<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">내 정보 보기</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			
			<!-- Modal body -->
			<div class="modal-body" class = "box01">
				<p>확인하려면 비밀번호를 입력하세요.</p>
				<form action = "modifyViewAction.cl" method = "post" name = "mod_passwdform" onsubmit = "return modPasswdCheck();">
					<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">
					<div align = "center">
						<br>
						<table>
							<tr>
								<td align = "right"><label for = "pwd"><b>비밀번호&nbsp;</b></label></td>
								<td>
									<input type = "password" name = "pwd" id = "pwd">					
								</td>
							</tr>
							<tr>
								<td colspan = "2" align = "center">
									<br><br>
									<input type = "submit"  class = "btn btn-info" value = "인증하기">&nbsp;
									<input type = "reset"  class = "btn btn-info" value = "재입력">
								</td>
						</table>
						<br>
					</div>
				</form>
			</div>
	
			<!-- Modal footer -->
	    	<div class="modal-footer">
	      		<button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
	      	</div>
	      
	   		</div>
		</div>
	</div>
</div>
<!-- 모달 종료 : 회원정보 수정 인증 -->

<!-- 모달 : 회원정보 수정 처리 = > modifyViewAction.do로 이양 -->

<!-- 이중 모달 : 우편번호 -->
<div class= "container">
	<div class="modal fade" id="zipcode">
		<div class="modal-dialog">
			<div class="modal-content">
	    
	    	<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">우편번호 찾기</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			
			<!-- Modal body -->
			<div class="modal-body" align = "center">
				<form action = "" name = "myForm" method = "post">
					<br>
					<select name = "city" onchange = "select_city();">
						<option value = "">도시를 선택하세요.</option>
						<option value = "서울">서울</option>
						<option value = "인천">인천</option>
					</select>
					<select name = "gu" onchange = "select_gu();">
						<option value = "">구를 선택하세요.</option>
					</select>
					<br>
					<br>
					<div align = "center">
					<iframe width = "380" height = "200" style = "border-bottom: 1px solid black"></iframe>
					<table style = "border-bottom: 1px solid black">
						<tr>
							<td width = "380"></td>
						</tr>
						<tr>
							<td width = "380"></td>
						</tr>
						<tr>
							<td width = "380"></td>
						</tr>
						<tr>
							<td width = "380"></td>
						</tr>
						<tr>
							<td width = "380"></td>
						</tr>
					</table>
					</div>
					<div align = "center" class = "button" >
						<br>
						<input type = "submit" value = "제출" class = "btn btn-info" onclick = "window.close();">
						<br>
						<br>
					</div>
				</form>
			</div>
			
			<!-- Modal footer -->
	    	<div class="modal-footer">
	      		<button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
	      	</div>
	      	
	      	</div>
		</div>
	</div>
</div>
<!-- 이중 모달 : 우편번호 종료 -->

</body>
</html>