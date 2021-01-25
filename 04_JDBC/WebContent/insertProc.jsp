
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
insertProc.jsp<br>
<%
	request.setCharacterEncoding("UTF-8");

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String id = "jspid";
	String pw = "jsppw";
	Timestamp reg = new Timestamp(System.currentTimeMillis());
	/* 1970.1.1자정~현재  long타입으로계산 */
	
	Class.forName(driver);
	
	Connection conn = DriverManager.getConnection(url, id, pw);
	String id2 = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	
	String sql = "insert into member values(?,?,?,?)";
	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setString(1,id2);
	ps.setString(2,passwd);
	ps.setString(3,name);
	ps.setTimestamp(4,reg);
	
	int count = ps.executeUpdate();
	if(count != 0){
		out.print("레코드 삽입 성공");
	}
	
%>





