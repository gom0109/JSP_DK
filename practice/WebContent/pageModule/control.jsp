<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
control.jsp<br>
<%
	String list = request.getParameter("list");
	String pages;
	if(list.equals("1")){
		pages="java.jsp";
	}
	else if(list.equals("2")){
		pages="dataBase.jsp";
	}
	else{
		pages="Web.jsp";
	}
	
%>

<jsp:forward page="template.jsp">
	<jsp:param value="<%=pages%>" name="pages"/>
</jsp:forward>