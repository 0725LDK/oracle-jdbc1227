<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>BOARD ONE</h1>
	<table>
		<tr>
			<td>번호</td>	
			<td>제목</td>	
			<td>내용</td>	
			<td>작성자</td>	
			<td>수정일자</td>	
			<td>작성일자</td>	
		</tr>
		<tr>
			<td>${board.boardNo }</td>
			<td>${board.boardTitle }</td>
			<td>${board.boardContent }</td>
			<td>${board.memberId }</td>
			<td>${board.updatedate }</td>
			<td>${board.createdate }</td>
		</tr>
	</table>
	
	<a href="${pageContext.request.contextPath}/board/modifyBoard?boardNo=${board.boardNo}">수정</a>
	<a href="${pageContext.request.contextPath}/board/removeBoard?boardNo=${board.boardNo}">삭제</a>
	<a href="${pageContext.request.contextPath}/board/boardList">돌아가기</a>
</body>
</html>