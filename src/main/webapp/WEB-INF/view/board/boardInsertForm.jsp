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
		//board 추가시 유효성 겁사
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
					alert('게시글 추가 성공!');
				});
		});
</script>
<title>ADD BOARD</title>
</head>
<body>

	<div class="container-xxl">
		<div class="authentication-wrapper authentication-basic container-p-y">
			<div class="authentication-inner">
				<!-- Register -->
				<div class="card">
					<div class="card-body">
						<h4 class="mb-2">Add Board</h4><br>
						<form id="addForm" action="${pageContext.request.contextPath}/board/addBoard" method="post" class="mb-3" >
							<div class="mb-3">
								<label for="email" class="form-label">User</label>
								<input
									class="form-control"
									type="text" name="memberId" id="memberId" value="${memberId }" readonly="readonly"
								/>
							</div>
							<div class="mb-3">
								<label for="email" class="form-label">Title</label>
								<input
									class="form-control"
									type="text" name="boardTitle" id="boardTitle"
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
								<button class="btn btn-primary d-grid w-100"  id="BoardAddBtn" type="button">Add Board</button><br>
								<a class="btn btn-primary d-grid w-100" href="${pageContext.request.contextPath}/board/boardList">Go Board List</a>
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
	
</body>
</html>