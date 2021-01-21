<%@page import="myPkg.SimpleBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex01_result.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
	String message = request.getParameter("message");
	SimpleBean sb = new SimpleBean();
	sb.setMsg(message);
	String msg = sb.getMsg();
%>

message : <%=message%>
msg : <%=msg%>