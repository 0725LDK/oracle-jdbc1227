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
		$('#rowPerPage').change(function() {
			$('#pageForm').submit();
			alert('change');
		})
		//게시글 추가시 유효성 검사
		$('#BoardAddBtn').click(function()
				{
					if($('#boardTitle').val() == '')
						{
							alert('글 제목을 입력하세요');
							$('#boardTitle').focus();
							return;
						}
					if($('#boardContent').val() == '')
					{
						alert('글 내용을 입력하세요');
						$('#boardContent').focus();
						return;
					}
					$(location).attr('href', '${pageContext.request.contextPath}/BoardAddActionController');
				});
	});
</script>
</head>
<body>
	<h1>BOARD LIST</h1>
	<form id="pageForm" action="${pageContext.request.contextPath}/BoardListController" method="get">
		<select name="rowPerPage" id="rowPerPage">
			<c:if test="${rowPerPage == 10}">
				<option value="10" selected="selected">10</option>
				<option value="20">20</option>
				<option value="30">30</option>
			</c:if>
			<c:if test="${rowPerPage == 20}">
				<option value="10">10</option>
				<option value="20" selected="selected">20</option>
				<option value="30">30</option>
			</c:if>
			<c:if test="${rowPerPage == 30}">
				<option value="10">10</option>
				<option value="20">20</option>
				<option value="30" selected="selected">30</option>
			</c:if>
		</select>
	</form>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>생성일자</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<c:forEach var="b" items="${boardList}">
			<tr>
				<td>${b.boardNo}</td>
				<td><a href="${pageContext.request.contextPath}/BoardOneActionController?boardNo=${b.boardNo}">${b.boardTitle}</a></td>
				<td>${b.createdate}</td>
				<td><a href="${pageContext.request.contextPath}/BoardUpdateFormController?boardNo=${b.boardNo}">수정</a></td>
				<td><a href="${pageContext.request.contextPath}/BoardDeleteActionController?boardNo=${b.boardNo}">삭제</a></td>
			</tr>
		
		</c:forEach>
	</table>
	
	<div>
		<a href="${pageContext.request.contextPath}/BoardListController?rowPerPage=${rowPerPage}&currentPage=${currentPage-1}">이전</a>
		<a href="${pageContext.request.contextPath}/BoardListController?rowPerPage=${rowPerPage}&currentPage=${currentPage+1}">다음</a>
	</div>
	
	<h1>BOARD ADD</h1>
	<form action="${pageContext.request.contextPath}/BoardAddActionController" method="post">
		<table>
			<tr>
				<td>글 제목</td>
				<td><input type="text" name="boardTitle" id="boardTitle"></td>
			</tr>
			<tr>
				<td>글 내용</td>
				<td><input type="text" name="boardContent" id="boardContent"></td>
			</tr>
		</table>
		<button id="BoardAddBtn" type="submit">작성하기</button>
	</form>
	
</body>
</html>