<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
comp_forward.jsp<br>

<jsp:forward page="templateTest.jsp">
	<jsp:param value="comp.jsp" name="contentPage"/>
</jsp:forward>