<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>LOGIN</title>
<c:if test="${msg == 0 }">
	<script>
		alert('ID와 PW가 맞지 않습니다.');
	</script>
</c:if>
<script>
	$(document).ready(function() {
		
		//로그인시 유효성 검사
		$('#loginFormBtn').click(function()
				{
					if($('#memberId').val() == '')
					{
						alert('아이디를 입력하세요');
						$('#memberId').focus();
						return;
					}
					if($('#memberPw').val() == '')
					{
						alert('비밀번호를 입력하세요');
						$('#memberPw').focus();
						return;
					}
					$('#loginForm').submit();
				});
	});
</script>
</head>

<body>
	<div class="container-xxl">
		<div class="authentication-wrapper authentication-basic container-p-y">
			<div class="authentication-inner">
				<!-- Register -->
				<div class="card">
					<div class="card-body">
						<h4 class="mb-2">LOGIN</h4><br>
						<form id="loginForm" action="${pageContext.request.contextPath}/member/login" method="post" class="mb-3" >
							<div class="mb-3">
								<label for="email" class="form-label">Email or Username</label>
								<input
									class="form-control"
									placeholder="Enter your email or username"
									id="memberId" type="text" name="memberId"
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
								<button class="btn btn-primary d-grid w-100" id="loginFormBtn" type="button">Login</button><br>
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