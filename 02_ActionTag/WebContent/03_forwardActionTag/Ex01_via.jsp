<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex01_via.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");

%>

아이디 : <%=id%><br>
패스워드 : <%=password%>
<%
	System.out.println("아이디 : "+id+"\n패스워드 : "+password);
%>
<%-- <%
	response.sendRedirect("Ex01_result.jsp");
	원래 사용방법
%> --%>

<jsp:forward page="Ex01_result.jsp">
	<jsp:param value="20" name="age"/>
	<jsp:param value="여" name="gender"/>
</jsp:forward>