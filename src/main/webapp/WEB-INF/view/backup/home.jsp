<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		
		//회원탈퇴시 유효성 검사
		$('#logout').click(function()
				{
						alert('로그아웃 되었습니다.');
						return;
				});
	});
</script>
</head>
<body>
	<c:if test="${loginMember == null}">
		<h1>Oracle DB를 이용한 회원 및 게시글 CRUD 미니 프로젝트 </h1>
		<h3>로그인 전 페이지</h3>
		
		<div>
			<a href="${pageContext.request.contextPath}/member/login">로그인</a>
			<a href="${pageContext.request.contextPath}/member/addMember">회원가입</a>
		</div>
		
		
	</c:if>
	
	<c:if test="${loginMember != null}">
		<h1>Oracle DB를 이용한 회원 및 게시글 CRUD 미니 프로젝트 </h1>
		<h3>로그인 후 페이지</h3>
		<div>
			<span>${loginMember.memberId }님 반갑습니다.</span>
		</div>
		<div>
			<a href="${pageContext.request.contextPath}/board/boardList?memberId=${loginMember.memberId}">게시판 리스트</a>
			<a href="${pageContext.request.contextPath}/member/memberOne?memberId=${loginMember.memberId}">회원정보 보기</a>
			<a id="logout" href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
		</div>
	</c:if>
</body>
</html>