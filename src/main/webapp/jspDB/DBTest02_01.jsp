<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.marondal.common.MysqlService" %>    
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기</title>
</head>
<body>

	<%
		MysqlService mysqlService = MysqlService.getInstance();
		mysqlService.connect();
		
		String query = "SELECT * FROM `favorite`";
		ResultSet resultSet = mysqlService.select(query);
	
	%>


	<table border="1">
		<thead>
			<tr>
				<th>사이트</th>
				<th>사이트 주소</th>			
			</tr>
		</thead>
		
		<tbody>
			<% while(resultSet.next()) { %>
			<tr>
				<td><%=resultSet.getString("name") %></td>
				<td><%=resultSet.getString("url") %></td>
			</tr>
			<% } %>			
		</tbody>
	
	</table>
	
	
	
</body>
</html>