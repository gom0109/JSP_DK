<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
deleteProc.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String id2 = "jspid";
	String pw = "jsppw";
	PreparedStatement ps =null;
	ResultSet rs = null;
	Class.forName(driver);
	
	Connection conn = DriverManager.getConnection(url, id2, pw);
	String sql = "select * from member where id = ?";
	ps = conn.prepareStatement(sql);
	ps.setString(1, id);
	rs = ps.executeQuery();
	if(rs.next()){
		String rspasswd = rs.getString("passwd");
		if(rspasswd.equals(passwd)){
			String sql2 = "delete from member where id = ?";
			ps = conn.prepareStatement(sql2);
			ps.setString(1, id);
			int count = ps.executeUpdate();
			if(count !=1){
				out.print("삭제 실패");
			}
			else{
				out.print("삭제 성공");
			}
		}else{
			out.print("잘못된 비밀번호입니다.");
		}
	}else{
		out.print("아이디가 존재하지 않습니다.");
	}
	
%>








