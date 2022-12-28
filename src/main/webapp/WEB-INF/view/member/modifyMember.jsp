<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원정보 수정</h1>
	<form action="${pageContext.request.contextPath}/member/modifyMember" method="post">
		<table>
			<tr>
				<td>ID : </td>
				<td><input type="text" name="memberId" value="${loginMember.memberId }" readonly="readonly"></td>
			</tr>
			<tr>
				<td>Name : </td>
				<td><input type="text" name="memberName"></td>
			</tr>
		</table>
		<button type="submit">수정하기</button>
	</form>
</body>
</html>