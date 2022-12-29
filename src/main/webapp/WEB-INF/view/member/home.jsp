<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
			
			//로그아웃시 유효성 검사
			$('#logout').click(function()
					{
							alert('로그아웃 되었습니다.');
							return;
					});
		});
	</script>
	<c:if test="${msg == 0}">
		<script>
			alert('회원탈퇴 성공!');
		</script>
	</c:if>
	<title>HOME</title>
</head>
<body>
	<!--로그인 안했을때  -->
	<c:if test="${loginMember == null}">
		<div class="container-xxl">
			<div class="authentication-wrapper authentication-basic container-p-y">
				<div class="authentication-inner">
					<!-- 메인 -->
					<div class="card">
						<div class="card-body">
						              
							<h2 class="mb-2" style="text-align:center; color:#3F0099;">
								<p>Oracle DB를 이용한</p>
								<p>회원 및 게시글 CRUD</p>
								<p>Minimal Project</p>
							</h2><br>
							<h3 class="mb-2" style="text-align:center">Start Menu</h3>
											
							<form id="formAuthentication" class="mb-3" action="index.html" method="POST">
							                
								<div class="mb-3">
									<a class="btn btn-primary d-grid w-100" href="${pageContext.request.contextPath}/member/login">Login</a>
								</div>
								<div class="mb-3">
									<a class="btn btn-primary d-grid w-100" href="${pageContext.request.contextPath}/member/addMember">Create Account</a>
								</div>
							</form>
						</div>
					</div>
					<!-- /메인 -->
				</div>
			</div>
		</div>
	</c:if>

	<!-- 로그인 했을때 화면 -->	
	<c:if test="${loginMember != null}">
			<div class="container-xxl">
			<div class="authentication-wrapper authentication-basic container-p-y">
				<div class="authentication-inner">
					<!-- 메인 -->
					<div class="card">
						<div class="card-body">
							<h2 class="mb-2" style="text-align:center; color:#3F0099;">
								<p>Oracle DB를 이용한</p>
								<p>회원 및 게시글 CRUD</p>
								<p>Minimal Project</p>
							</h2><br>
							<h3 class="mb-2" style="text-align:center">Welcome! ${loginMember.memberId }</h3><br>
							<h4 class="mb-2" style="text-align:center">Member Menu</h4>
							<form id="formAuthentication" class="mb-3" action="index.html" method="POST">
							                
								<div class="mb-3">
									<a class="btn btn-primary d-grid w-100" href="${pageContext.request.contextPath}/board/boardList?memberId=${loginMember.memberId}">Board List</a>
								</div>
								<div class="mb-3">
									<a class="btn btn-primary d-grid w-100" href="${pageContext.request.contextPath}/member/memberOne?memberId=${loginMember.memberId}">My Page</a>
								</div>
								<div class="mb-3">
									<a class="btn btn-primary d-grid w-100" id="logout" href="${pageContext.request.contextPath}/member/logout">Logout</a>
								</div>
							</form>
						</div>
					</div>
					<!-- 메인 -->
				</div>
			</div>
		</div>
	</c:if>
	
	<!-- Core JS -->
	<!-- build:js assets/vendor/js/core.js -->
	<jsp:include page="/inc/coreJS.jsp"></jsp:include>
</body>
</html>