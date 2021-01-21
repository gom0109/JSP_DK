<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
template.jsp<br>
<%
	String pages = request.getParameter("pages");
	
%>

<table border="1">
<tr>
	<td colspan="2">게시판</td>
</tr>
<tr>
	<td><jsp:include page="list.jsp"></jsp:include></td>
	<td><jsp:include page="<%=pages%>"></jsp:include></td>
</tr>
</table>