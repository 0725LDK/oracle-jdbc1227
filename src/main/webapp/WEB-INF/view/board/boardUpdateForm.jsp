<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html
  lang="en"
  class="light-style customizer-hide"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="${pageContext.request.contextPath}/resource/assets/"
  data-template="vertical-menu-template-free"
>
<head>
	<!-- Link & script -->
	<jsp:include page="/inc/HTMLHead.jsp"></jsp:include>

<script>
	$(document).ready(function() {
		
		//게시글 수정시 유효성 검사
		$('#updateFormBtn').click(function()
				{
					if($('#boardTitle').val() == '')
					{
						alert('수정 할 글 제목을 입력하세요');
						$('#boardTitle').focus();
						return;
					}
					if($('#boardContent').val() == '')
					{
						alert('수정 할 글 내용을 입력하세요');
						$('#boardContent').focus();
						return;
					}
					$('#updateForm').submit();
					alert('게시글 수정 성공!');
				});
	});
</script>

<title>UPDATE BOARD</title>
</head>
<body>

<div class="container-xxl">
		<div class="authentication-wrapper authentication-basic container-p-y">
			<div class="authentication-inner">
				<!-- Register -->
				<div class="card">
					<div class="card-body">
						<h4 class="mb-2">Update Board</h4><br>
						<form id="updateForm" action="${pageContext.request.contextPath}/board/modifyBoard" method="post" class="mb-3" >
							<div class="mb-3">
								<label for="email" class="form-label">Number</label>
								<input
									class="form-control"
									type="text" name="boardNo" value="${boardNo}" readonly="readonly"
								/>
							</div>
							<div class="mb-3">
								<label for="email" class="form-label">Title</label>
								<input
									class="form-control"
									id="boardTitle" type="text" name="boardTitle"
								/>
							</div>
							<div class="mb-3">
								<label for="email" class="form-label">Content</label>
								<input
									class="form-control"
									type="text" name="boardContent" id="boardContent"
								/>
							</div>
							
							<div class="mb-3">
								<button class="btn btn-primary d-grid w-100" id="updateFormBtn" type="button">Update Board</button><br>
								<a class="btn btn-primary d-grid w-100"  href="${pageContext.request.contextPath}/board/boardOne?boardNo=${boardNo}">Go Board One</a>
							</div>
						</form>
					</div>
				</div>
				<!-- /Register -->
			</div>
		</div>
	</div>
	
	<!-- Core JS -->
	<!-- build:js assets/vendor/js/core.js -->
	<jsp:include page="/inc/coreJS.jsp"></jsp:include>







	<h1>BOARD UPDATE</h1>
	<form id="updateForm" action="${pageContext.request.contextPath}/board/modifyBoard" method="post">
		<table>
			<tr>
				<td>번호</td>
				<td><input type="text" name="boardNo" value="${boardNo}" readonly="readonly"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input id="boardTitle" type="text" name="boardTitle"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><input id="boardContent" type="text" name="boardContent"></td>
			</tr>
		</table>
		<button id="updateFormBtn" type="button">수정하기</button>
	</form>
</body>
</html>