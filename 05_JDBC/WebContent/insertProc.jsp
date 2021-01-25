<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
insertProc.jsp
<br>

<%
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String id = "jspid";
	String pw = "jsppw";
	Class.forName(driver);

	Connection conn = DriverManager.getConnection(url, id, pw);
	request.setCharacterEncoding("UTF-8");
	String id2 = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String uname = request.getParameter("uname");
	String dname = request.getParameter("dname");
	
	String sql = "insert into register values (?,?,?,?,?,?)";
	PreparedStatement ps  = conn.prepareStatement(sql);
	ps.setString(1, id2);
	ps.setString(2, passwd);
	ps.setString(3, name);
	ps.setString(4, gender);
	ps.setString(5, uname);
	ps.setString(6, dname);
	int count = ps.executeUpdate();
	if(count !=1){
		out.print("삽입실패");
	}
	else{
		out.print("삽입성공");
	
	}
	//response.sendRedirect("select.jsp");
	//http://localhost:8080/05_JDBC/select.jsp
	
%>
<meta http-equiv="refresh" content="2; url = select.jsp" >
<!-- 2초후 select.jsp실행 -->
<%-- <jsp:forward page="select.jsp"></jsp:forward> --%>
<!-- http://localhost:8080/05_JDBC/insertProc.jsp -->








