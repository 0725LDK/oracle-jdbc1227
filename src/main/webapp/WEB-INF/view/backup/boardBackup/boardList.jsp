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
		});
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
					$('#addForm').submit();
				});
		$('#seachFormBtn').click(function()
				{
					if($('#search').val() == '')
					{
						alert('검색어를 입력하세요');
						$('#search').focus();
						return;
					}
					$('#searchForm').submit();
				});
	});
</script>
</head>
<body>
	<h1>BOARD LIST</h1>
	<div>
		<a href="${pageContext.request.contextPath}/board/addBoard?memberId=${loginMember.memberId}">추가하기</a>
		<a href="${pageContext.request.contextPath}/home">홈으로</a>
		<a href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
	</div>
	<form id="pageForm" action="${pageContext.request.contextPath}/board/boardList" method="get">
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
			<th>작성자</th>
			<th>생성일자</th>
		</tr>
		<c:forEach var="b" items="${boardList}">
			<tr>
				<td>${b.boardNo}</td>
				<td><a href="${pageContext.request.contextPath}/board/boardOne?boardNo=${b.boardNo}&boardName=${b.memberId}">${b.boardTitle}</a></td>
				<td>${b.memberId}</td>
				<td>${b.createdate}</td>
			</tr>
		</c:forEach>
	</table>
	
	
	<!-- 페이징 -->
	<div>
		<c:if test="${currentPage == firstPage}">
			<span>처음으로</span>
			<span>이전</span>
		</c:if>
		<c:if test="${currentPage != firstPage}">
			<a href="${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=${firstPage}">처음으로</a>
			<a href="${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=${currentPage-1}">이전</a>
		</c:if>
		<span>[ ${currentPage} ]</span>
		<c:if test="${currentPage == lastPage}">
			<span>다음</span>
			<span>마지막으로</span>
		</c:if>
		<c:if test="${currentPage != lastPage}">
			<a href="${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=${currentPage+1}">다음</a>
			<a href="${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=${lastPage}">마지막으로</a>
		</c:if>
	</div>
	
	<div>
		<form id="searchForm" action="${pageContext.request.contextPath}/board/boardList" method="get">
			<span>검색단어 : </span>
			<span><input id="search" type="text" name="search"></span>
			<button id="seachFormBtn" type="button">검색</button>			
		</form>
	
	</div>
	
	
</body>
</html>