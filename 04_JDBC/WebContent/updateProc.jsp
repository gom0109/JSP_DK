<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updateProc.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String id2 = "jspid";
	String pw = "jsppw";
	ResultSet rs =null;
	PreparedStatement ps = null;
	Class.forName(driver);
	
	Connection conn = DriverManager.getConnection(url, id2, pw);
	
	//String sql = "update member set name = ? where id= ? and passwd = ?";
	
	String sql = "select * from member where id = ?";
	ps = conn.prepareStatement(sql);
	ps.setString(1, id);
	rs = ps.executeQuery();
	if(rs.next()){
		String dbpasswd = rs.getString("passwd");
		if(dbpasswd.equals(passwd)){
			String sql2 = "update member set name = ? where id= ?";
			ps = conn.prepareStatement(sql2);
			ps.setString(1, name);
			ps.setString(2, id);
			int count = ps.executeUpdate();
			if(count != 1){
				out.print("업데이트에 실패했습니다");
			}else{
				out.print("업데이트에 성공했습니다.");
			}
		}
		else{
			out.print("패스워드가 다릅니다.");
		}
	}else{
		out.print("없는 아이디 입니다.");
	}

%>








