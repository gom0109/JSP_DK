<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
select.jsp<br>
<table border="1" width = "500" height = "100">
	<tr style="text-align: center">
		<td>아이디</td>
		<td>패스워드</td>
		<td>이름</td>
		<td>성별</td>
		<td>email</td>
	</tr>

<%
	request.setCharacterEncoding("UTF-8");

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String id = "jspid";
	String pw = "jsppw";
	
	Class.forName(driver);
	
	Connection conn = DriverManager.getConnection(url, id, pw);
	String sql = "select * from register";
	PreparedStatement ps = conn.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
	while(rs.next()){
		String id2 =rs.getString("id");
		String passwd =rs.getString("passwd");
		String name =rs.getString("name");
		String gender =rs.getString("gender");
		String uname =rs.getString("uname");
		String dname =rs.getString("dname");
		%>
		<tr style="text-align: center">
			<td><%= id2%></td>
			<td><%= passwd%></td>
			<td><%= name%></td>
			<td><%= gender%></td>
			<td><%=uname+"@"+ dname%></td>
		</tr>
		<%
	}
	
%>
</table>