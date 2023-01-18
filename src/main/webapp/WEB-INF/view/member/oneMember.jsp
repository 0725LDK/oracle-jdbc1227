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

<meta charset="UTF-8">
<title>MY PAGE</title>
</head>
<body>
	<div class="container-xxl">
			<div class="authentication-wrapper authentication-basic container-p-y">
				<div class="authentication-inner">
					<!-- 메인 -->
					<div class="card">
						<div class="card-body">
						              
							<h2 class="mb-2" style="text-align:center">My Page </h2><br>
							<h4 class="mb-2" style="text-align:center">ID : ${loginMember.memberId }</h4>
							<h4 class="mb-2" style="text-align:center">NAME : ${loginMember.memberName }</h4>
											
							<form id="formAuthentication" class="mb-3" action="index.html" method="POST">
							                
								<div class="mb-3">
									<a class="btn btn-primary d-grid w-100" href="${pageContext.request.contextPath}/member/modifyMember">Edit My Information</a>
								</div>
								<div class="mb-3">
									<a class="btn btn-primary d-grid w-100" href="${pageContext.request.contextPath}/member/removeMember">Delete My Account</a>
								</div>
								<div class="mb-3">
									<a class="btn btn-primary d-grid w-100" href="${pageContext.request.contextPath}/home">Go Home</a>
								</div>
							</form>
						</div>
					</div>
					<!-- /메인 -->
				</div>
			</div>
		</div>

	<!-- Core JS -->
	<!-- build:js assets/vendor/js/core.js -->
	<jsp:include page="/inc/coreJS.jsp"></jsp:include>

</body>
</html>