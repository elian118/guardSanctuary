<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 성공</title>
</head>
<body>
<%@ include file = "menu.jsp" %>
	<c:if test = "${errMsg != null}">
		<script type="text/javascript">
			alert("${errMsg}");
			window.location = "main.do";
		</script>
	</c:if>
	<div class = "container">
		<br>
		<br>
		<br>
		<br>
		내용
	</div>
<%@ include file = "footer.jsp" %>
</body>
</html>