<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		
		//회원가입시 유효성 검사
		$('#addMemberFormBtn').click(function()
				{
					if($('#memberId').val() == '')
					{
						alert('ID를 입력하세요');
						$('#memberId').focus();
						return;
					}
					if($('#memberPw').val() == '')
					{
						alert('PW를 입력하세요');
						$('#memberPw').focus();
						return;
					}
					
					if($('#memberName').val() == '')
					{
						alert('이름을 입력하세요');
						$('#memberName').focus();
						return;
					}
					
					$('#addMemberForm').submit();
					alert('회원가입 성공! 로그인 하세요');
				});
	});
</script>
</head>
<body>
	<h1>회원가입</h1>
	<form id="addMemberForm" action="${pageContext.request.contextPath}/member/addMember" method="post">
		<table>
			<tr>
				<td>ID : </td>
				<td><input id="memberId" type="text" name="memberId"></td>
			</tr>
			<tr>
				<td>PW : </td>
				<td><input id="memberPw" type="password" name="memberPw"></td>
			</tr>
			<tr>
				<td>NAME : </td>
				<td><input id="memberName" type="text" name="memberName"></td>
			</tr>
		</table>
		<button id="addMemberFormBtn" type="button">회원가입</button>
	</form>
</body>
</html>