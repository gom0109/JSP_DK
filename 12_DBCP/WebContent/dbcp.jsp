<%@page import="java.sql.ResultSet"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
dbcp.jsp<br>
<%
	Connection conn = null;
	PreparedStatement ps = null;
	
	Context initContext =  new InitialContext();//초기설정정보를 읽어온다
	Context envContext =(Context)initContext.lookup("java:/comp/env");//java:/comp/env는 내부적으로 존재하는 폴더 이곳에 초기설정정보(Context.xml)를 집어넣는다.
	DataSource ds =  (DataSource)envContext.lookup("jdbc/OracleDB");//Context.xml의 내용중 jdbc/OracleDB 라는 이름을 가진 정보
	conn = ds.getConnection();
	/* 파일을 실행하면 Context.xml파일을 자동으로 읽는다 꼭 Context.로 파일명을 만들것 (초기설정정보@@@@@@@@) */
	System.out.println("conn : "+ conn);
	
	request.setCharacterEncoding("UTF-8");
	String username = request.getParameter("username");
	String email = request.getParameter("email");
	if(username != null){
		String sql = "insert into tdbcp values (?,?)";
		ps = conn.prepareStatement(sql);
		ps.setString(1, username);
		ps.setString(2, email);
		ps.executeUpdate();
	}
	
	
%>
<form name="myform" method="post" action="dbcp.jsp">
	
	이름 : <input type="text" name="username"><br>
	email : <input type="text" name="email"><br>
	
	<input type="submit" value="등록">
	

</form>
### 등록 목록 ###
<br>

<%
	
	String sql2 = "select * from tdbcp";
	ps = conn.prepareStatement(sql2);
	ResultSet rs =  ps.executeQuery();
	int i =1;
	while(rs.next()){
		out.print(i+ " : "+rs.getString("username") +" , "+ rs.getString("email") + "<br>");
		i++;
		
	}
		rs.close();
		ps.close();
		conn.close();
%>