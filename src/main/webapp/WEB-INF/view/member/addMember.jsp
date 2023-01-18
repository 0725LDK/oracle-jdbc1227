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
			
			//회원가입시 유효성 검사
			$('#addMemberFormBtn').click(function()
					{
						if($('#memberId').val() == '')
						{
							alert('ID를 입력하세요');
							$('#memberId').focus();
							return;
						}
						if($('#memberPw').val() == '')
						{
							alert('PW를 입력하세요');
							$('#memberPw').focus();
							return;
						}
						
						if($('#memberName').val() == '')
						{
							alert('이름을 입력하세요');
							$('#memberName').focus();
							return;
						}
						
						$('#addMemberForm').submit();
						alert('회원가입 성공! 로그인 하세요');
					});
		});
	</script>
	<title>CREATE ACCOUNT</title>
</head>
<body>
	<div class="container-xxl">
		<div class="authentication-wrapper authentication-basic container-p-y">
			<div class="authentication-inner">
				<!-- Register -->
				<div class="card">
					<div class="card-body">
						<h4 class="mb-2">Create Account</h4><br>
						<form id="addMemberForm" action="${pageContext.request.contextPath}/member/addMember" method="post" class="mb-3" >
							<div class="mb-3">
								<label for="email" class="form-label">NEW Email or User Name</label>
								<input
									class="form-control"
									placeholder="Enter your email or username"
									id="memberId" type="text" name="memberId"
								/>
							</div>
							<div class="mb-3 form-password-toggle">
								<div class="d-flex justify-content-between">
									<label class="form-label" for="password">NEW Password</label>
								</div>
								<div class="input-group input-group-merge">
										<input
											class="form-control"
											id="memberPw" type="password" name="memberPw"
											placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;"
										/>
								</div>
							</div>
							<div class="mb-3">
								<label for="email" class="form-label">NEW User Name</label>
								<input
									class="form-control"
									placeholder="User Name"
									id="memberName" type="text" name="memberName"
								/>
							</div>
							<div class="mb-3">
								<button class="btn btn-primary d-grid w-100" id="addMemberFormBtn" type="button">Create Account!</button><br>
								<a class="btn btn-primary d-grid w-100" href="${pageContext.request.contextPath}/home">Go Home</a>
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