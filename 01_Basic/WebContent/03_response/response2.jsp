<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
response2.jsp <br>
<% 
	request.setCharacterEncoding("UTF-8");
	//response1.jsp과 request객체를 서로 공유하지않는다. 서로 다른내용을 담고있다.
	String msg = request.getParameter("msg");
	out.print("msg : "+msg);
	System.out.println("msg : "+msg);	
	Object smsg = session.getAttribute("msg");
	out.print("<hr>"+smsg);
	Object sid = session.getAttribute("id");
	out.print("<hr>"+sid);
%>