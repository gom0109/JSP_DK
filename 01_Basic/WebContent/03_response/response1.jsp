<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
response1.jsp <br>

<% 
	request.setCharacterEncoding("UTF-8");
	String msg = request.getParameter("msg");
	out.print("msg : "+msg);
	System.out.println("msg : "+msg);	
	session.setAttribute("msg",msg);
	response.sendRedirect("response2.jsp?msg="+msg);//현재페이지를 거처가는 페이지로만든다.
%>
