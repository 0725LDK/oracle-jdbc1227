<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		
		//회원정보 수정시 유효성 검사
		$('#modifyMemberFormBtn').click(function()
				{
					if($('#memberName').val() == '')
					{
						alert('수정할 이름을 입력하세요');
						$('#memberName').focus();
						return;
					}
					
					$('#modifyMemberForm').submit();
					alert('회원정보 수정 성공!');
				});
	});
</script>
</head>
<body>
	<h1>회원정보 수정</h1>
	<form id="modifyMemberForm" action="${pageContext.request.contextPath}/member/modifyMember" method="post">
		<table>
			<tr>
				<td>ID : </td>
				<td><input type="text" name="memberId" value="${loginMember.memberId }" readonly="readonly"></td>
			</tr>
			<tr>
				<td>Name : </td>
				<td><input id="memberName" type="text" name="memberName"></td>
			</tr>
		</table>
		<button id="modifyMemberFormBtn" type="button">수정하기</button>
	</form>
</body>
</html>