<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인</title>
<style>
	body {
		background-image: url("${path}images/body.jpg");
	}
</style>
</head>
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
<body>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
	<div class = "container">
		<form action = "loginPro.do" method = "post" name = "loginform" onsubmit = "return loginCheck();">
			<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">
			<input type = "hidden" name = "hiddenId" value = "1">	<!-- 원리는 모르겠으나, 알아서 생성된 코드 같다. -->
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
								<input type = "submit" class = "btn btn-secondary" value = "로그인" onsubmit = "mainCheck();">&nbsp;
								<a href = "#" data-toggle="modal" data-target="#regist"><input type = "button" class = "btn btn-secondary" value = "회원가입"></a>
								<br>
								<br>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

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
						<input type = "hidden" name = "hiddenId" value = "1">
						<div align = "center">
							<br>
							<table>
								<tr>
									<td align = "right"><label for = "id"><b>아이디&nbsp;</b></label></td>
									<td>
										<input type = "text" name = "id" id = "id" size = "10">
										<input type = "button" class = "btn btn-dark" value = "중복확인"  onclick = "confirmClientId();">
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
									<td align = "right"><label for = "dept"><b>부서&nbsp;</b></label></td>
									<td>
										<input type = "text" name = "dept" id = "dept" size = "8" placeholder ="선택하세요.">	
										<select name = "dept2" onchange = "selectDeptChk();">
											<option value = "0">직접 입력</option>
											<option value = "사업부">사업부</option>
											<option value = "영업부">영업부</option>
											<option value = "재무부">재무부</option>
											<option value = "기술부">기술부</option>
										</select>
									</td>
								</tr>
								<tr>
									<td align = "right"><label for = "position"><b>직급&nbsp;</b></label></td>
									<td>
										<input type = "text" name = "position" id = "position" size = "8" placeholder ="선택하세요.">	
										<select name = "position2" onchange = "selectPositionChk();">
											<option value = "0">직접 입력</option>
											<option value = "사원">사원</option>
											<option value = "대리">대리</option>
											<option value = "과장">과장</option>
											<option value = "차장">차장</option>
											<option value = "부장">부장</option>
											<option value = "이사">이사</option>
										</select>
									</td>
								</tr>
								<tr>
									<td align = "right"><label for = "salCode"><b>호봉코드&nbsp;</b></label></td>
									<td>
										<input type = "number" name = "salCode" value = "1" min = "1" max = "7">
									</td>
								</tr>
								<tr>
									<td align = "right"><label for = "bank"><b>거래은행&nbsp;</b></label></td>
									<td>
										<input type = "text" name = "bank" placeholder = "은행명" size = "8">
									</td>
								</tr>
								<tr>
									<td align = "right"><label for = "account"><b>계좌번호</b></label></td>
									<td>
										<input type = "text" name = "account" placeholder = "'-' 제외하고 입력" size = "20">
									</td>
								</tr>
								<tr>
									<td align = "right"><label for = "hireDate"><b>입사일&nbsp;</b></label></td>
									<td>
										<input type = "date" name = "hireDate" id = "hireDate">
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
									<td align = "right"><label for = "address"><b>주소&nbsp;</b></label></td>
									<td>
										<input type = "text" name = "address" id = "address">
									</td>
								</tr>
								
								<tr>
									<td colspan = "2">
									<br>
										<div class = "button" align = "center">
											<input type = "submit" class = "btn btn-dark" value = "등록하기">
											&nbsp;&nbsp;<input class = "btn btn-secondary" type = "reset" value = "재입력">	
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

</body>
</html>