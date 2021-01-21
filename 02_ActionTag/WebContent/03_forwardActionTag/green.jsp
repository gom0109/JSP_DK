<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
green.jsp<br>
<%
	
String name = request.getParameter("name");
String color = request.getParameter("color");

%>
이름 :
<%=name%><br>
색상 :
<%=color%><br>
<img src="../images/<%=color%>.jpg">