<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원정보 보기</h1>
	<table>
		<tr>
			<td>ID : </td>
			<td>${loginMember.memberId }</td>
		</tr>
		<tr>
			<td>Name : </td>
			<td>${loginMember.memberName }</td>
		</tr>
	</table>
	<a href="${pageContext.request.contextPath}/member/modifyMember">회원정보 수정</a>
	<a href="${pageContext.request.contextPath}/member/removeMember">회원 탈퇴</a>
	<a href="${pageContext.request.contextPath}/home">홈으로</a>
</body>
</html>