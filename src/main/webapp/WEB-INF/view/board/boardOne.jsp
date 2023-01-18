<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html
  lang="en"
  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="${pageContext.request.contextPath}/resource/assets/"
  data-template="vertical-menu-template-free"
>
<head>
	<jsp:include page="/inc/HTMLHead.jsp"></jsp:include>
	
<script>
	$(document).ready(function() {
		
		//게시글 삭제시 alert
		$('#removeBoard').click(function()
				{
					if(confirm("정말로 삭제 하시겠습니까?") == true)
					{
						alert('게시글 삭제 성공!');
						return;						
					}
					else
					{
						return false;	
					}
			
				});
	});
</script>

<style>

th{
	font-size : 50px;
	color:red;
}
</style>

<title>BOARD ONE</title>
</head>
<body>
	<div class="container-xxl flex-grow-1 container-p-y">
		<h1>BOARD ONE</h1>
		
		<!-- 작성 아이디와 접속 아이디가 같을 경우 수정/삭제 버튼 활성화 -->
		<c:set var="BMemberId" value="${board.memberId}"></c:set>
		<c:set var="LMemberId" value="${loginMember.memberId}"></c:set>
		
		<c:if test="${BMemberId eq  LMemberId}">
			<a class="btn rounded-pill btn-primary" href="${pageContext.request.contextPath}/board/modifyBoard?boardNo=${board.boardNo}">Edit</a>
			<a class="btn rounded-pill btn-primary" id="removeBoard" href="${pageContext.request.contextPath}/board/removeBoard?boardNo=${board.boardNo}">Delete</a>
		</c:if>
		<a class="btn rounded-pill btn-primary" href="${pageContext.request.contextPath}/board/boardList">Go Board List</a>
		<a class="btn rounded-pill btn-primary" href="${pageContext.request.contextPath}/home">Go Home</a>
		
		<br><br>
		<!-- Hoverable Table rows -->
		<div class="card">
			
			<div class="table-responsive text-nowrap">
				<table class="table table-hover">
					<thead>
						<tr>
							<th style="font-size : 15px;">Number</th>	
							<th style="font-size : 15px;">Title</th>	
							<th style="font-size : 15px;">Content</th>	
							<th style="font-size : 15px;">User</th>	
							<th style="font-size : 15px;">Update Date</th>	
							<th style="font-size : 15px;">Create Date</th>	
						</tr>
					</thead>
					<tbody class="table-border-bottom-0">
						<tr>
							<td>${board.boardNo }</td>
							<td>${board.boardTitle }</td>
							<td>${board.boardContent }</td>
							<td>${board.memberId }</td>
							<td>${board.updatedate }</td>
							<td>${board.createdate }</td>
						</tr>
					</tbody>
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