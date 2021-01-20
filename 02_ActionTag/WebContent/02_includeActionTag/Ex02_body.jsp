<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex02_body.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
	/* String nickname = request.getParameter("nickname"); */
	String name = request.getParameter("name");
	String pw = request.getParameter("pw");
	String nickname = request.getParameter("nickname");
%>
<%-- nickname : <%=nickname%> --%>
이름 : <%= name%><br>
비번: <%= pw%><br>
닉넴: <%= nickname%><br>