<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입</h1>
	<form action="${pageContext.request.contextPath}/member/addMember" method="post">
		<table>
			<tr>
				<td>ID : </td>
				<td><input type="text" name="memberId"></td>
			</tr>
			<tr>
				<td>PW : </td>
				<td><input type="password" name="memberPw"></td>
			</tr>
			<tr>
				<td>NAME : </td>
				<td><input type="text" name="memberName"></td>
			</tr>
		</table>
		<button type="submit">회원가입</button>
	</form>
</body>
</html>