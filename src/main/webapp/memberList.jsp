<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	//1) controller
	int currentPage = 1;
	if(request.getParameter("currentPage")!=null)
	{
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	int rowPerPage = 5;

	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","gdj58","java1234");
	System.out.println("오라클 접속 성공");
	
	String sql = "select t2.rnum rnum, t2.name name";
	sql +=	" from";
	sql +=	" (select rownum rnum, t.member_name name";
	sql +=	" from";
	sql +=	" (select member_name";
	sql +=	" from member";
	sql +=	" order by member_name asc) t) t2";
	sql +=	" where rnum between ? and ?";
	
	PreparedStatement stmt = conn.prepareStatement(sql);
	
	int beginRow = (currentPage-1) * rowPerPage +1;
	int endRow = currentPage * rowPerPage;
	stmt.setInt(1,beginRow);
	stmt.setInt(2,endRow);
	
	ResultSet rs = stmt.executeQuery();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>멤버 이름 목록(페이징)</h1>
	<table>
		<tr>
			<td>번호</td>
			<td>이름</td>
		</tr>
		
		<%
			while(rs.next())
			{
		%>
				<tr>
					<td><%=rs.getInt("rnum") %></td>
					<td><%=rs.getString("name") %></td>
				</tr>
		<%
			}
		%>
	</table>
	<a href="<%=request.getContextPath()%>/memberList.jsp?currentPage=<%=currentPage-1 %>">이전</a>
	<a href="<%=request.getContextPath()%>/memberList.jsp?currentPage=<%=currentPage+1 %>">다음</a>
</body>
</html>