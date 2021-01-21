<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex01_result.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String age = request.getParameter("age");
	String gender = request.getParameter("gender");
%>

아이디 : <%=id%><br>
패스워드 : <%=password%><br>
나이 : <%=age%><br>
성별 : <%=gender%>