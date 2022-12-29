<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		
		//게시글 삭제시 alert
		$('#removeBoard').click(function()
				{
					alert('게시글 삭제 성공!');
				});
	});
</script>
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
	
	<!-- 작성 아이디와 접속 아이디가 같을 경우 수정/삭제 버튼 활성화 -->
	<c:set var="BMemberId" value="${board.memberId}"></c:set>
	<c:set var="BMI" value="${ BMemberId}"></c:set>
	<c:set var="LMemberId" value="${loginMember.memberId}"></c:set>
	<c:set var="LMI" value="${ LMemberId}"></c:set>
	
	<c:if test="${BMI eq  LMI}">
		<a href="${pageContext.request.contextPath}/board/modifyBoard?boardNo=${board.boardNo}">수정</a>
		<a id="removeBoard" href="${pageContext.request.contextPath}/board/removeBoard?boardNo=${board.boardNo}">삭제</a>
	</c:if>
	<a href="${pageContext.request.contextPath}/board/boardList">돌아가기</a>
</body>
</html>