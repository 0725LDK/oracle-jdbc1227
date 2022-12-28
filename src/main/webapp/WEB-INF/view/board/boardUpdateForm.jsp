<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
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

</head>
<body>
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