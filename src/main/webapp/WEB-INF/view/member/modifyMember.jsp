<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html
  lang="en"
  class="light-style customizer-hide"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="<%=request.getContextPath()%>/resource/assets/"
  data-template="vertical-menu-template-free"
>
<head>
	<!-- Link & script -->
	<jsp:include page="/inc/HTMLHead.jsp"></jsp:include>

	<script>
		$(document).ready(function() {
			
			//회원정보 수정시 유효성 검사
			$('#modifyMemberFormBtn').click(function()
					{
						if($('#memberName').val() == '')
						{
							alert('수정할 이름을 입력하세요');
							$('#memberName').focus();
							return;
						}
						
						$('#modifyMemberForm').submit();
						alert('회원정보 수정 성공!');
					});
		});
	</script>
	<title>EDIT MY INFO</title>
</head>
<body>

	<div class="container-xxl">
		<div class="authentication-wrapper authentication-basic container-p-y">
			<div class="authentication-inner">
				<!-- Register -->
				<div class="card">
					<div class="card-body">
						<h4 class="mb-2">Edit My Information</h4><br>
						<form id="modifyMemberForm" action="${pageContext.request.contextPath}/member/modifyMember" method="post" class="mb-3" >
							<div class="mb-3">
								<label for="email" class="form-label">User Name</label>
								<input
									class="form-control"
									type="text" name="memberId" value="${loginMember.memberId }" readonly="readonly"
								/>
							</div>
							
							<div class="mb-3">
								<label for="email" class="form-label">Edit User Name</label>
								<input
									class="form-control"
									placeholder="Edit User Name"
									id="memberName" type="text" name="memberName"
								/>
							</div>
							<div class="mb-3">
								<button class="btn btn-primary d-grid w-100" id="modifyMemberFormBtn" type="button">Edit My Information!</button>
							</div>
						</form>
					</div>
				</div>
				<!-- /Register -->
			</div>
		</div>
	</div>




	<h1>회원정보 수정</h1>
	<form id="modifyMemberForm" action="${pageContext.request.contextPath}/member/modifyMember" method="post">
		<table>
			<tr>
				<td>ID : </td>
				<td><input type="text" name="memberId" value="${loginMember.memberId }" readonly="readonly"></td>
			</tr>
			<tr>
				<td>Name : </td>
				<td><input id="memberName" type="text" name="memberName"></td>
			</tr>
		</table>
		<button id="modifyMemberFormBtn" type="button">수정하기</button>
	</form>
	
	
	
	<!-- Core JS -->
	<!-- build:js assets/vendor/js/core.js -->
	<jsp:include page="/inc/coreJS.jsp"></jsp:include>
	
</body>
</html>