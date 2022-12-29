<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html
  lang="en"
  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="<%=request.getContextPath()%>/resource/assets/"
  data-template="vertical-menu-template-free"
>
<head>
	<jsp:include page="/inc/HTMLHead.jsp"></jsp:include>	
	<script>
		$(document).ready(function() {
			$('#rowPerPage').change(function() {
				$('#pageForm').submit();
				alert('change');
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
	<meta charset="UTF-8">
	<title>BOARD LIST</title>
</head>
	
<body>
	<div class="container-xxl flex-grow-1 container-p-y">
		<h1>BOARD LIST</h1>
		<span>
			<a class="btn rounded-pill btn-primary" href="${pageContext.request.contextPath}/board/addBoard?memberId=${loginMember.memberId}">Add Board</a>
			<a class="btn rounded-pill btn-primary" href="${pageContext.request.contextPath}/home">Go Home</a>
			<a class="btn rounded-pill btn-primary" href="${pageContext.request.contextPath}/member/logout">Logout</a>
		</span>
		<br><br>
		<!-- Hoverable Table rows -->
			<div class="card">
				<h5 class="card-header">Board List</h5>
				<span style="text-align:right">
					<form id="searchForm" action="${pageContext.request.contextPath}/board/boardList" method="get">
						<span><input id="search" type="text" name="search" placeholder="Search Word"></span>
						<button id="seachFormBtn" type="button" class="btn rounded-pill btn-outline-primary">Search</button>			
					</form>
				</span>
			
			<div class="table-responsive text-nowrap">
				<table class="table table-hover">
					<thead>
						<tr>
							<th style="font-size : 15px;">Number</th>
							<th style="font-size : 15px;">Title</th>
							<th style="font-size : 15px;">User</th>
							<th style="font-size : 15px;">Update Date</th>
							<th style="font-size : 15px;">Create Date</th>
						</tr>
					</thead>
					<c:forEach var="b" items="${boardList}">
						<tbody class="table-border-bottom-0">
							<tr>
								<td>${b.boardNo}</td>
								<td><a href="${pageContext.request.contextPath}/board/boardOne?boardNo=${b.boardNo}&boardName=${b.memberId}">${b.boardTitle}</a></td>
								<td>${b.memberId}</td>
								<td>${b.updatedate}</td>
								<td>${b.createdate}</td>
							</tr>
						</tbody>
					</c:forEach>
					<tfoot>
						<tr>
							<td colspan="5" style="text-align:center">
								<!-- 페이징 -->
								<c:if test="${currentPage == firstPage}">
									<span>&lt;&lt; &nbsp; &nbsp;</span>
									<span>&lt; &nbsp; &nbsp;</span>
								</c:if>
								<c:if test="${currentPage != firstPage}">
									<a href="${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=${firstPage}">&lt;&lt; &nbsp; &nbsp;</a>
									<a href="${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=${currentPage-1}">&lt; &nbsp; &nbsp;</a>
								</c:if>
								<span>[ ${currentPage} ]</span>
								<c:if test="${currentPage == lastPage}">
									<span> &nbsp; &nbsp;&gt;</span>
									<span> &nbsp; &nbsp;&gt;&gt;</span>
								</c:if>
								<c:if test="${currentPage != lastPage}">
									<a href="${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=${currentPage+1}"> &nbsp; &nbsp;&gt;</a>
									<a href="${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=${lastPage}"> &nbsp; &nbsp;&gt;&gt;</a>
								</c:if>
						
								<span >
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
										<span>개씩 보기</span>
									</form>
								</span>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>					
		</div>
	</div>
	<!-- /메인 -->
	
	<!-- Core JS -->
	<!-- build:js assets/vendor/js/core.js -->
	<jsp:include page="/inc/coreJS.jsp"></jsp:include>
	
</body>
</html>