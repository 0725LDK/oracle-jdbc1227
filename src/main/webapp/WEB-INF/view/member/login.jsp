<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		
		//로그인시 유효성 검사
		$('#loginFormBtn').click(function()
				{
					if($('#memberId').val() == '')
					{
						alert('아이디를 입력하세요');
						$('#memberId').focus();
						return;
					}
					if($('#memberPw').val() == '')
					{
						alert('비밀번호를 입력하세요');
						$('#memberPw').focus();
						return;
					}
					$('#loginForm').submit();
				});
	});
</script>

</head>
<body>
	<h1>로그인</h1>
	<form id="loginForm" action="${pageContext.request.contextPath}/member/login" method="post">
		<table>
			<tr>
				<td>ID : </td>
				<td><input id="memberId" type="text" name="memberId"></td>
			</tr>
			<tr>
				<td>PW : </td>
				<td><input id="memberPw" type="password" name="memberPw"></td>
			</tr>
		</table>
		<button id="loginFormBtn" type="button">로그인</button>
	</form>
	
</body>
</html>