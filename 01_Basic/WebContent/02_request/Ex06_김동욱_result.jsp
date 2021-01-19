<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	out.print("name : "+name+"<br>");
	String address = request.getParameter("address");
	out.print("address : "+address+"<br>");
	String season = request.getParameter("season");
	out.print("season : "+season+"<br>");
	
	String [] movie = request.getParameterValues("movie");
	out.print("movie : ");
	for(int i =0; i<movie.length;i++){
		out.print(movie[i]+" ");
	}
	out.print("<br>");
	String [] fruit = request.getParameterValues("fruit");
	out.print("fruit : ");
	for(int i =0; i<fruit.length;i++){
		out.print(fruit[i]+" ");
	}
%>
<br>
<hr>
<br>
<%
	Enumeration<String> e =request.getParameterNames();
	while(e.hasMoreElements()){
		String names = e.nextElement();
		out.print(names + " : ");
		String [] values = request.getParameterValues(names);
		for(int i=0;i<values.length;i++){
			out.print(values[i]+" ");
		}
		out.print("<br>");
	}



%>
