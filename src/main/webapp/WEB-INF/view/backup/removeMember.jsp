<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		
		//회원탈퇴시 유효성 검사
		$('#removeMemberBtn').click(function()
				{
					if($('#memberPw').val() == '')
					{
						alert('비밀번호를 입력하세요');
						$('#memberPw').focus();
						return;
					}
					$('#removeMemberForm').submit();
					alert('회원정보 탈퇴 성공!');
				});
	});
</script>
</head>
<body>
	<h1>회원탈퇴</h1>
	<form id="removeMemberForm" action="${pageContext.request.contextPath}/member/removeMember" method="post">
		<table>
			<tr>
				<td>ID : </td>
				<td><input type="text" name="memberId" value="${loginMember.memberId }" readonly="readonly"></td>
			</tr>
			<tr>
				<td>PW : </td>
				<td><input id="memberPw" type="password" name="memberPw"></td>
			</tr>
		</table>
		<button id="removeMemberBtn" type="button">회원탈퇴</button>
	</form>
</body>
</html>