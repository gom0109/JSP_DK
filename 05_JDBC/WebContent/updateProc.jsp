<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updateProc.jsp<br>

<%
String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:orcl";
String id = "jspid";
String pw = "jsppw";

request.setCharacterEncoding("UTF-8");

String sid = (String)session.getAttribute("sid");
String passwd = request.getParameter("passwd");
String gender = request.getParameter("gender");
String uname = request.getParameter("uname");
String dname = request.getParameter("dname");

Class.forName(driver);
Connection conn = DriverManager.getConnection(url, id, pw);

	String sql = "update register set passwd = ? , gender=? , uname=? , dname=? where id = ?";
	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setString(1, passwd);
	ps.setString(2, gender);
	ps.setString(3, uname);
	ps.setString(4, dname);
	ps.setString(5, sid);
	int count =ps.executeUpdate();
	if(count != 1){
		
		out.print("업데이트 실패<br>");
		
		%>
		<meta http-equiv="refresh" content="2; url = updateForm.jsp" ><%
	}else{
		out.print("업데이트 성공");%>
		<meta http-equiv="refresh" content="2; url = select.jsp" ><%
	}



%>












