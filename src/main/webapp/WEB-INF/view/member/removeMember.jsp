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
		
		//회원탈퇴시 유효성 검사
		$('#removeMemberBtn').click(function()
				{
					if($('#memberPw').val() == '')
					{
						alert('비밀번호를 입력하세요');
						$('#memberPw').focus();
						return;
					}
					$('#removeMemberForm').submit();
				});
	});
</script>

<title>DELETE MY ACCOUNT</title>
</head>
<body>


	<div class="container-xxl">
		<div class="authentication-wrapper authentication-basic container-p-y">
			<div class="authentication-inner">
				<!-- Register -->
				<div class="card">
					<div class="card-body">
						<h4 class="mb-2">Delete My Account</h4><br>
						<form id="removeMemberForm" action="${pageContext.request.contextPath}/member/removeMember" method="post" class="mb-3" >
							<div class="mb-3">
								<label for="email" class="form-label">User Name</label>
								<input
									class="form-control"
									type="text" name="memberId" value="${loginMember.memberId }" readonly="readonly"
								/>
							</div>
							<div class="mb-3 form-password-toggle">
								<div class="d-flex justify-content-between">
									<label class="form-label" for="password">Password</label>
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
								<button class="btn btn-primary d-grid w-100" id="removeMemberBtn" type="button">Delete My Account</button>
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