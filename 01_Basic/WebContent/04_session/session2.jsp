<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
session2.jsp<br><br>

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	out.print("id : "+ id+"<br>");
	String pw = request.getParameter("pw");
	out.print("pw : "+ pw+"<br>");
	String sports = request.getParameter("sports");
	out.print("sports : "+ sports+"<br>");
	String game = request.getParameter("game");
	out.print("game : "+ game+"<br>");
	Object sid = session.getAttribute("id");
	Object spw = session.getAttribute("pw");
	out.print("<hr>");
	if(sid!=null){
		/* String sid = (String) session.getAttribute("id"); */
		out.print("sid : "+ sid+"<br>");
		out.print("spw : "+ spw+"<br>");
		
		 session.invalidate();//세션 무효화
		
	}
	else{
		out.print("로그인을 해주세요");
	}
	
%>
