<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>BOARD UPDATE</h1>
	<form action="${pageContext.request.contextPath}/BoardUpdateActionController" method="post">
		<table>
			<tr>
				<td>번호</td>
				<td><input type="text" name="boardNo" value="${boardNo}" readonly="readonly"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="boardTitle"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><input type="text" name="boardContent"></td>
			</tr>
		</table>
		<button type="submit">수정하기</button>
	</form>
</body>
</html>