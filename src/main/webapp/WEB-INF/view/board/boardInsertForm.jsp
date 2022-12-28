<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
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
				});
		});
</script>
</head>
<body>
	<h1>BOARD ADD</h1>
	<form id="addForm" action="${pageContext.request.contextPath}/board/addBoard" method="post">
		<table>
			<tr>
				<td>글 제목</td>
				<td><input type="text" name="boardTitle" id="boardTitle"></td>
			</tr>
			<tr>
				<td>글 내용</td>
				<td><input type="text" name="boardContent" id="boardContent"></td>
			</tr>
		</table>
		<button id="BoardAddBtn" type="button">작성하기</button>
	</form>
</body>
</html>