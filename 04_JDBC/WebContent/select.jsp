<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
select.jsp<br>

<table border="1">
	<tr>
		<td>아이디</td>
		<td>패스워드</td>
		<td>이름</td>
		<td>가입일자</td>
	</tr>
<%
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String id = "jspid";
	String pw = "jsppw";
	
	//드라이버 로드
	Class.forName(driver);
	//계정 접속-예외처리를 알아서 해준다!!!!
	Connection conn = DriverManager.getConnection(url, id, pw);
	
	String sql = "select * from member order by passwd";
	PreparedStatement ps = conn.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
	
	while(rs.next()){
		String id2 = rs.getString("id");
		String passwd = rs.getString("passwd");
		String name = rs.getString("name");
		String reg_date = String.valueOf(rs.getDate("reg_date"));
		//out.print(id2+" "+passwd+" "+name+" "+reg_date+"<br>");
		%>
		<tr>
			<td><%=id2 %></td>
			<td><%=passwd %></td>
			<td><%=name %></td>
			<td><%=reg_date %></td>
		</tr>
		<%
	}
%>
</table>









