<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex02_result.jsp<br>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String pw = request.getParameter("pw");
	
	

%>

이름 : <%= name%><br>
비번: <%= pw %><br>

<jsp:include page="Ex02_body.jsp">
	<jsp:param value="<%=name + \"피겨여왕\" %>" name="nickname"/>
</jsp:include>
<hr>