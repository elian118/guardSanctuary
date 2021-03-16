<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../common/setting.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<!-- 가입실패 -->
	<c:if test = "${insertCnt == 0}">
		<script type = "text/javascript">
			errorAlert(insertError);
			history.back();
		</script>
	</c:if>

	<!-- 가입 성공 -->
	<c:if test = "${insertCnt != 0}">
		<script type = "text/javascript">
			alert("가입되었습니다.\n로그인 전에 이메일 인증하세요");
		</script>
		<c:redirect url = "mainSuccess.do?insertCnt=${insertCnt}" />
	</c:if>
</body>
</html>