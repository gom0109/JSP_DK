<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
deleteProc.jsp<br>
  
<%
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String id = "jspid";
	String pw = "jsppw";

	request.setCharacterEncoding("UTF-8");
	String id2 = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, id, pw);
	String sql = "select * from register where id = ?";
	PreparedStatement ps =  conn.prepareStatement(sql);
	ps.setString(1, id2);
	ResultSet rs =  ps.executeQuery();
	if(rs.next()){
		String rspasswd = rs.getString("passwd");
		if(passwd.equals(rspasswd)){
			sql = "delete from register where id = ?";
			ps =  conn.prepareStatement(sql);
			ps.setString(1, id2);
			int count = ps.executeUpdate();
			if(count != 1){
				out.print("삭제 실패");
			}else{
				out.print(count+ "삭제 성공");
				%><meta http-equiv="refresh" content="2; url = select.jsp">  <%
			}
			
		}else{
			out.print("잘못된 비밀번호입니다.");
			%><meta http-equiv="refresh" content="2; url = deleteForm.jsp">  <%
		}
	}else{
		out.print("존재하지 않는 아이디입니다.");
		%><meta http-equiv="refresh" content="2; url = deleteForm.jsp">  <%
	}
	
%>

















